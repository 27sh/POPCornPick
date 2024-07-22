<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

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
            width: 30%;
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
            width: 20%;
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
            height: 45px;
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
            background: transparent url(/img/search.png) center center / 26px scroll no-repeat;
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
            background: transparent url(/img/headerBg.png);
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
                        <li><a href="/loginForm">로그인</a></li>
                        <li><a href="/joinForm">회원가입</a></li>
                        <li><a href="/member/lentForm">대관문의</a></li>
                        <li><a href="faqList">고객센터</a></li>
                    </ul>
                </div>
                <div class="loginMenu" id="login" style="display: none;">
                    <ul>
                    	<li><p id="username">username</p><input type="hidden" name="role" id="role" value=""></li>
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
                                <li><a href="/common/scheduleList">상영스케쥴</a></li>
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
                                <li><a href="/common/scheduleList">상영스케쥴</a></li>
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
    
//     function loginCheck(){
//     	const xhttp = new XMLHttpRequest();
//     	const token = localStorage.getItem("jwtToken");
//     	let username = "";
//     	let role = "";
//     	if(token != null){
    		
// 	    	xhttp.onload = function(){
// 	    		console.log("체크하기용 : " + this.responseText);
// 	    		if(xhttp.responseText != "유효하지 못한 토큰입니다."){
// 	    			const response = xhttp.responseText.split(" ");
// 	    			username = response[0];
// 	    			role = response[1];
// 	    			console.log(username + " " + role);
// 	    			document.querySelector("#username").innerHTML = username;
// 	    			document.querySelector("#role").innerHTML = role;
// 	    			document.querySelector("#login").style.display = "block";
// 	    			document.querySelector("#notLogin").style.display = "none";
// 	//     			window.location.href = "/";
// 	    		}else {
// 	    			localStorage.removeItem("jwtToken");
// 					alert("토큰의 유효기간이 만료되었습니다. 다시 로그인을 해주세요. 확인 버튼을 누르면 자동으로 로그인 페이지로 이동합니다.");
// 					window.location.href = "/loginForm";
// 	    		}
// 	    	}
	    	
// 	    	xhttp.open("GET", "http://localhost:9001/api/v1/common/loginCheck");
// 	    	xhttp.setRequestHeader("Authorization", "Bearer " + token);
// 	    	xhttp.send();
	    	
//     	}
//     }
    
    function logout(){
    	localStorage.removeItem("jwtToken");
    	alert("성공적으로 로그아웃 됬습니다.");
    	window.location.href = "/";
    }
    
    $(document).ready(function() {
    	// 현재 페이지의 경로를 가져옴
        const path = window.location.pathname;

     // 비회원이 접근 가능한 경로
        const publicPaths = [
            '/',
            '/main',
            '/film/movieList',
            '/memberCinema/cinemaPage',
            '/memberCinema/sRoomDetail',
            '/reservation/scheduleLIst',
            '/reservation/storeMain',
			'/reservation/eventList',
            '/joinForm',
			'/loginForm',
			'/reservation/faqList',
			'/common/scheduleList'
        ];

//         // 현재 경로가 비회원 접근 가능 경로에 포함되는지 확인
//         if (publicPaths.includes(path) && !token) {
//             return; // 스크립트 실행 중단
//         }
		
        const token = localStorage.getItem('jwtToken');
        // JWT 검증 스크립트
        if (token !== null) {
            $.ajax({
                url: 'http://localhost:9001/api/v1/common/loginCheck', // REST API 서버의 JWT 검증 엔드포인트
				type: 'GET',
                beforeSend: function(request) {
                    request.setRequestHeader("Authorization", "Bearer " + token);
                },
                success: function(response) {
                	let username = response.result.split(" ")[0];
                	let role = response.result.split(" ")[1];
                	console.log("토큰 검증 완료, 유효한 토큰임, usernmae : " + username + ", role : " + role);
                	document.querySelector("#username").innerHTML = username;
                	document.querySelector("#login").style.display = "block";
	    			document.querySelector("#notLogin").style.display = "none";
                    if (role !== 'ROLE_ADMIN' && role !== 'ROLE_MEMBER') {
						alert('로그인을 해야지 이용하실 수 있습니다. 로그인을 해주세요. 확인 클릭시 메인페이지로 돌아갑니다.');
						window.location.href = '/';
//                         if (window.location.pathname === '/admin') {
//                         }
                    }
                },
                error: function() {
					alert('인증이 만료되었습니다. 다시 로그인 해주세요. 버튼을 누르면 자동으로 로그인 페이지로 이동합니다.');
					localStorage.removeItem('jwtToken');
					window.location.href = '/loginForm';
                }
            });
        } else {
        	if(publicPaths.includes(path)){
        		console.log("비회원도 허가된 주소");
        		return; // 스크립트 실행 중단
        	}else {
				alert("로그인을 해야 이용하실 수 있습니다. 로그인을 해주세요. 확인 클릭시 로그인페이지로 넘어갑니다.");
	            window.location.href = '/loginForm';
        	}
        }
    });
    
    
</script>
