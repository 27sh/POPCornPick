<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Movies</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/mainMovieList.css">
<script src="/js/mainMovieList.js"></script>
<style>
    #event-high-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    #event-high-container button {
        position: absolute;
        left: 941px;
    }
    #event-h1 {
        font-size: 30px;
        font-weight: bold;
        padding: 10px;
        margin-top: 10px;
    }
    #event-row-container {
        display: flex;
        flex-wrap: wrap;
    }
    .event-content-box {
        width: 460px;
        margin: 10px 0 10px 47.5px;
        position: relative; /* 추가 */
    }
    .event-content-box::before { /* 추가된 부분 */
        content: '';
        width: 460px;
        height: 81%;
        background-image: url('/img/event_cover.png'); /* 배경 이미지 추가 */
        position: absolute;
        border-radius: 10px; /* 둥근 모서리 적용 */
        border: 1px solid #ffffff;
        z-index: 1; /* 기존 콘텐츠 위에 도형이 겹치지 않도록 설정 */
    }
    .event-content-box img {
        width: 350px;
        height: 200px;
        margin-bottom: 10px; /* img와 title 사이에 여백 추가 */
        border-radius: 10px; /* 둥근 모서리 적용 */
        border: 1px solid #c1c1c1;
    }
    .event-content-box p:nth-of-type(1) {
        font-weight: bold; /* 이벤트 제목 글자 굵게 */
    }
    .event-content-box p:nth-of-type(2) {
        font-size: 0.8em; /* 날짜 글자 크기 작게 */
    }
    .event-pagination {
        margin-top: 20px;
    }
    .event-pagination button {
        padding: 10px;
        margin: 5px;
        background: none; /* 배경색 제거 */
	    border: none;
    }
    #event-prev-page {
        position: absolute; /* 추가 */
        left: 0; /* 추가 */
        top: 140px;
    }
    #event-next-page {
        position: absolute; /* 추가 */
        right: 120px; /* 추가 */
        top: 140px;
    }
    
    .hidden {
        display: none;
    }
</style>
</head>
<body>
<%@ include file="../layout/header.jsp" %>

<div id="base-section">
    <div id="main-box1">
        <button id="movie-chart-btn" class="active">무비차트</button>
        <div id="button-divider"></div>
        <button id="to-be-screened-btn">상영예정작</button>
        <button id="go-to-movieList">전체보기 ></button>
        <div id="movie-chart-container">
            <div id="movie-chart">
                <!-- 영화 목록이 여기에 추가됩니다. -->
            </div>
            <div class="pagination">
                <button id="prev-page" class="hidden" onclick="prevPage()"><img src="/img/arrowL.png" alt="이전"></button>
                <button id="next-page" class="hidden" onclick="nextPage()"><img src="/img/arrowL.png" alt="다음" style="transform: rotate(180deg);"></button>
            </div>
        </div>
    </div>
</div>
<main>
<div class="event">
</div>
    <div id="event-high-container">
        <h1 id="event-h1">EVENT</h1>
        <button id="go-to-movieList">전체보기 ></button>
    </div>
    
    <div id="event-row-container">
        <!-- 이벤트 컨텐츠가 여기에 추가됩니다. -->
    </div>
    <div id="event-pagination" class="event-pagination">
        <button id="event-prev-page" class="hidden" onclick="eventPrevPage()"><img src="/img/arrowL.png" alt="이전"></button>
        <button id="event-next-page" class="hidden" onclick="eventNextPage()"><img src="/img/arrowL.png" alt="다음" style="transform: rotate(180deg);"></button>
    </div>
</main>

<footer>
    <!-- 푸터 내용 -->
</footer>

<script>
$(document).ready(function() {
    let currentPage = 1;
    const itemsPerPage = 2;
    let events = [];

    function renderEvents() {
        let eventRowContainer = $('#event-row-container');
        eventRowContainer.empty();
        
        let start = (currentPage - 1) * itemsPerPage;
        let end = start + itemsPerPage;

        let paginatedEvents = events.slice(start, end);

        paginatedEvents.forEach(function(event) {
            let startDate = new Date(event.startEvent).toLocaleDateString();
            let endDate = new Date(event.endEvent).toLocaleDateString();

            const eventContentBox = document.createElement('div');
            eventContentBox.className = 'event-content-box';
            eventContentBox.innerHTML = 
                '<img src="/img/' + event.eventFile + '" class="event-img" alt="Event Image">'
                + '<p>' + event.eventTitle + '</p>'
                + '<p>' + startDate + ' - ' + endDate + '</p>';

            eventRowContainer.append(eventContentBox);
        });

        $('#event-prev-page').toggleClass('hidden', currentPage === 1);
        $('#event-next-page').toggleClass('hidden', end >= events.length);
    }

    function eventPrevPage() {
        if (currentPage > 1) {
            currentPage--;
            renderEvents();
        }
    }

    function eventNextPage() {
        if (currentPage * itemsPerPage < events.length) {
            currentPage++;
            renderEvents();
        }
    }

    $.ajax({
        url: 'http://localhost:9001/api/v1/main/events',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if (Array.isArray(response)) {
                events = response;
                renderEvents();
            } else {
                console.error('Response is not an array');
            }
        },
        error: function(error) {
            console.error('Error fetching events:', error);
        }
    });

    // 이벤트 핸들러 등록
    $('#event-prev-page').on('click', eventPrevPage);
    $('#event-next-page').on('click', eventNextPage);
});
</script>

</body>
</html>
