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

.simple_info_title {
	text-align: center;
	width: 80px;
	background: rgb(248, 47, 98);
	color: white !important;
	height: 216.5px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.simple_info_title p {
	width: fit-content;
	margin: 0 auto;
	font-size: 14px;
	font-weight: bold;
}

.simple_info_content {
	text-align: center;
	width: 80px;
	background: rgb(248, 47, 98);
	color: white !important;
	height: 216.5px;
	display: flex;
	align-items: center;
	postion: relative;
	left: 80px;
}

.simple_info_content ul {
	height: 100%;
	padding-left: 20px;
	padding-right: 20px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 0;
}

.simple_info_content ul li {
	font-size: 12px;
	margin: 10px 0;
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
}

#section_cinema_list ul:nth-child(2) li.selected {
	border: 3px solid pink;
	color: rgb(248, 47, 98);
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
}

#section_movie_list ul li.selected span {
	color: rgb(248, 47, 98);
}

._check {
	position: absolute;
	right: 10px;
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
	padding: 12px 20px 10px;
	background: #f0f0f0;
}

.date_radio {
	display: none;
}

#section_schedule_date_slides {
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

.date_radio.selected+strong {
	width: 30px;
	height: 30px;
	line-height: 30px;
	margin: 0 auto;
	font-size: 15px;
	text-align: center;
	background: black;
	color: white;
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
	left: 10px;
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

#section_schedule_box.none {
	height: 648px;
	background: grey;
	display: flex;
	justify-content: center;
	align-items: center;
}
#section_schedule_box{
	height: 648px;
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

.room_schedule {
	margin-bottom: 30px;
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
	border-right: 1px solid #edebeb;
	border-left: 1px solid #edebeb;
}

.room_info li:nth-child(3) {
	padding-left: 5px;
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
	left: 12px;
	font-size: 12px;
	color: green;
}
.movie_room{
	margin-top: 30px;
}
.movie_info{
	display: flex;
	align-items: center;
	margin-left: 10px;
	margin-bottom: 20px;
}
.movie_info span{
	font-weight: bold;
}
main {
	s width: 1280px;
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
						<div class="simple_info_title">
							<p>01</p>
							<p>상영시간</p>
						</div>
						<div class="simple_info_content hidden">
							<ul>
								<li>aaa</li>
								<li>bbb</li>
								<li>ccc</li>
								<li>ddd</li>
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
								<li>aaa</li>
								<li>bbb</li>
								<li>ccc</li>
								<li>ddd</li>
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
								<li>aaa</li>
								<li>bbb</li>
								<li>ccc</li>
								<li>ddd</li>
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
								<li>aaa</li>
								<li>bbb</li>
								<li>ccc</li>
								<li>ddd</li>
							</ul>
						</div>
					</div>
				</div>
				<section id="section_cinema">
					<h4>영화관</h4>
					<div id="section_cinema_tab">
						<button class="selected">전체</button>
						<button>스페셜관</button>
					</div>
					<div id="section_cinema_list">
						<ul class="scroll_container" id="section_cinema_list_rough">
							<li>My 영화관(0)</li>
							<li>서울(1)</li>
							<li>경기/인천(2)</li>
							<li>My 영화관(0)</li>
							<li>서울(1)</li>
							<li>경기/인천(2)</li>
							<li class="selected"><span>My 영화관(0)</span><img alt="체크 사진"
								src="/img/check.png" class="_check"></li>
							<li>서울(1)</li>
							<li>경기/인천(2)</li>
							<li>My 영화관(0)</li>
							<li>서울(1)</li>
							<li>경기/인천(2)</li>
							<li>My 영화관(0)</li>
							<li>서울(1)</li>
							<li>경기/인천(2)</li>
							<li>My 영화관(0)</li>
							<li>서울(1)</li>
							<li>경기/인천(2)</li>
							<li>My 영화관(0)</li>
							<li>서울(1)</li>
							<li>경기/인천(2)</li>
							<li>My 영화관(0)</li>
							<li>서울(1)</li>
							<li>경기/인천(2)</li>
						</ul>
						<ul class="scroll_container" id="section_cinema_list_specific">
							<li class="selected"><span>가산디지털</span><img alt="체크 사진"
								src="/img/check.png" class="_check"></li>
							<li>가양</li>
							<li>강동</li>
						</ul>
					</div>
				</section>
				<section id="section_movie">
					<h4>영화 선택</h4>
					<div id="section_movie_select">
						<select>
							<option>예매순</option>
							<option>관객순</option>
							<option>예정작</option>
						</select>
						<div id="section_movie_buttons">
							<ul>
								<li>
									<button type="button" class="btn_view_txt selected">텍스트형</button>
								</li>
								<li>
									<button type="button" class="btn_view_view">썸네일형</button>
								</li>
							</ul>
						</div>
					</div>
					<div id="section_movie_list">
						<ul class="scroll_container">
							<li><img alt="12세 관람가" src="/img/grade_12.png" class="grade"><span>파일럿</span></li>
							<li class="selected"><img alt="전체 관람가"
								src="/img/grade_all.png" class="grade"><span>인사이드
									아웃2</span><img alt="체크 사진" src="/img/check.png" class="_check">
							</li>
							<li>탈주</li>
							<li>파일럿</li>
							<li>인사이드 아웃2</li>
							<li>탈주</li>
							<li>파일럿</li>
							<li>인사이드 아웃2</li>
							<li>탈주</li>
							<li>파일럿</li>
							<li>인사이드 아웃2</li>
							<li>탈주</li>
							<li>파일럿</li>
							<li>인사이드 아웃2</li>
							<li>탈주</li>
							<li>파일럿</li>
							<li>인사이드 아웃2</li>
							<li>탈주</li>
							<li>파일럿</li>
							<li>인사이드 아웃2</li>
							<li>탈주</li>
							<li>파일럿</li>
							<li>인사이드 아웃2</li>
							<li>탈주</li>
							<li>파일럿</li>
							<li>인사이드 아웃2</li>
							<li>탈주</li>
							<li>파일럿</li>
						</ul>
					</div>
				</section>
				<section id="section_schedule">
					<h4>날짜/시간</h4>
					<div id="section_schedule_date">
						<ul id="section_schedule_date_slides">
							<li class="section_schedule_date_slide"><strong>7월</strong>
								<a href="#"> <label for="ddd"> <input type="radio"
										id="ddd" checked name="date_radio" class="date_radio selected">
										<strong>9</strong> <em>오늘</em>
								</label>
							</a></li>
							<li class="section_schedule_date_slide"><strong
								style="visibility: hidden">7월</strong> <a href="#"> <label
									for="eee"> <input type="radio" id="eee"
										name="date_radio" class="date_radio"> <strong>10</strong>
										<em>수</em>
								</label>
							</a></li>
							<li class="section_schedule_date_slide"><strong
								style="visibility: hidden">7월</strong> <a href="#"> <label
									for="eee"> <input type="radio" id="eee"
										name="date_radio" class="date_radio"> <strong>10</strong>
										<em>수</em>
								</label>
							</a></li>
							<li class="section_schedule_date_slide"><strong
								style="visibility: hidden">7월</strong> <a href="#"> <label
									for="eee"> <input type="radio" id="eee"
										name="date_radio" class="date_radio"> <strong>10</strong>
										<em>수</em>
								</label>
							</a></li>
							<li class="section_schedule_date_slide"><strong
								style="visibility: hidden">7월</strong> <a href="#"> <label
									for="eee"> <input type="radio" id="eee"
										name="date_radio" class="date_radio"> <strong>10</strong>
										<em>수</em>
								</label>
							</a></li>
							<li class="section_schedule_date_slide"><strong
								style="visibility: hidden">7월</strong> <a href="#"> <label
									for="eee"> <input type="radio" id="eee"
										name="date_radio" class="date_radio"> <strong>10</strong>
										<em>수</em>
								</label>
							</a></li>
							<li class="section_schedule_date_slide saturday"><strong
								style="visibility: hidden">7월</strong> <a href="#"> <label
									for="eee"> <input type="radio" id="eee"
										name="date_radio" class="date_radio"> <strong>10</strong>
										<em>토</em>
								</label>
							</a></li>
							<li class="section_schedule_date_slide sunday"><strong
								style="visibility: hidden">7월</strong> <a href="#"> <label
									for="eee"> <input type="radio" id="eee"
										name="date_radio" class="date_radio"> <strong>10</strong>
										<em>일</em>
								</label>
							</a></li>
						</ul>
						<a href="#"><img alt="이전 사진" src="/img/arr_lf_11.png"
							class="previous disabled"></a> <a href="#"><img alt="다음 사진"
							src="/img/arr_rg_11.png" class="next disabled"></a>
					</div>
					<div id="section_schedule_tab">
						<button class="selected">전체</button>
						<button>스페셜관</button>
						<button>Atmos</button>
						<button>13시 이후</button>
						<button>19시 이후</button>
						<button>심야</button>
					</div>
					<div id="section_schedule_box">
						<!-- 
						<div id="section_schedule_box_information">
							<img alt="필름 사진" src="/img/film.png">
							<p>조회 가능한 상영시간이 없습니다.</p>
							<p>조건을 변경해주세요.</p>
						</div>
						 -->
						<div class="movie_room">
							<div class="movie_info">
								<img alt="12세 관람가" src="/img/grade_12.png" class="grade">
								<span>파일럿</span>
							</div>
							<div class="room_schedule">
								<ul class="room_info">
									<li>2D</li>
									<li>자막</li>
									<li>3관 (Laser)</li>
								</ul>
								<div class="room_detail_infos">
									<a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a>
								</div>
							</div>
							<div class="room_schedule">
								<ul class="room_info">
									<li>2D</li>
									<li>자막</li>
									<li>3관 (Laser)</li>
								</ul>
								<div class="room_detail_infos">
									<a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a>
								</div>
							</div>
							<div class="room_schedule">
								<ul class="room_info">
									<li>2D</li>
									<li>자막</li>
									<li>3관 (Laser)</li>
								</ul>
								<div class="room_detail_infos">
									<a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a>
								</div>
							</div>
							<div class="room_schedule">
								<ul class="room_info">
									<li>2D</li>
									<li>자막</li>
									<li>3관 (Laser)</li>
								</ul>
								<div class="room_detail_infos">
									<a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a>
								</div>
							</div>
							<div class="room_schedule">
								<ul class="room_info">
									<li>2D</li>
									<li>자막</li>
									<li>3관 (Laser)</li>
								</ul>
								<div class="room_detail_infos">
									<a href="#" class="room_detail_info"> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a> <a href="#" class="room_detail_info"> <span
										class="time_image"><img alt="조조 사진"
											src="/img/time_sun.png"></span> <strong>09:30</strong> <span
										class="seats_left">136</span><span class="seats_total">/136</span><span
										class="room_number">3관</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	<footer> </footer>
	<script type="text/javascript">
		function getNext30Days() {
			const today = new Date();
			const days = [];

			for (let i = 0; i < 30; i++) {
				const nextDate = new Date(today);
				nextDate.setDate(today.getDate() + i);
				days.push(nextDate);
			}

			return days;
		}

		$(document).ready(function() {
			$(".simple_info_title").on("mouseenter", function() {
				$(this).next(".simple_info_content").removeClass("hidden");
			});

			$(".simple_info_title").on("mouseleave", function() {
				$(this).next(".simple_info_content").addClass("hidden");
			});
			
			const days = getNext30Days();
			let str = '';
			days.forEach(day => {
				str += '';
			});
			
			$("#section_schedule_date_slide").html(str);
			
			$("input[type=radio]").on("click", function(){
				console.log(this.id);
			});
		});

		
	</script>
</body>
</html>