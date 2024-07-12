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
    #youtube-trailer {
        position: relative;
        background-color: black;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 100%;
        height: 450px;
    }
    #ytplayer {
        width: 100%; /* 원하는 너비로 조정 */
        height: 100%;
        z-index: 1;
    }
    .overlay-block {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: transparent;
        z-index: 2;
        display: flex;
        justify-content: space-between;
    }
    
    #yt-inner-block-left {
    	width: 23%;
    	color: black;
    	background: linear-gradient(to right, rgba(0, 0, 0, 1) 90%, rgba(0, 0, 0, 0) 100%);
    }
    
    #yt-inner-block-right {
    	width: 23%;
    	color: black;
    	background: linear-gradient(to left, rgba(0, 0, 0, 1) 90%, rgba(0, 0, 0, 0) 100%);
    }
    
    .youtube-overlay {
        position: absolute;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 1000px;
        height: 100%;
        display: flex;
        justify-content: space-between;
        z-index: 3;
    }
    .youtube-overlay .left {
        width: 150px; /* 좌우 검은 영역 너비 조정 */
        height: 100%;
        background: linear-gradient(to right, rgba(0, 0, 0, 1) 80%, rgba(0, 0, 0, 0) 100%);
        position: absolute;
    }
    .youtube-overlay .right {
        width: 150px; /* 좌우 검은 영역 너비 조정 */
        height: 100%;
        background: linear-gradient(to left, rgba(0, 0, 0, 1) 80%, rgba(0, 0, 0, 0) 100%);
    }
    .youtube-overlay .middle {
        width: 1000px; /* 가운데 투명 영역 너비 */
        background-color: transparent;
    }
    #youtube-movie-info {
        width: 850px;
        position: absolute;
        bottom: 150px;
        color: white;
        padding: 10px;
    }
    #youtube-movie-info button {
        background-color: transparent;
        color: white;
        border: 1px solid;
        padding: 8px 12px;
        border-radius: 50px;
        cursor: pointer;
    }
    #youtube-title {
        color: white;
        font-size: 30px;
        font-weight: bold;
    }
    #youtube-content {
        color: white;
        padding: 10px 0;
    }
    
</style>
<script>
    // 전역 변수로 player 선언
    var player;

    function initializePlayer() {
        // 두 개의 동영상 ID 중 하나를 랜덤으로 선택
        var videoIds = ['T9uolHEOqFg', 'EiCmnIaj4u8'];
        var selectedVideoId = videoIds[Math.floor(Math.random() * videoIds.length)];

        // 동영상 정보 업데이트
        updateMovieInfo(selectedVideoId);

        if (player && player.destroy) {
            player.destroy();
        }
        
        player = new YT.Player('ytplayer', {
            videoId: selectedVideoId, // 랜덤으로 선택된 YouTube 동영상 ID
            playerVars: {
                'autoplay': 1,
                'mute': 1, // 무음으로 설정
                'controls': 0, // 제어 바 숨기기
                'modestbranding': 1, // YouTube 로고 최소화
                'rel': 0, // 관련 동영상 표시 안함
                'iv_load_policy': 3, // 자막 숨기기
                'playsinline': 1, // 인라인 재생
                'showinfo': 0 // 동영상 정보 숨기기
            },
            events: {
                'onReady': onPlayerReady,
                'onStateChange': onPlayerStateChange
            }
        });
    }

    // 동영상 정보 업데이트 함수
    function updateMovieInfo(videoId) {
        var title = '';
        var content = '';

        if (videoId === 'T9uolHEOqFg') {
            title = '명탐정 코난: 100만 달러의 펜타그램';
            content = '드디어 밝혀지는 괴도키드의 정체? <br>역대급 시리즈 흥행! 7월 17일 대개봉!';
        } else if (videoId === 'EiCmnIaj4u8') {
            title = '인사이드 아웃 2';
            content = '디즈니·픽사의 대표작 <인사이드 아웃> <br>새로운 감정과 함께 돌아오다!';
        }

        document.getElementById('youtube-title').innerHTML = title;
        document.getElementById('youtube-content').innerHTML = content;
    }

    // YouTube IFrame API가 로드되면 호출되는 함수
    function onYouTubeIframeAPIReady() {
        initializePlayer();
    }

    // 페이지 로드 시 초기화
    $(document).ready(function() {
        // 유튜브 IFrame API 로드
        var tag = document.createElement('script');
        tag.src = "https://www.youtube.com/iframe_api";
        var firstScriptTag = document.getElementsByTagName('script')[0];
        firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

        // 사용자가 클릭 시 음소거 해제
        $('#ytplayer').on('click', function() {
            player.unMute();
        });
    });

    // 플레이어가 준비되면 호출되는 함수
    function onPlayerReady(event) {
        event.target.playVideo(); // 동영상 자동 재생
    }

    // 플레이어 상태 변경 시 호출되는 함수
    function onPlayerStateChange(event) {
        if (event.data === YT.PlayerState.ENDED) {
            player.playVideo(); // 동영상 반복 재생
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        onYouTubeIframeAPIReady();
    });
</script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<div id="top-section">
    <div id="youtube-trailer">
        <div id="ytplayer"></div>
        <div class="overlay-block">
        	<div id="yt-inner-block-left"></div>
			<div class="youtube-overlay">
	            <div class="left">
	                <div id="youtube-movie-info">
	                    <div id="youtube-title"></div>
	                    <div id="youtube-content"></div>
	                    <button id="youtube-go-detail">상세보기</button>
	                </div>
	            </div>
	            <div class="middle"></div>
	            <div class="right"></div>
        	</div>
        	<div id="yt-inner-block-right"></div>        	        
        </div>
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

</body>
</html>
