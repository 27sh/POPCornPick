<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" as="style" crossorigin
        href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
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
            margin: 0;
            padding-left: 0;
            float: left;
        }

        header {
            width: 100%;
            height: 65px;
            background-color: #816bff;
            text-align: center;
            position: relative;
            z-index: 99;
        }

        .logo img {
            width: 200px;
            float: left;
            margin: 15px;
        }

        #mme {
            float: right;
            width: 700px;
            font-size: 16px;
            font-weight: 800;
            line-height: 65px;
        }

        #mme>li {
            width: 13%;
            height: 100%;
        }

        #mme>li>a {
            color: #fff;
        }

        #logout_btn {
            font-size: 13px;
            font-weight: 500;
        }

        #bgBox {
            background-color: rgba(0, 0, 0, 0.7);
            position: relative;
            top: 65px;
        }

        .sme {
            text-align: center;
            font-size: 14px;
            font-weight: 400;
            line-height: 24px;
            position: absolute;
        }

        .sme>li {
            margin: 0 10px;
            float: left;
        }

        .sme>li:hover {
            font-weight: 600;
            transition-duration: 0.1s;
        }

        .sme a {
            color: #fff;
        }

        .sme1 {
            left: 1400px;
        }

        .sme2 {
            left: 1470px;
        }

        .sme3 {
            left: 1550px;
        }
    </style>
</head>

<header>
    <div id="header_wrap">
        <div class="logo">
            <a href="/"><img src="/img/logoWhite.png" alt=""></a>
        </div>
        <ul id="mme">
            <li><a href="/">홈</a></li>
            <li><a href="/admin/userList">회원</a></li>
            <li class="mme1"><a href="/admin/cinemaList">극장</a></li>
            <li class="mme2"><a href="/admin/movieList">영화</a></li>
            <li><a href="/admin/reportList">신고</a></li>
            <li class="mme3"><a href="#">고객서비스</a></li>
            <li id="logout_btn">
                <a href="#">✔ 로그아웃</a>
            </li>
        </ul>
        <div id="bgBox">
            <ul class="sme sme1">
                <li><a href="/cinema/list">극장</a></li>
                <li><a href="/cinema/roomList">관람관</a></li>
            </ul>
            <ul class="sme sme2">
                <li><a href="/admin/movieList">영화정보</a></li>
                <li><a href="/admin/schedulePage">상영시간표</a></li>
            </ul>
            <ul class="sme sme3">
                <li><a href="/admin/noticeList">공지사항</a></li>
                <li><a href="/event/allList">이벤트</a></li>
                <li><a href="/admin/qnaList">Q&A</a></li>
                <li><a href="faqList">자주찾는 질문</a></li>
            </ul>
        </div>

    </div>
</header>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var mme1 = document.querySelector('.mme1');
        var mme2 = document.querySelector('.mme2');
        var mme3 = document.querySelector('.mme3');
        var bgBox = document.getElementById('bgBox');
        var sme1 = document.querySelector('.sme1');
        var sme2 = document.querySelector('.sme2');
        var sme3 = document.querySelector('.sme3');

        function showMenu(sme) {
            bgBox.style.width = '100%';
            bgBox.style.height = '24px';
            sme1.style.display = 'none';
            sme2.style.display = 'none';
            sme3.style.display = 'none';
            sme.style.display = 'block';
        }

        function hideMenu() {
            bgBox.style.height = '0';
            sme1.style.display = 'none';
            sme2.style.display = 'none';
            sme3.style.display = 'none';
        }

        mme1.addEventListener('mouseover', function () {
            showMenu(sme1);
        });

        mme2.addEventListener('mouseover', function () {
            showMenu(sme2);
        });

        mme3.addEventListener('mouseover', function () {
            showMenu(sme3);
        });

        bgBox.addEventListener('mouseover', function () {
            bgBox.style.width = '100%';
            bgBox.style.height = '24px';
        });

        bgBox.addEventListener('mouseleave', function () {
            hideMenu();
        });
    });
</script>

</html>