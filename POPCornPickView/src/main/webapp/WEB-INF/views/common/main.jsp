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
<link rel="stylesheet" href="/css/mainETC.css">
<script src="/js/mainMovieList.js"></script>
<script src="/js/mainEventList.js"></script>    
<script src="/js/mainYT.js"></script>    
<!-- YouTube IFrame Player API 추가 -->
<script src="https://www.youtube.com/iframe_api"></script>

<style>
.btn_gotop {
    display: none;
    position: fixed;
    bottom: 100px;
    right: 150px;
    z-index: 999;
    outline: none;
    background-color: white;
    color: #333;
    cursor: pointer;
    width: 50px;
    height: 50px;
    border: 1px solid;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.btn_goreservation {
    display: none;
    position: fixed;
    bottom: 100px;
    right: 210px;
    z-index: 999;
    outline: none;
    background: linear-gradient(2345670deg, #ffef8a, #ee2b60);
    color: white;
    cursor: pointer;
    width: 150px;
    height: 50px;
    border-radius: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    text-align: center;
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

    $(document).ready(function() {
        $.ajax({
            url: 'http://localhost:9001/api/v1/main/packages',
            method: 'GET',
            success: function(data) {
                if (typeof data === 'string') {
                    try {
                        data = JSON.parse(data); // 데이터가 문자열이면 JSON 파싱
                    } catch (e) {
                        console.error('Failed to parse JSON:', e);
                        return;
                    }
                }
                renderPackages(data);
            },
            error: function(error) {
                console.log('Error:', error);
            }
        });
    });

    function renderPackages(data) {
        const container = $('#pack-info');
        container.empty(); // 기존 내용을 초기화

        if (!Array.isArray(data) || data.length === 0) {
            container.append('<p>패키지 정보가 없습니다.</p>');
            return;
        }

        data.forEach((product, index) => {
            if (product && typeof product === 'object') {

                const packInfoBox = document.createElement('div');
                packInfoBox.className = 'item-box-info';
                packInfoBox.innerHTML = 
                    '<img src="/img/' + product.productImg + '" class="pack-img" alt="pack Image">' +
                    '<div class="store-info-box">' +
                        '<div class="pack-name">' + product.productName + '</div>' +
                        '<div class="pack-price">' + Number(product.productPrice).toLocaleString() + '</div>' +
                    '</div>';
                container.append(packInfoBox);
            } else {
                console.error('Invalid product:', product);
            }
        });
    }

    $(document).ready(function() {
        $.ajax({
            url: 'http://localhost:9001/api/v1/main/storeMovies',
            method: 'GET',
            success: function(data) {
                if (typeof data === 'string') {
                    try {
                        data = JSON.parse(data); // 데이터가 문자열이면 JSON 파싱
                    } catch (e) {
                        console.error('Failed to parse JSON:', e);
                        return;
                    }
                }
                renderStoreMovies(data);
            },
            error: function(error) {
                console.log('Error:', error);
            }
        });
    });

    function renderStoreMovies(data) {
        const container = $('#store-movie-info');
        container.empty(); // 기존 내용을 초기화

        if (!Array.isArray(data) || data.length === 0) {
            container.append('<p>패키지 정보가 없습니다.</p>');
            return;
        }

        data.forEach((product, index) => {
            if (product && typeof product === 'object') {

                const packInfoBox = document.createElement('div');
                packInfoBox.className = 'item-box-info';
                packInfoBox.innerHTML = 
                    '<img src="/img/' + product.productImg + '" class="store-movie-img" alt="store movie Image">' +
                    '<div class="store-info-box">' +
                        '<div class="store-movie-name">' + product.productName + '</div>' +
                        '<div class="store-movie-price">' + Number(product.productPrice).toLocaleString() + '</div>' +
                    '</div>';
                container.append(packInfoBox);
            } else {
                console.error('Invalid product:', product);
            }
        });
    }

    $(document).ready(function() {
        $.ajax({
            url: 'http://localhost:9001/api/v1/main/gift',
            method: 'GET',
            success: function(data) {
                console.log('Received data:', data); // 데이터를 콘솔에 출력
                if (typeof data === 'string') {
                    try {
                        data = JSON.parse(data); // 데이터가 문자열이면 JSON 파싱
                    } catch (e) {
                        console.error('Failed to parse JSON:', e);
                        return;
                    }
                }
                renderGift(data);
            },
            error: function(error) {
                console.log('Error:', error);
            }
        });
    });

    function renderGift(data) {
        const container = $('#gift-info');
        container.empty(); // 기존 내용을 초기화

        if (!Array.isArray(data) || data.length === 0) {
            container.append('<p>패키지 정보가 없습니다.</p>');
            return;
        }

        data.forEach((product, index) => {
            if (product && typeof product === 'object') {

                const packInfoBox = document.createElement('div');
                packInfoBox.className = 'item-box-info';
                packInfoBox.innerHTML = 
                    '<img src="/img/' + product.productImg + '" class="gift-img" alt="gift Image">' +
                    '<div class="store-info-box">' +
                        '<div class="gift-name">' + product.productName + '</div>' +
                        '<div class="gift-price">금액충전형</div>' +
                    '</div>';
                container.append(packInfoBox);
            } else {
                console.error('Invalid product:', product);
            }
        });
    }

    $(window).scroll(function(){
        if ($(this).scrollTop() > 150){
            $('.btn_gotop').fadeIn(200);
            $('.btn_goreservation').fadeIn(200);
        } else{
            $('.btn_gotop').fadeOut(200);
            $('.btn_goreservation').fadeOut(200);
        }
    });

    $('.btn_gotop').click(function(){
        $('html, body').animate({scrollTop:0},400);
        return false;
    });

    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('go-to-movieList').addEventListener('click', function() {
            window.location.href = '/film/movieList';
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        // 공지사항 데이터 가져오기
        $.ajax({
            url: 'http://localhost:9001/api/v1/main/latest',
            method: 'GET',
            success: function(data) {
                console.log('Received latest notice:', data); // 데이터를 콘솔에 출력
                displayLatestNotice(data);
            },
            error: function(error) {
                console.log('Error:', error);
            }
        });
    });

    // 최신 공지사항을 HTML에 출력하는 함수
    function displayLatestNotice(notice) {
        const noticeElement = document.getElementById('latest-notice');
        let fullText = '[' + notice.noticeCategory + '] ' + notice.noticeTitle;
        
        if (fullText.length > 32) {
            fullText = fullText.substring(0, 32) + '...';
        }
    
        noticeElement.innerHTML = fullText;
    }
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
        <div class="item-box-info-container" id="pack-info">
            <!-- 아이템 컨텐츠는 AJAX 요청으로 추가됩니다. -->
        </div>
    </div>
    <div class="store-item-box" id="store-movie-container">
        <div class="store-high-container">
            <h3>영화관람권</h3>
            <button class="go-to-store">더보기</button>
        </div>
        <div class="item-box-info-container" id="store-movie-info">
            <!-- 아이템 컨텐츠는 AJAX 요청으로 추가됩니다. -->
        </div>
    </div>
    <div class="store-item-box" id="gift-container">
        <div class="store-high-container">
            <h3>기프트카드</h3>
            <button class="go-to-store">더보기</button>
        </div>
        <div class="item-box-info-container" id="gift-info">
            <!-- 아이템 컨텐츠는 AJAX 요청으로 추가됩니다. -->
        </div>
    </div>
</div>

<!-- ETC -->
<div id="etc-container">
    <div id="etc-right-container">
        <div id="main-notice">
            <h4>공지사항</h4>
            <p id="latest-notice">[행사/이벤트][팝콘픽]<선재 업고 튀어> 최종화 단...</p>
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

<a href="#" class="btn_gotop">
  TOP
</a>

<a href="/reservation/main" class="btn_goreservation">
  예매하기
</a>

</main>

<footer>
    <!-- 푸터 내용 -->
</footer>

</body>
</html>


