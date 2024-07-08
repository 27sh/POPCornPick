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
<style type="text/css">
	body{
		box-sizing: border-box;
	}
	#container{
    	background-color: #444;
    	background: #444;
	}
	#wrapper{
		margin: 0 auto;
		width: 1280px;
		position: absolute;
		height: 866px;
		display: flex;
		flex-direction: row;
	}
	#simple_infos{
		display: flex;
		flex-direction: column;
		height: 100%;
		z-index: 9999;
	}
	.simple_info{
		display: flex;
		flex-direction: row;
		height: 100%;
		position: absolute;
	}
	.simple_info:nth-child(2){
		top: 216.5px;
	}
	.simple_info:nth-child(3){
		top: 433px;
	}
	.simple_info:nth-child(4){
		top: 649.5px;
	}
	.simple_info_title{
		text-align: center;
		width: 80px;
		background: rgb(248, 47, 98);
		color: white;
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
	}
	.simple_info_content{
		text-align: center;
		width: 80px;
		background: rgb(248, 47, 98);
		color: white;
		height: 216.5px;
		display: flex;
		align-items: center;
		postion: relative;
		left: 80px;
	}
	.simple_info_content ul{
		height: 100%;
		padding-left: 20px;
		padding-right: 20px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		margin: 0;
	}
	.simple_info_content ul li{
		font-size: 12px;
		margin: 10px 0;
	}
	.hidden{
		display: none;
	}
	#section_cinema{
		width: 355px;
		position: relative;
		left: 80px;
	}
	#section_cinema h4{
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
	#section_cinema_tab{
		display: flex;
	}
	#section_cinema_tab button{
		width: 50%;
		height: 61px;
		border: none;
		color: grey;
		cursor: pointer;
	}
	#section_cinema_tab .selected{
		font-weight: bold;
		color: black;
		border-bottom: 2px solid black;
	}
	#section_cinema_list{
		display: flex;
		height: 750px;
	}
	#section_cinema_list ul{
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
	
	#section_cinema_list ul:first-child{
		background: #ededed;
	}
	#section_cinema_list ul li{
		cursor: pointer;
		display: block;
	    position: relative;
	    width: 175px;
	    box-sizing: border-box;
	    padding: 10px 16px;
	    font-size: 13px;
	}
	section_cinema_list ul:first-child li.selected{
		background: yellow !important;
	}
	main {
		width: 1280px;
		margin: 80px auto;
		background: 
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
					<ul class="scroll_container">
						<li class="selected">My 영화관(0)</li>
						<li>서울(1)</li>
						<li>경기/인천(2)</li>
						<li class="selected">My 영화관(0)</li>
						<li>서울(1)</li>
						<li>경기/인천(2)</li>
						<li class="selected">My 영화관(0)</li>
						<li>서울(1)</li>
						<li>경기/인천(2)</li>
						<li class="selected">My 영화관(0)</li>
						<li>서울(1)</li>
						<li>경기/인천(2)</li>
						<li class="selected">My 영화관(0)</li>
						<li>서울(1)</li>
						<li>경기/인천(2)</li>
						<li class="selected">My 영화관(0)</li>
						<li>서울(1)</li>
						<li>경기/인천(2)</li>
						<li class="selected">My 영화관(0)</li>
						<li>서울(1)</li>
						<li>경기/인천(2)</li>
						<li class="selected">My 영화관(0)</li>
						<li>서울(1)</li>
						<li>경기/인천(2)</li>
					</ul>
					<ul class="scroll_container">
						<li>가산디지털</li>
						<li>가양</li>
						<li>강동</li>
					</ul>
				</div>
			</section>
		</div>
	</div>
	</main>
	<footer>
	
	</footer>
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