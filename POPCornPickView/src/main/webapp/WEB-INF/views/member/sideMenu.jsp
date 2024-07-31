<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<head>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
</head>
<div id="side-container">
    <a href="/member/reservationList">
        <div class="side-box" id="box1">
            나의 예매내역
        </div>    
    </a>
    <a href="/myPage/couponList">
        <div class="side-box" id="box2">
            관람권/할인쿠폰 관리
        </div>
    </a>    
    <a href="/myPage/pointList">
        <div class="side-box" id="box3">
            포인트
        </div>
    </a>
    <a href="/member/eventList">
        <div class="side-box" id="box4">
            이벤트 참여내역
        </div>
    </a>
    <a href="/member/myInfo">
        <div class="side-box" id="box6">
            프로필 관리
        </div>
    </a>
    <a href="/mem/watchedList">
        <div class="side-box" id="box8">
            내가 본 영화
        </div>
    </a>
    <a href="/myPage/reviewList">
        <div class="side-box" id="box9">
            내가 쓴 평점
        </div>
    </a>
    <a href="/member/qnaList">
        <div class="side-box" id="box10">
            나의 문의 내역
        </div>
    </a>
</div>
<style>
    #side-container {
        width: 200px;
        border: 1px solid #ccc; /* 전체 컨테이너에 테두리 추가 */
        border-radius: 4px; /* 모서리 둥글게 */
    }
    #side-container a {
        text-decoration: none; /* 하이퍼링크의 밑줄 제거 */
    }
    .side-box {
        display: flex; /* Flexbox 사용 */
        align-items: center; /* 수직 정렬 */
        justify-content: center; /* 수평 정렬 */
        padding: 10px;
        margin: 10px 0;
        height: 40px;
        text-decoration: none; /* 기본 링크 스타일 제거 */
        color: #000; /* 텍스트 색상 */
        text-align: center; /* 텍스트 가운데 정렬 */
        border: none; /* 개별 박스의 테두리 제거 */
    }

    .side-box:hover {
        background-color: #e0e0e0; /* 마우스 오버 시 배경색 변경 */
    }

    .active {
        background-color: #FF0558 !important; /* 활성화된 링크 배경 색 변경 */
        color: #fff; /* 활성화된 링크 텍스트 색 변경 */
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    var currentPath = window.location.pathname;

    $('#side-container a').each(function() {
        var linkPath = $(this).attr('href');
        if (currentPath === linkPath || (currentPath === '/myPage/registCouponForm' && linkPath === '/myPage/couponList')) {
            $(this).find('.side-box').addClass('active');
        }
    });
});
</script>
