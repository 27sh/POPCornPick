<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NEW</title>
    <link rel="stylesheet" as="style" crossorigin
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />

    <style>
        * {
            margin: 0;
            padding: 0;
            color: #333;
            font-family: "Pretendard Variable", Pretendard;
        }

        a {
            text-decoration: none;
            color: #333;
        }

        ul,
        li {
            list-style: none;
        }

        header {
            width: 100%;
            margin: 0 auto;
            position: relative;
            z-index: 99;
        }

        #phrase {
            width: 100%;
            height: 30px;
            background-color: #666;
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            line-height: 30px;
            color: #fff;
        }

        #header_wrap {
            width: 100%;
        }

        #header_top {
            width: 100%;
            height: 60px;
            border-bottom: 1px solid #eee;
            box-sizing: border-box;
        }

        .logo img {
            width: 200px;
            margin: 10px;
            float: left;
        }

        .loginMenu {
            width: 25%;
            height: 30px;
            text-align: center;
            margin-top: 30px;
            float: right;
        }

        .loginMenu ul {
            width: 100%;
            font-size: 14px;
            line-height: 30px;
        }

        .loginMenu li {
            width: 25%;
            float: left;
        }

        /* header_top END */


        #header_bottom {
            width: 100%;
            height: 45px;
            box-sizing: border-box;
            border-bottom: 2px solid #f82f62;
        }

        #nav {
            width: 100%;
        }

        #mme {
            width: 700px;
        }

        #mme>li {
            width: 20%;
            height: 100%;
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            line-height: 45px;
            float: left;
        }

        #header_bottom:hover .sme,
        #header_bottom:hover #header_box {
            height: 315px;
        }

        .sme {
            height: 0;
            font-weight: 400;
            font-size: 14px;
            overflow: hidden;
            z-index: 99;
            position: relative;
        }

        .sme>li:hover a {
            font-weight: 600;
        }

        #search_content {
            width: 200px;
            height: 43px;
            float: right;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
            box-sizing: border-box;
            padding: 10px;
        }

        #search_content>input {
            width: 80%;
            height: 90%;
            font-size: 14px;
            border: 0;
            float: left;
        }

        input:focus {
            outline: none;
        }

        #search_btn {
            width: 26px;
            height: 26px;
            float: right;
            border: 0;
            background: transparent url(img/search.png) center center / 26px scroll no-repeat;
            cursor: pointer;
        }

        .header_wrap_c {
            width: 1200px;
            margin: 0 auto;
        }

        #header_box {
            position: relative;
            top: 45px;
            width: 100%;
            height: 0;
            transition-duration: 0.2s;
            background-color: #fff;
        }


        #ticketing>a {
            color: #f82f62;
        }

        /* header END */

        #header_fixed {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 45px;
            box-sizing: border-box;
            background: transparent url(img/headerBg.png);
            display: none;
        }

        #nav2 {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #mme2 {
            width: 700px;
        }

        #mme2>li {
            width: 20%;
            height: 100%;
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            line-height: 45px;
            float: left;
            transition-duration: 0.2s;

        }

        #mme2>li>a {
            color: #fff;
        }

        #header_box2 {
            position: relative;
            top: -315px;
            width: 100%;
            height: 0;
            transition-duration: 0.2s;
            background-color: #fff;
        }

        #header_fixed:hover .sme,
        #header_fixed:hover #header_box2 {
            height: 315px;
        }


        .exBox {
            width: 100%;
            height: 1000px;
            background-color: black;
        }
    </style>
</head>


<header>
    <div id="phrase">" 당신이 선택하는 영화는 당신의 이야기를 말합니다. "</div>

    <div id="header_wrap">
        <!-- 메뉴 전체 100% -->
        <div id="header_top">
            <!-- 상단 메뉴 전체 100% -->

            <div class="header_wrap_c">
                <!-- width:1200px -->

                <div class="logo">
                    <a href="/"><img src="/img/logo.png" alt=""></a>
                </div>
                <div class="loginMenu" id="notLogin" style="display: block;">
                    <ul>
                        <li><a href="loginForm">로그인</a></li>
                        <li><a href="regForm">회원가입</a></li>
                        <li><a href="/member/lentForm">대관문의</a></li>
                        <li><a href="faqList">고객센터</a></li>
                    </ul>
                </div>
                <div class="loginMenu" id="login" style="display: none;">
                    <ul>
                        <li><a href="" onclick="logout()" class="logout_btn">로그아웃</a></li>
                        <li><a href="/member/reservationList">My Page</a></li>
                        <li><a href="/member/lentForm">대관문의</a></li>
                        <li><a href="faqList">고객센터</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- header_top END -->

        <div id="header_bottom">
            <!-- 하단 메뉴 전체 100% -->

            <div class="header_wrap_c">
                <!-- width:1200px -->

                <div id="nav">
                    <!-- 메인메뉴, 검색 포함 -->
                    <ul id="mme">
                        <li><a href="/film/movieList">영화</a>
                            <ul class="sme">
                                <li><a href="/film/movieList">무비차트</a></li>
                            </ul>
                        </li>
                        <li><a href="/memberCinema/cinemaPage">극장</a>
                            <ul class="sme">
                                <li><a href="/memberCinema/cinemaPage">POPCornPick 극장</a></li>
                                <li><a href="sRoomDetail">특별관</a></li>
                            </ul>
                        </li>
                        <li id="ticketing"><a href="/reservation/main">예매</a>
                            <ul class="sme">
                                <li><a href="/reservation/main">빠른 예매</a></li>
                                <li><a href="scheduleLIst">상영스케쥴</a></li>
                            </ul>
                        </li>
                        <li><a href="storeMain">스토어</a>
                            <ul class="sme">
                                <li><a href="storeMain">패키지</a></li>
                                <li><a href="storeMain">영화관람권</a></li>
                                <li><a href="storeMain">기프트카드</a></li>
                                <li><a href="storeMain">콤보</a></li>
                                <li><a href="storeMain">팝콘</a></li>
                                <li><a href="storeMain">음료</a></li>
                                <li><a href="storeMain">스낵</a></li>
                            </ul>
                        </li>
                        <li><a href="eventList">이벤트</a>
                            <ul class="sme">
                                <li><a href="eventList">진행중인 이벤트</a></li>
                                <li><a href="eventList">당첨자 발표</a></li>
                                <li><a href="eventList">종료된 이벤트</a></li>
                            </ul>
                        </li>
                    </ul>

                    <div id="search_content">
                        <input type="text" placeholder="검색어를 입력하세요.">
                        <button id="search_btn"></button>
                    </div>

                </div>
                <!-- nav END -->

            </div>
            <!-- header_wrap_c END -->

            <div id="header_box"></div>
            <!-- width: 100% -->
        </div>
        <!-- header_bottom END -->

        <div id="header_fixed">
            <!-- 하단 메뉴 전체 100% -->
            <div class="header_wrap_c">
                <!-- width:1200px -->
                <div id="nav2">
                    <!-- 메인메뉴, 검색 포함 -->
                    <ul id="mme2">
                        <li><a href="movieList">영화</a>
                            <ul class="sme">
                                <li><a href="movieList">무비차트</a></li>
                            </ul>
                        </li>
                        <li><a href="cinemaPage">극장</a>
                            <ul class="sme">
                                <li><a href="cinemaPage">POPCornPick 극장</a></li>
                                <li><a href="sRoomDetail">특별관</a></li>
                            </ul>
                        </li>
                        <li id="ticketing"><a href="reservePage">예매</a>
                            <ul class="sme">
                                <li><a href="reservePage">빠른 예매</a></li>
                                <li><a href="scheduleLIst">상영스케쥴</a></li>
                            </ul>
                        </li>
                        <li><a href="storeMain">스토어</a>
                            <ul class="sme">
                                <li><a href="storeMain">패키지</a></li>
                                <li><a href="storeMain">영화관람권</a></li>
                                <li><a href="storeMain">기프트카드</a></li>
                                <li><a href="storeMain">콤보</a></li>
                                <li><a href="storeMain">팝콘</a></li>
                                <li><a href="storeMain">음료</a></li>
                                <li><a href="storeMain">스낵</a></li>
                            </ul>
                        </li>
                        <li><a href="eventList">이벤트</a>
                            <ul class="sme">
                                <li><a href="eventList">진행중인 이벤트</a></li>
                                <li><a href="eventList">당첨자 발표</a></li>
                                <li><a href="eventList">종료된 이벤트</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <!-- nav2 END -->

            </div>
            <!-- header_wrap_c END -->

            <div id="header_box2"></div>
            <!-- width: 100% -->
        </div>
        <!-- header_fixed END -->
    </div>
</header>
<script>
    window.onscroll = function () {

        var headerFixed = document.getElementById("header_fixed");
        var headerBottom = document.getElementById('header_bottom');
        console.log(document.documentElement.scrollTop);
        if (document.body.scrollTop > 90 || document.documentElement.scrollTop > 90) {
            headerFixed.style.display = "block";
            headerBottom.style.display = "none";
        } else {
            headerFixed.style.display = "none";
            headerBottom.style.display = "block";
        }
    };
</script>

</html>