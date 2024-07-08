<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 기본정보</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    body {
        margin: 0;
        background-color: #f8f8f8; /* 페이지 배경색 */
        display: flex;
        justify-content: center;
    }
    #mainInfoContainer {
        background-color: #f0f0f0; /* 회색 배경 */
        padding: 20px;
        border-radius: 10px; /* 모서리 둥글게 */
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 900px;
        margin-top: 20px; /* 페이지 상단과의 간격 */
    }
    .high-container {
        display: flex; /* Flexbox 사용 */
        align-items: center; /* 수직 가운데 정렬 */
        margin-bottom: 20px; /* 아래쪽에 간격 추가 */
        width: 100%;
        justify-content: flex-start; /* 왼쪽 정렬 */
        padding: 0 20px; /* 좌우 여백 추가 */
        padding-left: 40px; /* 요소들을 오른쪽으로 이동 */
    }
    #userProfile img {
        width: 150px; /* 원하는 너비로 설정 */
        height: 150px; /* 원하는 높이로 설정 */
        border-radius: 50%; /* 원형 이미지로 만들기 */
        margin-right: 20px; /* 이미지와 텍스트 사이의 간격 */
    }
    #userName {
        display: flex; /* Flexbox 사용 */
        flex-direction: column; /* 세로 정렬 */
        justify-content: center; /* 세로 가운데 정렬 */
    }
    #userName .name {
        font-size: 1.5em; /* 크기 키우기 */
        font-weight: bold; /* 굵게 설정 */
        margin: 0; /* 기본 마진 제거 */
        padding: 5px 0; /* 텍스트 사이 간격 추가 */
    }
    #userName p {
        margin: 0; /* 기본 마진 제거 */
        padding: 5px 0; /* 텍스트 사이 간격 추가 */
    }
    #userId {
        position: relative; /* 위치 조정 */
        top: 10px; /* 아래로 10px 이동 */
    }
    .mini-container {
        display: flex; /* Flexbox 사용하여 가로 정렬 */
        gap: 10px; /* 요소들 사이의 간격 */
    }
    .row-container {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }
    .having {
        flex: 1;
        padding: 10px;
        margin: 0 10px;
        background-color: #ffffff;
        text-align: center; /* 텍스트 가운데 정렬 */
        display: flex;
        flex-direction: column;
        justify-content: center; /* 수직 가운데 정렬 */
        align-items: center; /* 수평 가운데 정렬 */
    }
    .likeCinema {
        width: 100px; /* 직사각형 너비 */
        height: 40px; /* 직사각형 높이 */
        background-color: #d3d3d3; /* 직사각형 배경색 */
        margin: 5px 0; /* 직사각형 간격 */
        border: 1px solid #ccc; /* 직사각형 테두리 */
    }
    .divider {
        width: 600px; /* 가로 길이 */
        height: 2px; /* 세로 높이 */
        background-color: #d3d3d3; /* 회색 배경색 */
        margin: 20px 0; /* 상하 여백 */
    }
</style>
<script>
$(document).ready(function() {
    $.ajax({
        url: '/api/member/info',
        type: 'GET',
        headers: {
            'Authorization': localStorage.getItem('token') // 또는 쿠키에서 토큰을 가져오도록 설정
        },
        success: function(data) {
            $('#userName .name').text(data.name);
            $('#userId').text('아이디 : ' + data.username);
            $('#couponCount').text(data.couponCount + '개');
            $('#giftCardCount').text(data.giftCardCount + '개');
            $('#totalPoints').text(data.totalPoints + '점');
        },
        error: function() {
            alert('유저 정보를 불러오는데 실패했습니다.');
        }
    });
});
</script>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
</head>
<body>
<div id="mainInfoContainer">
    <div class="high-container">
        <div id="userProfile">
            <img src="/img/profile.jpg" alt="유저 프로필 사진"> <!-- 유저 프로필 사진 삽입 -->
        </div>
        <div id="userName">
            <div class="mini-container">
                <p class="name">홍길동</p>
                <p id="userId">아이디 : ghdrlfehd</p>
            </div>
            <div class="divider"></div> <!-- 회색 줄 추가 -->
        </div>
    </div>
    <div class="row-container">
        <div class="having">
            <h3>MY COUPON</h3>
            <div class="mini-container">
                <p>할인쿠폰</p>    
                <p id="couponCount">0개</p>
            </div>
            <div class="mini-container">
                <p>영화관람권</p>
                <p id="giftCardCount">0개</p>
            </div>
        </div>
        <div class="having">
            <h3>POINT</h3>
            <div class="mini-container">
                <p>사용가능 포인트</p>
                <p id="totalPoints">0점</p>
            </div>
        </div>
        <div class="having">
            <div class="likeCinema"></div>
            <div class="likeCinema"></div>
            <div class="likeCinema"></div>
            <p>자주가는 팝콘픽 설정하기 ➧ </p>
        </div>
    </div>
</div>
</body>
</html>
