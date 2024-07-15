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
<link rel="stylesheet" href="/css/mainYT.css">
<script src="/js/mainMovieList.js"></script>
<script src="/js/mainEventList.js"></script>    
<script src="/js/mainYT.js"></script>    
<!-- YouTube IFrame Player API 추가 -->
<script src="https://www.youtube.com/iframe_api"></script>
<style>
    #sRoom-container {
        width: 1200px;
    }
    #sRoom-h1 {
        font-size: 30px;
        font-weight: bold;
        padding: 10px;
        margin-top: 10px;
    }
    #sRoom-img {
        background-color: palegoldenrod;
        width: 500px;
        height: 250px;
        float: left;
        border-radius: 10px;
        margin: 10px 50px;
        background-size: cover;
        background-position: center;
    }
    #sRoom-table {
        margin: 10px;
        width: 430px;
        float: left;
        border-collapse: separate;
        border-spacing: 0;
    }
    #sRoom-table td {
        padding: 30px 0; /* 간격을 늘림 */
        border-top: 1px solid gray;
        border-bottom: 1px solid gray;
        font-size: 20px;
    }
    .sRoom-option:hover {
        cursor: pointer;
    }
    .clear {
        clear: both;
    }
    
    
    #store-container {
        width: 100%;
        overflow: hidden;
        white-space: nowrap;
    }
    .store-item-box {
        display: inline-block;
        vertical-align: top;
        border: 1px solid lightgray;
        border-radius: 10px;
        margin: 30px;
        padding: 10px;
        width: 280px;
        white-space: normal;
    }
    .store-high-container {
        overflow: hidden;
        padding: 10px 0 20px 0;
    }
    .store-high-container h3 {
        float: left;
        margin: 0;
    }
    .store-high-container .go-to-store {
        float: right;
    }

    #pack-img, #store-movie-img, #gift-img {
        background-color: gray;
        width: 60px;
        height: 60px;
        display: inline-block;
        vertical-align: middle;
    }
    .store-info-box {
        display: inline-block;
        vertical-align: middle;
        margin-left: 10px;
    }
    .store-info-box div {
        margin-bottom: 5px;
    }
    .go-to-store{
        background-color: transparent;
        border: 1px solid lightgray;
        border-radius: 50px;
        padding: 5px 10px;
    }

    #pack-price, #store-movie-price, #gift-price {
        font-weight: bold;
    }

    .item-box-info {
        padding: 10px 0;
    }
    
        #etc-container {
        width: 1000px;
        border: 1px solid lightgray;
        border-radius: 10px;
        padding: 20px;
        margin: 0 30px;
        white-space: nowrap;
        position: relative; /* 부모 요소에 상대 위치 설정 */
    }
    #etc-right-container, #etc-left-container {
        display: inline-block;
        vertical-align: top;
        white-space: normal;
        padding: 0 20px;
        box-sizing: border-box;
    }
    
    #etc-right-container {
    	width: 55%;
    }
    
    #etc-left-container {
        text-align: center; /* 가운데 정렬 */
        width: 45%;
    }
    #vertical-divider {
        position: absolute; /* 절대 위치 설정 */
        top: 20px;
        bottom: 20px;
        left: 55%;
        border-left: 1px solid lightgray; /* 세로 줄 */
    }
    #main-notice h4, #main-notice p, #main-notice button {
        display: inline-block;
        vertical-align: middle;
        margin-right: 10px;
    }
    #main-notice button {
    	background-color: transparent;
    	border: 1px solid lightgray;
	    border-radius: 50px;
	    padding: 3px 10px;
    }
    
    #main-notice h4 {
        margin: 0 10px 0 0;
    }
    hr {
        border: 0;
        border-top: 1px solid lightgray;
        margin: 20px 0; /* 상하 마진 */
    }
    #main-cs-high h4, #etc-cs-info {
        display: inline-block;
        vertical-align: middle;
        margin-right: 10px;
    }
    #main-cs-high h4 {
        margin: 0 10px 38px 0;
    }
    
    #etc-button {
    	margin-top: 10px;
    }
    
    #etc-button button {
    	padding: 5px 10px;
	    border: none;
	    border-radius: 5px;
    }
</style>
<script>
    $(document).ready(function() {
        $("#sRoom-IMAX").hover(function() {
            $("#sRoom-img").css("background-image", "url('/img/IMAX.png')");
        });
        $("#sRoom-4DX").hover(function() {
            $("#sRoom-img").css("background-image", "url('/img/4DX.png')");
        });
        $("#sRoom-PrivateBox").hover(function() {
            $("#sRoom-img").css("background-image", "url('/img/PRIVATEBOX.png')");
        });
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
    
    <!-- 특별관 -->
    <div id="sRoom-container">
    <h1 id="sRoom-h1">특별관</h1>
    <div>
        <div id="sRoom-img" style="background-image: url('/img/IMAX.png');"></div>
        <div id="sRoom-textBox">
            <table id="sRoom-table">
                <tr>
                    <td id="sRoom-IMAX" class="sRoom-option">IMAX</td>
                </tr>
                <tr>
                    <td id="sRoom-4DX" class="sRoom-option">4DX</td>
                </tr>
                <tr>
                    <td id="sRoom-PrivateBox" class="sRoom-option">PRIVATE BOX</td>
                </tr>
            </table>
        </div>
        <div class="clear"></div>
    </div>
</div>

	<!-- 스토어 -->
	<div id="store-container">
    <div class="store-item-box" id="pack-container">
        <div class="store-high-container">
            <h3>패키지</h3>
            <button class="go-to-store">더보기</button>
        </div>
        <div class="item-box-info" id="pack-info">
            <div id="pack-img"></div>
            <div class="store-info-box">
                <div id="pack-name">우리 패키지</div>
                <div id="pack-price">62,000</div>    
            </div>
        </div>
        <div class="item-box-info" id="pack-info">
            <div id="pack-img"></div>
            <div class="store-info-box">
                <div id="pack-name">우리 패키지</div>
                <div id="pack-price">62,000</div>    
            </div>
        </div>
        <div class="item-box-info" id="pack-info">
            <div id="pack-img"></div>
            <div class="store-info-box">
                <div id="pack-name">우리 패키지</div>
                <div id="pack-price">62,000</div>    
            </div>
        </div>
    </div>
    <div class="store-item-box" id="store-movie-container">
        <div class="store-high-container">
            <h3>영화관람권</h3>
            <button class="go-to-store">더보기</button>
        </div>
        <div class="item-box-info" id="store-movie-info">
            <div id="store-movie-img"></div>
            <div class="store-info-box">
                <div id="store-movie-name">팝콘픽 영화관람권</div>
                <div id="store-movie-price">13,000</div>
            </div>
        </div>
        <div class="item-box-info" id="store-movie-info">
            <div id="store-movie-img"></div>
            <div class="store-info-box">
                <div id="store-movie-name">팝콘픽 영화관람권</div>
                <div id="store-movie-price">13,000</div>
            </div>
        </div>
        <div class="item-box-info" id="store-movie-info">
            <div id="store-movie-img"></div>
            <div class="store-info-box">
                <div id="store-movie-name">팝콘픽 영화관람권</div>
                <div id="store-movie-price">13,000</div>
            </div>
        </div>
    </div>
    <div class="store-item-box" id="gift-container">
        <div class="store-high-container">
            <h3>기프트카드</h3>
            <button class="go-to-store">더보기</button>
        </div>
        <div class="item-box-info" id="gift-info">
            <div id="gift-img"></div>
            <div class="store-info-box">
                <div id="gift-name">POPCONNIE A형</div>
                <div id="gift-price">금액충전형</div>
            </div>
        </div>
        <div class="item-box-info" id="gift-info">
            <div id="gift-img"></div>
            <div class="store-info-box">
                <div id="gift-name">POPCONNIE A형</div>
                <div id="gift-price">금액충전형</div>
            </div>
        </div>
        <div class="item-box-info" id="gift-info">
            <div id="gift-img"></div>
            <div class="store-info-box">
                <div id="gift-name">POPCONNIE A형</div>
                <div id="gift-price">금액충전형</div>
            </div>
        </div>
    </div>
</div>

<!-- ETC -->
<div id="etc-container">
    <div id="etc-right-container">
        <div id="main-notice">
            <h4>공지사항</h4>
            <p>[행사/이벤트][팝콘픽]<선재 업고 튀어> 최종화 단...</p>
            <button>더보기</button>
        </div>
        <hr> <!-- 가로 줄 -->
        <div id="main-cs">
            <div id="main-cs-high">
                <h4>고객센터</h4>
                <div id="etc-cs-info">
                    <p style="font-weight: bold; margin: 0 0 2px 0;">1544-1122</p>
                    <p>고객센터 운영시간 (평일 09:00~18:00)</p>
                    <p style="color: lightgray;">업무시간 외 자동응답 안내 가능합니다.</p>
                </div>
            </div>
            <div id="etc-button">
                <button id="etc-FAQ">FAQ</button>
                <button id="etc-one-to-one">1:1 문의</button>
                <button id="etc-inquiry">대관/단체 문의</button>
            </div>
        </div>
    </div>
    <div id="vertical-divider"></div> <!-- 세로 줄 -->
    <div id="etc-left-container">
        <h4>앱 다운로드</h4>
        <p>팝콘픽 앱에서 더 편리하게 이용하세요</p>
        <div id="etc-QR-code"></div>
        <p>QR코드를 스캔하고</p>
        <p>앱설치 페이지로 바로 이동하세요</p>
    </div>
</div>

</main>

<footer>
    <!-- 푸터 내용 -->
</footer>

</body>
</html>

