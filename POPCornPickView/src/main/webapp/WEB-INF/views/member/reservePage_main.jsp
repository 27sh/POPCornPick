<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>관람관 등록</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />

<style type="text/css">
body {
	box-sizing: border-box;
}

#container {
	background-color: #444;
	background: #444;
}

#wrapper {
	margin: 0 auto;
	width: 1280px;
	position: absolute;
	height: 866px;
	display: flex;
	flex-direction: row;
}

#simple_infos {
	display: flex;
	flex-direction: column;
	height: 100%;
	z-index: 9999;
}

.simple_info {
	display: flex;
	flex-direction: row;
	height: 100%;
	position: absolute;
}

.simple_info:nth-child(2) {
	top: 216.5px;
}

.simple_info:nth-child(3) {
	top: 433px;
}

.simple_info:nth-child(4) {
	top: 649.5px;
}

#simple_info_title_reservation {
	text-align: center;
	width: 80px;
	background: rgb(248, 47, 98);
	color: white;
	height: 216.5px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.simple_info_title {
	text-align: center;
	width: 80px;
	color: black;
	background: #c2bebe;
	height: 216.5px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.simple_info_title p{
	width: fit-content;
	margin: 0 auto;
	font-size: 14px;
	font-weight: bold;
	color: black;
}
#simple_info_title_reservation p {
	width: fit-content;
	margin: 0 auto;
	font-size: 14px;
	font-weight: bold;
	color: white;
}

.simple_info_content {
	width: 230px;
	background: rgb(248, 47, 98);
	color: white;
	height: 216.5px;
	display: flex;
	align-items: center;
	postion: relative;
	left: 80px;
	padding: 0 10px;
}

.simple_info_content ul {
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 0;
}

.simple_info_content ul li {
	font-size: 12px;
	margin: 10px 0;
	color: white;
}

.hidden {
	display: none;
}

#section_cinema {
	width: 355px;
	position: relative;
	left: 80px;
}

h4 {
	text-align: center;
	background: black;
	height: 55px;
	font-size: 18px;
	color: #FFF;
	margin: 0;
	line-height: 55px;
	font-style: normal;
	font-weight: normal;
}

#section_cinema_tab {
	display: flex;
}

#section_cinema_tab button {
	width: 50%;
	height: 61px;
	border: none;
	color: grey;
	cursor: pointer;
}

#section_cinema_tab .selected {
	font-weight: bold;
	color: black;
	border-bottom: 2px solid black;
}

#section_cinema_list {
	display: flex;
	height: 750px;
}

#section_cinema_list ul {
	padding: 0;
	margin: 0;
	list-style: none;
	width: 50%;
	overflow: auto;
	scroll-behavior: smooth;
	scrollbar-width: thin;
	scrollbar-color: #888 #f1f1f1;
	overflow-x: hidden;
}

#section_cinema_list ul:first-child {
	background: #ededed;
}

#section_cinema_list ul li {
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	position: relative;
	width: 175px;
	box-sizing: border-box;
	padding: 10px 16px;
	font-size: 13px;
}

#section_cinema_list ul:first-child li.selected {
	background: white;
	border: 3px solid pink;
	color: rgb(248, 47, 98);
	background: white url(/img/check.png) no-repeat;
	background-position: 140px 10px;
}

#section_cinema_list ul:nth-child(2) li.selected {
	background: white;
	border: 3px solid pink;
	color: rgb(248, 47, 98);
	background: white url(/img/check.png) no-repeat;
	background-position: 140px 10px;
}

.btn_view_txt.selected {
	width: 20px;
	height: 20px;
	border: none;
	text-indent: -9999em;
	background: url(/img/btn_list_view_txt_on.png) no-repeat center center;
	cursor: pointer;
}

.btn_view_txt {
	width: 20px;
	height: 20px;
	border: none;
	text-indent: -9999em;
	background: url(/img/hamburger.png) no-repeat center center;
	cursor: pointer;
}

.btn_view_view.selected {
	width: 20px;
	height: 20px;
	border: none;
	text-indent: -9999em;
	background: url(/img/btn_list_view_thm_on.png) no-repeat center center;
	cursor: pointer;
}

.btn_view_view {
	width: 20px;
	height: 20px;
	border: none;
	text-indent: -9999em;
	background: url(/img/btn_list_view_thm.png) no-repeat center center;
	cursor: pointer;
}

#section_movie {
	position: relative;
	left: 80px;
	width: 355px;
}

#section_movie_select {
	height: 61px;
	width: 100%;
	background: #fafafa;
	display: flex;
	border-bottom: 1px solid #edebeb;
}

#section_movie_select select {
	height: 28px;
	width: 133px;
	line-height: 29px;
	margin-top: 15px;
	padding-left: 10px;
	margin-left: 20px;
	border-radius: 4px;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	-o-border-radius: 4px;
	border: 1px solid #DDD;
	background: #fff url(../images/icon/arr_dw_13.png);
	background-repeat: no-repeat;
	background-position: right 6px top 50%;
	height: 40px;
	line-height: 40px;
	padding: 0 35px 0 18px;
	font-size: 14px;
	box-sizing: border-box;
}

#section_movie_select select option {
	font-weight: normal;
	display: block;
	min-height: 1.2em;
	padding: 0px 2px 1px;
	white-space: nowrap;
}

#section_movie_buttons {
	position: relative;
	top: 25px;
	left: 120px;
}

#section_movie_buttons ul {
	display: flex;
}

#section_movie_buttons ul li {
	margin: 0 5px;
}

#section_movie_list {
	height: 750px;
}

#section_movie_list ul {
	height: 100%;
	padding: 0;
	margin: 0;
	list-style: none;
	width: 100%;
	overflow: auto;
	scroll-behavior: smooth;
	scrollbar-width: thin;
	scrollbar-color: #888 #f1f1f1;
	overflow-x: hidden;
	background: #fafafa;
}

#section_movie_list ul li {
	cursor: pointer;
	display: flex;
	position: relative;
	width: 346px;
	height: 46.5px;
	box-sizing: border-box;
	padding: 10px 16px;
	font-size: 15px;
	font-weight: bold;
	align-items: center;
}

#section_movie_list ul li.selected {
	background: white;
	border: 3px solid pink;
	color: rgb(248, 47, 98);
	background: white url(/img/check.png) no-repeat;
	background-position: 315px 12px;
}

#section_movie_list ul li.selected span {
	color: rgb(248, 47, 98);
}

.grade {
	margin-right: 10px;
}

#section_schedule {
	position: relative;
	left: 80px;
	width: 499px;
}

#section_schedule_date {
	height: 80px;
	padding: 12px 20px 40px;
	background: #f0f0f0;
	overflow: hidden;
	position: relative;
	display: flex;
}

.date_radio {
	display: none;
}

#section_schedule_date_slides {
	width: 100%;
	display: flex;
	position: absolute;
	left: 50px;
}

.section_schedule_date_slide {
	display: flex;
	flex-direction: column;
	background: #f0f0f0;
	margin: 0 10px;
	justify-content: center;
	align-items: center;
}

.section_schedule_date_slide label {
	display: flex;
	flex-direction: column;
	cursor: pointer;
	justify-content: center;
	align-items: center;
}

.section_schedule_date_slide strong:first-child {
	margin: 5px 0;
	font-size: 10px;
	font-weight: bold;
	text-align: center;
}

.section_schedule_date_slide.selected a label strong {
	width: 30px;
	height: 30px;
	line-height: 30px;
	margin: 0 auto;
	font-size: 15px;
	text-align: center;
	background: black;
	color: white !important;
	border-radius: 50%;
}

.date_radio+strong {
	width: 30px;
	height: 30px;
	line-height: 30px;
	margin: 0 auto;
	font-size: 15px;
	text-align: center;
}

.section_schedule_date_slide em {
	font-family: 'Roboto', san-serif;
	display: block;
	margin-top: 10px;
	font-size: 12px;
	text-align: center;
	font-style: normal;
	font-weight: normal;
}

.previous {
	position: relative;
	top: 30px;
	left: -12px;
}

.next {
	position: relative;
	left: 420px;
	top: 30px;
}

.saturday strong, .saturday em {
	color: blue;
}

.sunday strong, .sunday em {
	color: red;
}

#section_schedule_tab {
	display: flex;
}

#section_schedule_tab button {
	width: 50%;
	height: 61px;
	border: none;
	color: grey;
	cursor: pointer;
}

#section_schedule_tab .selected {
	font-weight: bold;
	color: black;
	border-bottom: 2px solid black;
}

.none {
	height: 648px;
	background: grey;
	display: flex;
	justify-content: center;
	align-items: center;
}

#section_schedule_box {
	height: 665px;
	padding-left: 10px;
	padding-top: 15px;
	margin: 0;
	list-style: none;
	overflow: auto;
	scroll-behavior: smooth;
	scrollbar-width: thin;
	scrollbar-color: #888 #f1f1f1;
	overflow-x: hidden;
	background: #fafafa;
}

.room_info {
	display: flex;
	font-size: 13px;
	font-weight: bold;
	margin-left: 10px;
	margin-top: 10px;
}

.room_info li:first-child {
	padding-right: 5px;
}

.room_info li:nth-child(2) {
	padding: 0 5px;
	border-left: 1px solid #edebeb;
}

.room_info li:nth-child(3) {
	padding-left: 5px;
	border-left: 1px solid #edebeb;
}

.room_detail_infos {
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-left: 10px;
	margin-top: 5px;
	margin-bottom: 20px;
}

.room_detail_info {
	border: 1px solid #edebeb;
	background: #edebeb;
	position: relative;
	width: 110px;
	height: 48px;
	cursor: pointer;
}

.room_detail_info span:first-child {
	position: absolute;
	top: 0;
	right: 5px;
}

.room_detail_info strong {
	position: absolute;
	right: 30px;
	top: 5px;
}

.room_detail_info .seats_total {
	position: absolute;
	font-size: 12px;
	bottom: 3px;
	left: 33px;
}

.room_detail_info .room_number {
	position: absolute;
	bottom: 3px;
	font-size: 12px;
	right: 12px;
	font-weight: bold;
}

.room_detail_info .seats_left {
	position: absolute;
	bottom: 3px;
	left: 18px;
	font-size: 12px;
	color: green;
}

.movie_room {
	margin-top: 50px;
}

.movie_info {
	display: flex;
	align-items: center;
	margin-left: 10px;
	margin-bottom: 20px;
}

.movie_info span {
	font-weight: bold;
}

.hide_strong {
	visibility: hidden;
}

.nofilm {
	margin: 0 auto;
	width: fit-content;
	margin-top: 50%;
}

.nofilm p {
	width: fit-content;
}

main {
	width: 1280px;
	margin: 80px auto;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div id="container">
			<div id="wrapper">
				<div id="simple_infos">
					<div class="simple_info">
						<div class="simple_info_title" id="simple_info_title_reservation">
							<p>01</p>
							<p>상영시간</p>
						</div>
						<div class="simple_info_content hidden">
							<ul id="simple_info_content_all">
								<li class="simple_info_content_movie"></li>
								<li class="simple_info_content_specific"></li>
								<li class="simple_info_content_date"></li>
								<li class="simple_info_content_time"></li>
							</ul>
						</div>
					</div>
					<div class="simple_info">
						<div class="simple_info_title">
							<p>02</p>
							<p>인원/좌석</p>
						</div>
						<div class="simple_info_content hidden">
							<ul>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
					</div>
					<div class="simple_info">
						<div class="simple_info_title">
							<p>03</p>
							<p>결제</p>
						</div>
						<div class="simple_info_content hidden">
							<ul>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
					</div>
					<div class="simple_info">
						<div class="simple_info_title">
							<p>04</p>
							<p>결제완료</p>
						</div>
						<div class="simple_info_content hidden">
							<ul>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
					</div>
				</div>
				<section id="section_cinema">
					<h4 class="section_cinema_title">영화관</h4>
					<div id="section_cinema_tab">
						<button class="selected" id="section_cinema_tab_all">전체</button>
						<button id="section_cinema_tab_special">스페셜관</button>
					</div>
					<div id="section_cinema_list">
						<ul class="scroll_container" id="section_cinema_list_rough">
							<li class="myCinema">My 영화관(0)</li>
							<li class="seoul">서울(0)</li>
							<li class="gyeonggi_incheon">경기/인천(0)</li>
							<li class="chungcheong_daejeon">충청/대전(0)</li>
							<li class="jeonla_gwangju">전라/광주(0)</li>
							<li class="gyeongbuk_daegu">경북/대구(0)</li>
							<li class="gyeongnam_busan_ulsan">경남/부산/울산(0)</li>
							<li class="gangwon">강원(0)</li>
							<li class="jeju">제주(0)</li>
						</ul>
						<ul class="scroll_container" id="section_cinema_list_specific">
						</ul>
					</div>
				</section>
				<section id="section_movie">
					<h4 class="section_movie_title">영화 선택</h4>
					<div id="section_movie_select">
						<select id="section_movie_selection">
							<option id="section_movie_select_reservation">예매순</option>
							<option id="section_movie_select_aboutto">예정작</option>
						</select>
					</div>
					<div id="section_movie_list">
						<ul class="scroll_container" id="section_movie_list_info">
						</ul>
					</div>
				</section>
				<section id="section_schedule">
					<h4 class="section_schedule_title">날짜 / 시간</h4>
					<div id="section_schedule_date">
						<ul id="section_schedule_date_slides">

						</ul>
					</div>
					<div id="section_schedule_box">
						<div id="movie_room">
							<div id="section_schedule_box_information" class="nofilm">
							  <img alt="필름 사진" src="/img/film.png">
							  <p>조회 가능한 상영시간이 없습니다.</p>
						 	 <p>조건을 변경해주세요.</p>
				 			</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	<footer> </footer>
	<script type="text/javascript">
		function getNext8Days() {
			const today = new Date();
			const days = [];

			for (let i = 0; i < 9; i++) {
				const nextDate = new Date(today);
				nextDate.setDate(today.getDate() + i);
				days.push(nextDate);
			}

			return days;
		}

		$(document).ready(function() {
			
			const jwtToken = localStorage.getItem("jwtToken");
			// My영화관, 지역별 영화관 갯수(화면 시작될 때)
			$.ajax({
				url: "http://localhost:9001/api/v1/reservation/count",
				method: "GET",
				dataType: "json",
				headers: {
			        'Authorization': 'Bearer ' + jwtToken  // Authorization 헤더에 JWT 토큰 추가
			    },
				success: function(response){
					let str = '';	
					console.log(response);
					Object.entries(response).forEach(([key, value]) => {
						str += '<li class="' + key + '">' + value + '</li>';
					});
					$("#section_cinema_list_rough").html(str);
				},
				error: function(xhr, status, error){
					console.log(error);			
				}
			});
			
			$.ajax({
				url: "http://localhost:9001/api/v1/reservation/movie/list",
				method: "GET",
				dataType: "json",
				success: function(response) {
					let str = '';
					
					response.forEach(movie => {
					
						let title = '';
						if(movie.title.length > 25){
							title = movie.title.substring(0, 25) + "...";
						}else {
							title = movie.title;
						}
						
						if(movie.viewAge === "전체 관람가"){
							str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_all.png" class="grade"><span>' + title + '</span></li>';
						}else if(movie.viewAge === "12세 이상 관람가"){
							str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_12.png" class="grade"><span>' + title + '</span></li>';
						}else if(movie.viewAge === "15세 이상 관람가"){
							str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_15.png" class="grade"><span>' + title + '</span></li>';
						}else if(movie.viewAge === "청소년 관람불가") {
							str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/pc_grade_19.png" class="grade"><span>' + title + '</span></li>';
						}
						
					});
					
					$("#section_movie_list_info").html(str);
				},
				error : function(xhr, status, error){
					console.log(error);
				}
			});
			
			$("#simple_info_title_reservation").on("mouseenter", function() {
				$(this).next(".simple_info_content").removeClass("hidden");
			});

			$("#simple_info_title_reservation").on("mouseleave", function() {
				$(this).next(".simple_info_content").addClass("hidden");
			});
			
			$("#section_cinema_tab").children().on("click", function() {
				$(this).addClass("selected");
				$(this).siblings().removeClass("selected");
			});

			$("#section_cinema_list_rough").on("click", "li", function() {
				$(this).addClass("selected");
				$(this).siblings().removeClass("selected");
				
				const location = $(this).attr("class").split(" ")[0];
				
				$(".section_movie_title").text("영화 선택");
				$(".section_schedule_title").text("날짜 / 시간");
				$("#section_movie_list").children("ul").children("li").removeClass("selected");
				$("#section_schedule_date").children("li").removeClass("selected");	
				$(".simple_info_content_date").text("");
				$(".simple_info_content_movie").text("");
				$(".section_cinema_title").text("영화관");
				$(".simple_info_content_specific").text("");
				
				let str = '<div id="section_schedule_box_information" class="nofilm"> ' +
				  '<img alt="필름 사진" src="/img/film.png"> ' +
				  '<p>조회 가능한 상영시간이 없습니다.</p> ' +
				  '<p>조건을 변경해주세요.</p> ' +
				  '</div>';
				$("#movie_room").html(str);	
				
				if(location === "myCinema"){
					$.ajax({
						url : "http://localhost:9001/api/v1/reservation/myCinema/list",
						method : "GET",
						dataType : "json",
						headers : {
							 'Authorization': 'Bearer ' + jwtToken  // Authorization 헤더에 JWT 토큰 추가
						},
						success : function(response){
							let str = '';
							let cnt = 0;
							response.forEach(expCinema => {
								str += '<li id="cinemaNo_' + expCinema.cinema.cinemaNo + '">' + expCinema.cinema.cinemaName + '</li>';
							});
							$("#section_cinema_list_specific").html(str);
						},
						error : function(xhr, status, error){
							console.log(error);
						}
					});
					
					
				} else if(location === "4DX" || location === "IMAX" || location === "PRIVATE_BOX"){
					let roomTypeNo = 0;
					
					if(location === "4DX"){
						roomTypeNo = 4;
					}else if(location === "IMAX"){
						roomTypeNo = 3;
					}else if(location === "PRIVATE_BOX"){
						roomTypeNo = 5;
					}
					
					$.ajax({
						url : "http://localhost:9001/api/v1/reservation/cinema/special/list/" + roomTypeNo,
						method : "GET",
						dataType: "json",
						success : function(response){
							let str = '';
							let cnt = 0;
							response.forEach(room => {
								str += '<li id="cinemaNo_' + room.cinema.cinemaNo + '">' + room.cinema.cinemaName + '</li>';
							});
							$("#section_cinema_list_specific").html(str);
							
						},
						error : function(xhr, status, error){
							console.log(error);
						}
					});
				}else {
					
					
					$.ajax({
						url : "http://localhost:9001/api/v1/reservation/cinema/location/list/" + location,
						method : "GET",
						dataType: "json",
						success : function(response){
							let str = '';
							let cnt = 0;
							response.forEach(cinema => {
								str += '<li id="cinemaNo_' + cinema.cinemaNo + '">' + cinema.cinemaName + '</li>';
							});
							$("#section_cinema_list_specific").html(str);
						},
						error : function(xhr, status, error){
							console.log(error);
						}
					});
				}
			});
	
			$(".btn_view_txt").on("click", function(){
				$(this).addClass("selected");
				$(".btn_view_view").removeClass("selected");
			});
			
			$(".btn_view_view").on("click", function(){
				$(this).addClass("selected");
				$(".btn_view_txt").removeClass("selected");
			});
			
			$("#section_schedule_tab").children().on("click", function(){
				$(this).addClass("selected");
				$(this).siblings().removeClass("selected");
			});
			
// 			$(".section_schedule_date_slide").on("click", function(){
// 				$(this).addClass("selected");
// 				$(this).siblings().removeClass("selected");
				
// 				const year = new Date().getFullYear();
// 				const month = $(this).children("strong").text();
// 				const date = $(this).children("a").children("label").children("strong").text();
// 				const day = $(this).children("a").children("label").children("em").text();
// 				const result = year + "-" + month.substring(0, month.length - 1) + "-" + date + "(" + day +  ")";
				
// 				$(".section_schedule_title").text("날짜 - " + result);
// 				$(".simple_info_content_date").text(result);
				
// 			});
			
			/*
			const days = getNext8Days();
			
			let str = '';
			
			let cnt = 0;
			days.forEach(day => {
				
				str += '<li class="section_schedule_date_slide sunday"><strong ';
				if(cnt === 0){
					str += '>7월</strong> <a href="#"> <label ';
				}
				
				str += 'class="hide_strong">7월</strong> <a href="#"> <label ' + 
					   'for="zzz"> <input type="radio" id="zzz" ' + 
					   'name="date_radio" class="date_radio"> <strong>10</strong> ' +
					   '<em>일</em> ' +
					   '</label> ' +
					   '</a></li> ';
				console.log(cnt);
				cnt++;
			});
			*/
			
			// $("#section_schedule_date_slides").html(str);
			
			$("#section_cinema_tab_all").on("click", function(){
				
				$(".section_movie_title").text("영화 선택");
				$(".section_schedule_title").text("날짜 / 시간");
				$("#section_movie_list").children("ul").children("li").removeClass("selected");
				$("#section_schedule_date").children("li").removeClass("selected");	
				$(".simple_info_content_date").text("");
				$(".simple_info_content_movie").text("");
				$(".section_cinema_title").text("영화관");
				$(".simple_info_content_specific").text("");
				
				let str = '<div id="section_schedule_box_information" class="nofilm"> ' +
				  '<img alt="필름 사진" src="/img/film.png"> ' +
				  '<p>조회 가능한 상영시간이 없습니다.</p> ' +
				  '<p>조건을 변경해주세요.</p> ' +
				  '</div>';
				$("#movie_room").html(str);	
				
				$("#section_cinema_list_specific").html("");
				$.ajax({
					url: "http://localhost:9001/api/v1/reservation/count",
					method: "GET",
					dataType: "json",
					headers: {
				        'Authorization': 'Bearer ' + jwtToken  // Authorization 헤더에 JWT 토큰 추가
				    },
					success: function(response){
						let str = '';	
						Object.entries(response).forEach(([key, value]) => {
							str += '<li class="' + key + '">' + value + '</li>';
						});
						$("#section_cinema_list_rough").html(str);
					},
					error: function(xhr, status, error){
						console.log(error);			
					}
				});
			});
			
			$("#section_cinema_tab_special").on("click", function(){
				
				$(".section_movie_title").text("영화 선택");
				$(".section_schedule_title").text("날짜 / 시간");
				$("#section_movie_list").children("ul").children("li").removeClass("selected");
				$("#section_schedule_date").children("li").removeClass("selected");	
				$(".simple_info_content_date").text("");
				$(".simple_info_content_movie").text("");
				$(".section_cinema_title").text("영화관");
				$(".simple_info_content_specific").text("");
				
				let str = '<div id="section_schedule_box_information" class="nofilm"> ' +
				  '<img alt="필름 사진" src="/img/film.png"> ' +
				  '<p>조회 가능한 상영시간이 없습니다.</p> ' +
				  '<p>조건을 변경해주세요.</p> ' +
				  '</div>';
				$("#movie_room").html(str);
				
				$("#section_cinema_list_specific").empty();
				$.ajax({
					url: "http://localhost:9001/api/v1/reservation/special/count",
					method: "GET",
					dataType: "json",
					success: function(response){
						let str = '';	
						Object.entries(response).forEach(([key, value]) => {
							str += '<li class="' + key + '">' + value + '</li>';
						});
						$("#section_cinema_list_rough").html(str);
					},
					error: function(xhr, status, error){
						console.log(error);			
					}
				});
			});
			
			$(".4DX").on("click", function(){
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/cinema/special/list/" + 2,
					method : "GET",
					dataType: "json",
					success : function(response){
						let str = '';
						let cnt = 0;
						response.forEach(room => {
							str += '<li id="roomNo_' + room.roomNo + '">' + room.cinema.cinemaName + '</li>';
						});
						$("#section_cinema_list_specific").html(str);
						
					},
					error : function(xhr, status, error){
						console.log(error);
					}
				});
			});
			
			$(".IMAX").on("click", function(){
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/cinema/special/list/" + 3,
					method : "GET",
					dataType: "json",
					success : function(response){
						let str = '';
						let cnt = 0;
						response.forEach(cinema => {
							str += '<li id="roomNo_' + room.roomNo + '">' + room.cinema.cinemaName + '</li>';
						});
						$("#section_cinema_list_specific").html(str);
						
					},
					error : function(xhr, status, error){
						console.log(error);
					}
				});
			});
			
			$(".PRIVATE_BOX").on("click", function(){
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/cinema/special/list/" + 4,
					method : "GET",
					dataType: "json",
					success : function(response){
						let str = '';
						let cnt = 0;
						response.forEach(cinema => {
							str += '<li id="roomNo_' + room.roomNo + '">' + room.cinema.cinemaName + '</li>';
						});
						$("#section_cinema_list_specific").html(str);
						
					},
					error : function(xhr, status, error){
						console.log(error);
					}
				});
			});
			
			let movies = [];
			let ajaxList = [];
// 			$.ajax({
// 				url: "http://localhost:9001/api/v1/reservation/movie/aboutto/list",
// 				method: "GET",
// 				dataType: "json",
// 				success: function(response){
// 					response.forEach(movie => {
// 						ajaxList.push(
// 							$.ajax({
// 								url : "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=12cc7dc453c4bb57c2342f243ea66220&movieNm=" + movie.title,
// 								method: "GET",
// 								dataType : "json",
// 								success: function(response){
// 									if(response.movieListResult.movieList.length > 0){
// 										const prdtStatNm = response.movieListResult.movieList[0].prdtStatNm;
// 										if(prdtStatNm === "개봉준비" || prdtStatNm === "개봉예정"){
// 											movies.push(movie);	
// 										}
// 									}
									
// 								},
// 								error : function(xhr, status, error){
// 								}
// 							})
// 						);
// 					});
// 				},
// 				error: function(xhr, status, error){
// 					console.log(error);
// 				}
// 			});		
			
			// 처음에 나오는 코드를 수정 한뒤 복사해서 가지고 오면 된다.
			$("#section_movie_selection").on("change", function(){
				const optionId = $("#section_movie_selection option:selected").attr("id");
				if(optionId === "section_movie_select_reservation"){
					$.ajax({
						url: "http://localhost:9001/api/v1/reservation/movie/list",
						method: "GET",
						dataType: "json",
						success: function(response){
							let str = '';
							response.forEach(movie => {
								
								let title = '';
								if(movie.title.length > 25){
									title = movie.title.substring(0, 25) + "...";
								}else {
									title = movie.title;
								}
								
								if(movie.viewAge === "전체 관람가"){
									str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_all.png" class="grade"><span>' + title + '</span></li>';
								}else if(movie.viewAge === "12세 이상 관람가"){
									str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_12.png" class="grade"><span>' + title + '</span></li>';
								}else if(movie.viewAge === "15세 이상 관람가"){
									str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_15.png" class="grade"><span>' + title + '</span></li>';
								}else if(movie.viewAge === "청소년 관람불가") {
									str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/pc_grade_19.png" class="grade"><span>' + title + '</span></li>';
								}
								
							});
							
							$("#section_movie_list_info").html(str);
						},
						error: function(xhr, status, error){
							console.log(error);
						}
					});		
				}else if(optionId === "section_movie_select_aboutto"){
					let str = '';
					
					$.when.apply($, ajaxList).done(function() {
		                // 리스트 출력 (디버깅용)
						movies.forEach(movie => {
							
							let title = '';
							if(movie.title.length > 25){
								title = movie.title.substring(0, 25) + "...";
							}else {
								title = movie.title;
							}
							
							if(movie.viewAge === "전체 관람가"){
								str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_all.png" class="grade"><span>' + title + '</span></li>';
							}else if(movie.viewAge === "12세 이상 관람가"){
								str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_12.png" class="grade"><span>' + title + '</span></li>';
							}else if(movie.viewAge === "15세 이상 관람가"){
								str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/grade_15.png" class="grade"><span>' + title + '</span></li>';
							}else if(movie.viewAge === "청소년 관람불가") {
								str += '<li id="movieDC_' + movie.movieDC + '"><img alt="' + movie.viewAge + '" src="/img/pc_grade_19.png" class="grade"><span>' + title + '</span></li>';
							}
							
						});
						
						$("#section_movie_list_info").html(str);
		            });
					
				}
			});
			
			
			let str = '';
			let cnt = 0;
			const days = getNext8Days();
			
			days.forEach(day => {
				str += '<li class="section_schedule_date_slide">';
				if(cnt === 0 || day.getDate() === 1){
					str += '<strong>' + (day.getMonth() + 1) + '월</strong>';	
				}else {
					str += '<strong class="hide_strong">' + (day.getMonth() + 1) + '월</strong> '; 
				}
				str += '<a> <label for="date_' + cnt + '"> <input type="radio"' + 
					   'id="date_' + cnt + '" name="date_radio" class="date_radio"> ';
				if(day.getDay() === 0){
					str +=	'<strong style="color:red">' + day.getDate() + '</strong>';  
				}else if(day.getDay() === 6){
					str +=	'<strong style="color:blue">' + day.getDate() + '</strong>';  
				}else {
					str +=	'<strong>' + day.getDate() + '</strong>';  
				}					   
				//0:일, 1:월, 2:화, 3:수, 4:목, 5:금, 6:토
				let dayName = '';
				if(cnt === 0){
					dayName = '오늘';					
				}else if(day.getDay() === 0){
					dayName = '일';
				}else if(day.getDay() === 1){
					dayName = '월';
				}else if(day.getDay() === 2){
					dayName = '화';
				}else if(day.getDay() === 3){
					dayName = '수';
				}else if(day.getDay() === 4){
					dayName = '목';
				}else if(day.getDay() === 5){
					dayName = '금';
				}else if(day.getDay() === 6){
					dayName = '토';
				}
				
				if(day.getDay() === 0){
					str += '<em style="color:red">' + dayName + '</em></label> ' +
					   '</a></li>';
				}else if(day.getDay() === 6){
					str += '<em style="color:blue">' + dayName + '</em></label> ' +
					   '</a></li>';
				}else {
					str += '<em>' + dayName + '</em></label> ' +
					   '</a></li>';
				}	
				
				cnt++;
			});
			
			$("#section_schedule_date").html(str);
			
			
			
			// 날짜 선택했을 때
			$("#section_schedule_date").children("li").children("a").on("click", "label", function(event){
				if(event.target.tagName === "LABEL" || event.target.tagName === "STRONG" || event.target.tagName === "EM" ){
					$(this).parent().parent().addClass("selected");
					$(this).parent().parent().siblings().removeClass("selected");
					
					const year = new Date().getFullYear();
					let month = '';
					if($(this).parent("a").prev("strong").text().replace("월", "").length == 1){
						month = "0" + $(this).parent("a").prev("strong").text().replace("월", "");
					}else {
						month = $(this).parent("a").prev("strong").text().replace("월", "");
					}
					
					const date = $(this).children("strong").text();
					const day = $(this).children("em").text();
					const result = year + "-" + month + "-" + date + " ( " + day +  " )";
					
					
					
					$(".section_schedule_title").text("날짜 - " + result);
					$(".simple_info_content_date").text(result);
					
					const movieName = $(".section_movie_title").text();
					const cinemaName = $(".section_cinema_title").text();
					
					const now = new Date();
					
					const hours = now.getHours();
					const minutes = now.getMinutes();
					const seconds = now.getSeconds();
					
					if(cinemaName.length === 3){
						alert("영화관을 먼저 선택해주세요.");
						$(".section_schedule_title").text("날짜 / 시간");
						$("#section_schedule_date").children("li").removeClass("selected");	
						$(".simple_info_content_date").text("");
					}else if(movieName.length === 5){
						alert("영화를 먼저 선택해주세요.");
						$(".section_schedule_title").text("날짜 / 시간");
						$("#section_schedule_date").children("li").removeClass("selected");	
						$(".simple_info_content_date").text("");
					}else {
						
						if(day === "오늘"){
							if(movieName.length > 5 && cinemaName.length > 6){
								console.log("오늘");
								$.ajax({
									url : "http://localhost:9001/api/v1/reservation/schedule/list/" + cinemaName.substring(6, cinemaName.length) + "/" + movieName.substring(5, movieName.length) + "/" + (result + " " + hours + ":" + minutes + ":" + seconds),
									method: "GET",
									dataType : "json",
									success : function(response){
										console.log(response);
										let cnt = 0;
										const length = response.length;
										
										response.forEach(scheduleList => {
											if(scheduleList.length === 0){
												cnt++;
											}
										});
										
										if(length === cnt){
											let str = '<div id="section_schedule_box_information" class="nofilm"> ' +
													  '<img alt="필름 사진" src="/img/film.png"> ' +
													  '<p>조회 가능한 상영시간이 없습니다.</p> ' +
													  '<p>조건을 변경해주세요.</p> ' +
													  '</div>';
											$("#movie_room").html(str);
										}else {
											
											let str = '<div class="movie_info"> ';
											for(let i = 0; i < response.length; i++){
												
												if(response[i].length > 0){
													if(response[i][0].movieShowDetail.movie.viewAge === "전체 관람가"){
													    str += '<img alt="전체" src="/img/grade_all.png" class="grade">';
													}else if(response[i][0].movieShowDetail.movie.viewAge === "12세 이상 관람가"){
													    str += '<img alt="12세 관람가" src="/img/grade_12.png" class="grade">';
													}else if(response[i][0].movieShowDetail.movie.viewAge === "15세 이상 관람가"){
													    str += '<img alt="15세 관람가" src="/img/grade_15.png" class="grade">';
													}else if(response[i][0].movieShowDetail.movie.viewAge === "청소년 관람불가") {
													    str += '<img alt="청소년 관람불가" src="/img/pc_grade_19.png" class="grade">';
													}
													str += '<span>' + response[i][0].movieShowDetail.movie.title + '</span> ';
													str += '</div>';  // 여기서 <div> 태그를 닫습니다
													str += '<div class="room_schedule">';
													break;
												}
											}
											
											
											response.forEach(scheduleList => {
											    // 여기서 상영관 정보를 입력해야한다.
											    if(scheduleList.length > 0){
												    str += '<ul class="room_info">'; 
												    str += '<li>2D</li>';
											    	
												    if(scheduleList[0].movieShowDetail.dubbing === true){
												    	str += '<li>더빙</li>';								    	
												    }else if(scheduleList[0].movieShowDetail.subtitle === true){
												    	str += '<li>자막</li>';
												    }
												    
													if(scheduleList[0].movieShowDetail.dubbing === false && scheduleList[0].movieShowDetail.subtitle === false){
														 if(scheduleList[0].room.roomType.smallType.length > 1){
														        str += '<li class="nodubbingnosubtitle">' + scheduleList[0].room.roomType.roomName + ' (' + scheduleList[0].room.roomType.smallType + ')</li>';
														    } else {
														        str += '<li class="nodubbingnosubtitle">' + scheduleList[0].room.roomType.roomName + '</li>';
														    }
													}else {
														 if(scheduleList[0].room.roomType.smallType.length > 1){
														        str += '<li>' + scheduleList[0].room.roomType.roomName + ' (' + scheduleList[0].room.roomType.smallType + ')</li>';
														    } else {
														        str += '<li>' + scheduleList[0].room.roomType.roomName + '</li>';
														    }
													}
												    str += '</ul>';  // <ul> 태그를 닫습니다
												    
												    str += '<div class="room_detail_infos">';
												    if(scheduleList.length > 0){
												        scheduleList.forEach(schedule => {
												            const worldTime = schedule.start;
												            const koreanTime = new Date(worldTime).toString();
												            const time = koreanTime.split(" ")[4].split(":")[0] + ":" + koreanTime.split(" ")[4].split(":")[1];
												            const roomName = schedule.room.roomType.roomName;
												            const totalSeats = schedule.room.roomType.roomTotalColumn * schedule.room.roomType.roomTotalRow;
												            // 여기서 상영시간표 정보를 입력해야한다.
															str += '<a class="room_detail_info" onclick="moveToSeatPage(event)" id="scheduleNo_' + schedule.scheduleNo + '">' +		
												            	   '<span class="time_image">';
												            if(parseInt(time.split(":")[0]) >= 8 && parseInt(time.split(":")[0]) <= 10){
													            str += '<img alt="조조 사진" src="/img/time_sun.png"></span>';
												            }else if(parseInt(time.split(":")[0] >= 00 && parseInt(time.split(":")[0]) <= 02)) {
												            	str += '<img alt="심야 사진" src="/img/time_moon.png"></span>';
												            }else {
												            	str += '<img alt="심야 사진" src="/img/time_moon.png" style="visibility:hidden"></span>';
												            }
												            
												            let resultLeftSeat = '';
												            if(schedule.leftSeat < 10){
												            	resultLeftSeat = '0' + schedule.leftSeat;
												            }else {
												            	resultLeftSeat = schedule.leftSeat;
												            }
												            
												            str += '<strong>' + time + '</strong>' +
												                   '<span class="seats_left">' + resultLeftSeat + '</span>' +
												                   '<span class="seats_total">/' + schedule.totalSeat + '</span>' +
												                   '<span class="room_number">' + roomName + '</span>' +
												                   '</a>';
												        });
												    }
												    str += '</div>';  // <div class="room_detail_infos"> 태그를 닫습니다
											    }
											});
											str += '</div>';  // <div class="room_schedule"> 태그를 닫습니다
											$("#movie_room").html(str);
										}
									},
									error : function(xhr, status, error){
										console.log(error);
									}
								});
							}
						}else {
							if(movieName.length > 5 && cinemaName.length > 6){
								$.ajax({
									url : "http://localhost:9001/api/v1/reservation/schedule/list/" + cinemaName.substring(6, cinemaName.length) + "/" + movieName.substring(5, movieName.length) + "/" + result + " -",
									method: "GET",
									dataType : "json",
									success : function(response){
										console.log(response);
										let cnt = 0;
										const length = response.length;
										
										response.forEach(scheduleList => {
											if(scheduleList.length === 0){
												cnt++;
											}
										});
										
										if(length === cnt){
											let str = '<div id="section_schedule_box_information" class="nofilm"> ' +
													  '<img alt="필름 사진" src="/img/film.png"> ' +
													  '<p>조회 가능한 상영시간이 없습니다.</p> ' +
													  '<p>조건을 변경해주세요.</p> ' +
													  '</div>';
											$("#movie_room").html(str);
										}else {
											
											let str = '<div class="movie_info"> ';
											for(let i = 0; i < response.length; i++){
												
												if(response[i].length > 0){
													if(response[i][0].movieShowDetail.movie.viewAge === "전체 관람가"){
													    str += '<img alt="전체" src="/img/grade_all.png" class="grade">';
													}else if(response[i][0].movieShowDetail.movie.viewAge === "12세 이상 관람가"){
													    str += '<img alt="12세 관람가" src="/img/grade_12.png" class="grade">';
													}else if(response[i][0].movieShowDetail.movie.viewAge === "15세 이상 관람가"){
													    str += '<img alt="15세 관람가" src="/img/grade_15.png" class="grade">';
													}else if(response[i][0].movieShowDetail.movie.viewAge === "청소년 관람불가") {
													    str += '<img alt="청소년 관람불가" src="/img/pc_grade_19.png" class="grade">';
													}
													str += '<span>' + response[i][0].movieShowDetail.movie.title + '</span> ';
													str += '</div>';  // 여기서 <div> 태그를 닫습니다
													str += '<div class="room_schedule">';
													break;
												}
											}
											
											
											response.forEach(scheduleList => {
											    // 여기서 상영관 정보를 입력해야한다.
											    if(scheduleList.length > 0){
												    str += '<ul class="room_info">'; 
												    str += '<li>2D</li>';
											    	
												    if(scheduleList[0].movieShowDetail.dubbing === true){
												    	str += '<li>더빙</li>';								    	
												    }else if(scheduleList[0].movieShowDetail.subtitle === true){
												    	str += '<li>자막</li>';
												    }
												    
													if(scheduleList[0].movieShowDetail.dubbing === false && scheduleList[0].movieShowDetail.subtitle === false){
														 if(scheduleList[0].room.roomType.smallType.length > 1){
														        str += '<li class="nodubbingnosubtitle">' + scheduleList[0].room.roomType.roomName + ' (' + scheduleList[0].room.roomType.smallType + ')</li>';
														    } else {
														        str += '<li class="nodubbingnosubtitle">' + scheduleList[0].room.roomType.roomName + '</li>';
														    }
													}else {
														 if(scheduleList[0].room.roomType.smallType.length > 1){
														        str += '<li>' + scheduleList[0].room.roomType.roomName + ' (' + scheduleList[0].room.roomType.smallType + ')</li>';
														    } else {
														        str += '<li>' + scheduleList[0].room.roomType.roomName + '</li>';
														    }
													}
												    str += '</ul>';  // <ul> 태그를 닫습니다
												    
												    str += '<div class="room_detail_infos">';
												    if(scheduleList.length > 0){
												        scheduleList.forEach(schedule => {
												            const worldTime = schedule.start;
												            const koreanTime = new Date(worldTime).toString();
												            const time = koreanTime.split(" ")[4].split(":")[0] + ":" + koreanTime.split(" ")[4].split(":")[1];
												            const roomName = schedule.room.roomType.roomName;
												            const totalSeats = schedule.room.roomType.roomTotalColumn * schedule.room.roomType.roomTotalRow;
												            // 여기서 상영시간표 정보를 입력해야한다.
															str += '<a class="room_detail_info" onclick="moveToSeatPage(event)" id="scheduleNo_' + schedule.scheduleNo + '">' +		
												            	   '<span class="time_image">';
												            if(parseInt(time.split(":")[0]) >= 8 && parseInt(time.split(":")[0]) <= 10){
													            str += '<img alt="조조 사진" src="/img/time_sun.png"></span>';
												            }else if(parseInt(time.split(":")[0] >= 00 && parseInt(time.split(":")[0]) <= 02)) {
												            	str += '<img alt="심야 사진" src="/img/time_moon.png"></span>';
												            }else {
												            	str += '<img alt="심야 사진" src="/img/time_moon.png" style="visibility:hidden"></span>';
												            }
												            
												            let resultLeftSeat = '';
												            if(schedule.leftSeat < 10){
												            	resultLeftSeat = '0' + schedule.leftSeat;
												            }else {
												            	resultLeftSeat = schedule.leftSeat;
												            }
												            
												            str += '<strong>' + time + '</strong>' +
												                   '<span class="seats_left">' + resultLeftSeat + '</span>' +
												                   '<span class="seats_total">/' + schedule.totalSeat + '</span>' +
												                   '<span class="room_number">' + roomName + '</span>' +
												                   '</a>';
												        });
												    }
												    str += '</div>';  // <div class="room_detail_infos"> 태그를 닫습니다
											    }
											});
											str += '</div>';  // <div class="room_schedule"> 태그를 닫습니다
											$("#movie_room").html(str);
										}
										
									},
									error : function(xhr, status, error){
										console.log(error);
									}
								});
							}
						}
					}
				}
				
				
				
			});
			
			// 지점명 클릭 했을때
			$("#section_cinema_list_specific").on("click", "li", function() {
				$(this).addClass("selected");
				$(this).siblings().removeClass("selected");
				
				const cinemaName = $(this).text();
				$(".section_cinema_title").text("영화관 - " + cinemaName);
				$(".simple_info_content_specific").text(cinemaName);
				
				const cinemaNo = $(this).attr("id");
				
				let str = '<div id="section_schedule_box_information" class="nofilm"> ' +
				  '<img alt="필름 사진" src="/img/film.png"> ' +
				  '<p>조회 가능한 상영시간이 없습니다.</p> ' +
				  '<p>조건을 변경해주세요.</p> ' +
				  '</div>';
				$("#movie_room").html(str);
				
				const movieName = $(".section_movie_title").text();
				const date = $(".section_schedule_title").text();
				
				if(movieName.length > 5 || date.length > 5){
					$(".section_movie_title").text("영화 선택");
					$(".section_schedule_title").text("날짜 / 시간");
					$("#section_movie_list").children("ul").children("li").removeClass("selected");
					$("#section_schedule_date").children("li").removeClass("selected");	
					$(".simple_info_content_date").text("");
					$(".simple_info_content_movie").text("");
				}
				
			});
			
			// 영화 클릭 했을 때			
			$("#section_movie_list").children("ul").on("click", "li", function() {
				$(this).addClass("selected");
				$(this).siblings().removeClass("selected");
				
				const title = $(this).text();
				
				let str = '<div id="section_schedule_box_information" class="nofilm"> ' +
				  '<img alt="필름 사진" src="/img/film.png"> ' +
				  '<p>조회 가능한 상영시간이 없습니다.</p> ' +
				  '<p>조건을 변경해주세요.</p> ' +
				  '</div>';
				$("#movie_room").html(str);
				
				
				$(".section_movie_title").text("영화 - " + title);
				$(".simple_info_content_movie").text(title);
				
				
				const cinemaName = $(".section_cinema_title").text();

				if(cinemaName.length === 3){
					alert("영화관을 먼저 선택해주세요.");
					$(".section_movie_title").text("영화 선택");
					$("#section_movie_list").children("ul").children("li").removeClass("selected");
					$(".simple_info_content_movie").text("");
				}
				
				const date = $(".section_schedule_title").text();
				if(date.length > 7){
					$(".section_schedule_title").text("날짜 / 시간");
					$("#section_schedule_date").children("li").removeClass("selected");	
					$(".simple_info_content_movie").text("");
				}
			});
			
		});
		
		function moveToSeatPage(event){
			
			let scheduleNo = "";
			
			if(event.target.tagName === "STRONG"){
				scheduleNo = event.target.parentNode.id;
			}else if(event.target.className === "time_image"){
				scheduleNo = event.target.parentNode.id;
			}else if(event.target.className === "room_number"){
				scheduleNo = event.target.parentNode.id;
			}else if(event.target.className === "seats_total"){
				scheduleNo = event.target.parentNode.id;
			}else if(event.target.className === "seats_left") {
				scheduleNo = event.target.parentNode.id;
			}else {
				scheduleNo = event.target.id;
			}
			
			const movie = $(".simple_info_content_movie").text();
			const specific = $(".simple_info_content_specific").text();
			const date = $(".simple_info_content_date").text();
			const time = $(".simple_info_content_time").text();
			
			console.log("movie : " + movie);
			console.log("specific : " + specific);
			console.log("date : " + date);
			
			if(confirm("이 영화 정보로 예약하시겠습니까?")){
				location.href="http://localhost:8080/reservation/seat/" + scheduleNo.substring(11, scheduleNo.length) + "/" + movie + "/" + specific + "/" + date;
			}
			
		}
		
		
// 		function getSeatLeft(roomNo){
// 			return $.ajax({
//             	url : "http://localhost:9001/api/v1/reservation/seat/left/" + roomNo,
//             	method : "GET",
//             	dataType : "text"
//             });
// 		}
		
	</script>
</body>
</html>




