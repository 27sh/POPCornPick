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
        *{
            margin: 0; padding: 0;
            color: #333;
            font-family: "Pretendard Variable", Pretendard;
        }

        a{
            text-decoration: none;
            color: #333;  
        }

        ul, li{
            list-style: none;
        }

        header{
            width: 100%;
            margin: 0 auto;
        }

        #phrase{
            width: 100%; height: 30px;
            background-color: #666;
            text-align: center;
            font-size: 14px;
            font-weight: bold;
            line-height: 30px;
            color: #fff;
        }

        #header_wrap{
            width: 100%;
			border-bottom: 2px solid #f82f62;
        }

        #header_top{
            width: 100%;
            height: 60px;
            border-bottom: 1px solid #eee;
            box-sizing: border-box;
        }

        .logo img{
            width: 200px;
            margin: 10px;
            float: left;
        }

        .loginMenu{
            width: 25%;
            height: 30px;
            text-align: center;
            margin-top: 30px;
            float: right;
        }

        .loginMenu ul{
            width: 100%;
            font-size: 14px;
            line-height: 30px;
        }
        .loginMenu li{
            width: 25%;
            float: left;
        }
        /* header_top END */


        #header_bottom{
            width: 100%;
            height: 45px;
            box-sizing: border-box;
        }

        #nav{
            width: 100%;
        }

        #mme{
            width: 700px;
        }

        #mme>li{
            width: 20%; height: 100%;
            text-align: center;
            font-weight: bold;
            font-size: 16px;
            line-height: 45px;
            float: left;
        }

        #mme:hover .sme{
            height: 315px;
        }

        .sme{
            height: 0;
            font-weight: 400;
            font-size: 14px;
            overflow: hidden;
            transition-duration: 0.2s;
        }


        #search_content{
            width: 200px; height: 45px;
            float: right;
            border-left: 1px solid #eee;
            border-right: 1px solid #eee;
        }

        .header_wrap_c{
            width: 1200px;
            margin: 0 auto;
        }

        #header_box{
            position: relative;
            top: 45px;
            width: 100%; height: 315px;
            background-color: darkolivegreen;
            z-index: -99;
        }

        




    </style>
</head>

<body>
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
                            <li><a href="">로그인</a></li>
                            <li><a href="">회원가입</a></li>
                            <li><a href="">대관문의</a></li>
                            <li><a href="">고객센터</a></li>
                        </ul>
                    </div>
                    <div class="loginMenu" id="login" style="display: none;">
                        <ul>
                            <li><a href="" onclick="logout()" class="logout-btn">로그아웃</a></li>
                            <li><a href="">My Page</a></li>
                            <li><a href="">대관문의</a></li>
                            <li><a href="">고객센터</a></li>
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
                            <li><a href="">영화</a>
                                <ul class="sme">
                                    <li><a href="">무비차트</a></li>
                                </ul>
                            </li>
                            <li><a href="">극장</a>
                                <ul class="sme">
                                    <li><a href="">POPCornPick 극장</a></li>
                                    <li><a href="">특별관</a></li>
                                </ul>
                            </li>
                            <li><a href="">예매</a>
                                <ul class="sme">
                                    <li><a href="">빠른 예매</a></li>
                                    <li><a href="">상영스케쥴</a></li>
                                </ul>
                            </li>
                            <li><a href="">스토어</a>
                                <ul class="sme">
                                    <li><a href="">패키지</a></li>
                                    <li><a href="">영화관람권</a></li>
                                    <li><a href="">기프트카드</a></li>
                                    <li><a href="">콤보</a></li>
                                    <li><a href="">팝콘</a></li>
                                    <li><a href="">음료</a></li>
                                    <li><a href="">스낵</a></li>
                                </ul>
                            </li>
                            <li><a href="">이벤트</a>
                                <ul class="sme">
                                    <li><a href="">진행중인 이벤트</a></li>
                                    <li><a href="">당첨자 발표</a></li>
                                    <li><a href="">종료된 이벤트</a></li>
                                </ul>
                            </li>
                        </ul>

                        <div id="search_content">
                            <input type="text">
                        </div>

                    </div>
                    <!-- nav END -->

                </div>
                <!-- header_wrap_c END -->

<!--                 <div id="header_box"></div> -->
                <!-- width: 100% -->
            </div>
            <!-- header_bottom END -->
        </div>






    </header>
</body>

</html>