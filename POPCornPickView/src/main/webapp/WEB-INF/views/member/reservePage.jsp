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

.btn_view_txt {
	width: 20px;
	height: 20px;
	border: none;
	text-indent: -9999em;
	background: url(/img/btn_list_view_txt_on.png) no-repeat center center;
}

.btn_view_view {
	width: 20px;
	height: 20px;
	border: none;
	text-indent: -9999em;
	background: url(/img/btn_list_view_thm_on.png) no-repeat center center;
}

#section_movie {
	position: relative;
	left: 80px;
	width: 355px;
}

#section_movie_select {
	height: 61px;
	width: 100%;
	background: #DDD;
	display: flex;
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
	left: 70px;
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
	background: #DDD;
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

.grade {
	margin-right: 10px;
}

#section_schedule {
	position: relative;
	left: 80px;
	width: 499px;
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
									<button type="button" class="btn_view_txt">텍스트형</button>
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
							<li class="selected">
								<img alt="전체 관람가"
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
				</section>
			</div>
		</div>
	</main>
	<footer> </footer>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".simple_info_title").on("mouseenter", function(){
				$(this).next(".simple_info_content").removeClass("hidden");
			});
			
			$(".simple_info_title").on("mouseleave", function(){
				$(this).next(".simple_info_content").addClass("hidden");
			});
		});
		
		const scrollList = document.querySelector("ul");
		scrollList.addEventListener('wheel', (e) => {
			console.log(e);
			e.preventDefault(); // 기본 스크롤 동작을 막습니다.

	        const scrollAmount = 5; // 한 번 스크롤할 때 이동할 양을 설정합니다.
	        if (e.deltaY > 0) {
	            // 스크롤 다운
	            scrollContainer.scrollBy({ top: scrollAmount, left: 0, behavior: 'smooth' });
	        } else {
	            // 스크롤 업
	            scrollContainer.scrollBy({ top: -scrollAmount, left: 0, behavior: 'smooth' });
	        }
	    });
	</script>
</body>
</html>