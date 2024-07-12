<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>All Movies</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<!-- jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/mainMovieList.css">
<link rel="stylesheet" href="/css/mainEventList.css">
<script src="/js/mainMovieList.js"></script>
<script src="/js/mainEventList.js"></script>
<!-- YouTube IFrame Player API 추가 -->
<script src="https://www.youtube.com/iframe_api"></script>
<style>
    /* 필요에 따라 스타일 추가 */
</style>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<div id="top-section">
    <div id="youtube-trailer">
        <div id="ytplayer"></div>
    </div>
</div>
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
    <div class="event"></div>
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
    var player;

    // 유튜브 API가 로드되면 실행되는 함수
    function onYouTubeIframeAPIReady() {
        player = new YT.Player('ytplayer', {
            videoId: 'T9uolHEOqFg', // YouTube 동영상 ID
            playerVars: {
                'autoplay': 1,
                'mute': 1, // 무음으로 설정
                'controls': 0, // 제어 바 숨기기
                'modestbranding': 1, // YouTube 로고 최소화
                'rel': 0, // 관련 동영상 표시 안함
                'iv_load_policy': 3 // 자막 숨기기
            },
            events: {
                'onReady': onPlayerReady
            }
        });
    }

    // 플레이어가 준비되면 호출되는 함수
    function onPlayerReady(event) {
        event.target.playVideo(); // 동영상 자동 재생
    }

    // 사용자가 클릭 시 음소거 해제
    $(document).ready(function() {
        $('#ytplayer').on('click', function() {
            player.unMute();
        });
    });
</script>

</body>
</html>
