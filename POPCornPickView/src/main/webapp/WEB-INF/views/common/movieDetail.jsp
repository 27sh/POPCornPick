<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화상세보기</title>
<style>
main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border: 1px solid #eee;
}

body {
	font-family: Arial, sans-serif;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	border-radius: 8px;
	
}

.header, .description, .stats, .reviews, .still-cuts, .rating {
	margin-bottom: 20px;
	padding: 10px;
	background-color: #fff;
}

.header {
	display: flex;
	align-items: center;
}

.movie-poster {
	width: 150px;
	height: 220px;
	background-color: #ccc;
	margin-right: 20px;
}

.movie-info {
	flex-grow: 1;
}

.watch-button, .like-button {
	margin: 5px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.watch-button {
	background-color: #ff5733;
	color: #fff;
}

.like-button {
	background-color: #33c5ff;
	color: #fff;
}

.description h2, .stats h2, .reviews h2, .still-cuts h2, .rating h2 {
	margin-top: 0;
}

.stats-graphs {
	display: flex;
	justify-content: space-around;
}

.age-group, .gender-group {
	width: 45%;
}

.graph {
	width: 100%;
	height: 200px;
	background-color: #e6e6e6;
	border-radius: 8px;
}

.review-list {
	display: flex;
	justify-content: space-around;
}

.review-item {
	width: 30%;
	height: 150px;
	background-color: #e6e6e6;
	border-radius: 8px;
}

.still-cuts {
	position: relative;
	width: 98%;
}

.slider {
	position: relative;
	overflow: hidden;
	width: 100%;
	text-align: center;
}

.s {
	display: flex;
	transition: transform 0.5s ease-in-out;
}

.slide {
	min-width: 100%;
	box-sizing: border-box;
}

.slide img {
	width: 100%;
	border-radius: 8px;
}

.prev, .next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	border: none;
	padding: 10px;
	cursor: pointer;
	border-radius: 50%;
}

.prev {
	left: 10px;
}

.next {
	right: 10px;
}

.rating-score {
	font-size: 24px;
	text-align: center;
}

.rating-breakdown div {
	margin: 5px 0;
}
.formats {
    display: inline-block;
    margin-left: 10px;
}

.format {
    display: inline-block;
    background-color: #eee;
    color: #333;
    padding: 5px 10px;
    border-radius: 4px;
    margin-right: 5px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>

		<div class="container">
			<div class="header">
				<div class="movie-poster"></div>
				<div class="movie-info">
					<h1>인사이드 아웃 2</h1>
					<button class="watch-button">예매하기</button>
					<div class="formats">
                    <span class="format">IMAX</span>
                    <span class="format">4DX</span>
                </div>
				</div>
			</div>

			<div class="description">
				<h2>영화 설명</h2>
				<p>
					어린이들이 볼 수 있는 감동적인 이야기...
					<!-- Movie description goes here -->
				</p>
			</div>

			<div class="stats">
				<h2>관객 통계</h2>
				<div class="stats-graphs">
					<div class="age-group">
						<h3>연령별 관람비율</h3>
						<div class="graph age-graph"></div>
					</div>
					<div class="gender-group">
						<h3>성별 관람비율</h3>
						<div class="graph gender-graph"></div>
					</div>
				</div>
			</div>

			<div class="reviews">
				<h2>트레일러(유투브 예고편이 올라갈 예정)</h2>
				<div class="review-list">
					<div class="review-item"></div>
					<div class="review-item"></div>
					<div class="review-item"></div>
				</div>
			</div>

			<div class="still-cuts">
				<h2>스틸컷</h2>
				<div class="slider">
					<div class="slides">
						<div class="slide">
							<img src="" alt="Still Cut 1">
						</div>
						<div class="slide">
							<img src="" alt="Still Cut 2">
						</div>
						<div class="slide">
							<img src="" alt="Still Cut 3">
						</div>
					</div>
					<button class="prev" onclick="moveSlide(-1)">&#10094;</button>
					<button class="next" onclick="moveSlide(1)">&#10095;</button>
				</div>
			</div>


			<div class="rating">
				<h2>평점</h2>
				<div class="rating-score">
					<span>8.8 / 10</span> <span>★ ★ ★ ★ ★</span>
				</div>
				<div class="rating-breakdown">
					<div>5점: 100</div>
					<div>4점: 50</div>
					<div>3점: 20</div>
					<div>2점: 10</div>
					<div>1점: 5</div>
				</div>
				<button class="watch-button">평점작성</button>
			</div>
		</div>




	</main>
	<footer> </footer>

	<script>
	let currentSlide = 0;

	function moveSlide(n) {
	    const slides = document.querySelectorAll('.slide');
	    const totalSlides = slides.length;

	    currentSlide += n;

	    if (currentSlide >= totalSlides) {
	        currentSlide = 0;
	    } else if (currentSlide < 0) {
	        currentSlide = totalSlides - 1;
	    }

	    const slideWidth = slides[0].clientWidth;
	    document.querySelector('.slides').style.transform = `translateX(${-currentSlide * slideWidth}px)`;
	}

	// Ensure the function is attached to the buttons
	document.querySelector('.prev').addEventListener('click', () => moveSlide(-1));
	document.querySelector('.next').addEventListener('click', () => moveSlide(1));

	</script>

</body>
</html>