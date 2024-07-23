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


 .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 700px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
	<div id="targetElement"></div>
-
	</main>
	<footer> 
	</footer>

	<script>
	
	$(document).ready(function(){
		
		const movieDetailDC = "${movieDC}"
		console.log(movieDetailDC);
		
		$.ajax({
			url : "http://localhost:9001/api/v1/film/movieDetail/" + movieDetailDC,
			method : "GET",
			success: function(data){
				console.log(data);
				
			    let str = '';
			    str += '<div class="container">';
			    str += '    <div class="header">';
			    str += '        <div class="movie-poster"></div>';
			    str += '        <div class="movie-info">';
			    str += '            <h1>' + data[0].movie.movieNm + '</h1>';
			    str += '            <span>감독: ' + data[0].movie.directors + '/배우: ' + data[0].movie.actors + '</span><br>';
			    str += '            <span>장르: ' + data[0].movie.genres + '/기본정보: ' + data[0].movie.nations +',' + data[0].movie.showTm + '</span><br>';
			    str += '            <span>개봉: ' + data[0].movie.openDt + '</span><br><br>';
			    str += '            <button class="watch-button">예매하기</button>';
			    str += '            <div class="formats">';
			    str += '                <span class="format">IMAX</span>';
			    str += '                <span class="format">4DX</span>';
			    str += '            </div>';
			    str += '        </div>';
			    str += '    </div>';
			    str += '    <div class="description">';
			    str += '        <h2>영화 설명</h2>';
			    str += '        <p style="white-space: pre-line;">' + data[0].movie.description + '</p>';
			    str += '    </div>';
			    str += '    <div class="stats">';
			    str += '        <h2>관객 통계</h2>';
			    str += '        <div class="stats-graphs">';
			    str += '            <div class="age-group">';
			    str += '                <h3>연령별 관람비율</h3>';
			    str += '                <div class="graph age-graph"></div>';
			    str += '            </div>';
			    str += '            <div class="gender-group">';
			    str += '                <h3>성별 관람비율</h3>';
			    str += '                <div class="graph gender-graph"></div>';
			    str += '            </div>';
			    str += '        </div>';
			    str += '    </div>';
			    str += '    <div class="reviews">';
			    str += '        <h2>트레일러(유투브 예고편이 올라갈 예정)</h2>';
			    str += '        <div class="review-list">';
			    					for(let i=0; i<data.length; i++){
			    str += '            <div class="review-item" value="'+ data[i].vid+'" data-vid="YouTubeVideoID1"></div>';
			    					}
			    str += '        </div>';
			    str += '    </div>';
			    str += '    <div class="still-cuts">';
			    str += '        <h2>스틸컷</h2>';
			    str += '        <div class="slider">';
			    str += '            <div class="slides">';
			    str += '                <div class="slide">';
			    str += '                    <img src="" alt="Still Cut 1">';
			    str += '                </div>';
			    str += '                <div class="slide">';
			    str += '                    <img src="" alt="Still Cut 2">';
			    str += '                </div>';
			    str += '                <div class="slide">';
			    str += '                    <img src="" alt="Still Cut 3">';
			    str += '                </div>';
			    str += '            </div>';
			    str += '            <button class="prev" onclick="moveSlide(-1)">&#10094;</button>';
			    str += '            <button class="next" onclick="moveSlide(1)">&#10095;</button>';
			    str += '        </div>';
			    str += '    </div>';
			    str += '    <div class="rating">';
			    str += '        <h2>평점</h2>';
			    str += '        <div class="rating-score">';
			    str += '            <span>8.8 / 10</span> <span>★ ★ ★ ★ ★</span>';
			    str += '        </div>';
			    str += '        <div class="rating-breakdown">';
			    str += '            <div>5점: 100</div>';
			    str += '            <div>4점: 50</div>';
			    str += '            <div>3점: 20</div>';
			    str += '            <div>2점: 10</div>';
			    str += '            <div>1점: 5</div>';
			    str += '        </div>';
			    str += '        <button class="watch-button">평점작성</button>';
			    str += '    </div>';
			    str += '</div>';

			    
			    
			    
			    $('#targetElement').html(str); 
			},
			 error: function(error) {
                 console.log("에러 : ", error);
                 console.log("에러상세 : ", error.responseText);
             }
			
			
		})
		
		
	});

	function moveSlide(n) {
		let currentSlide = 0;
	    const slides = document.querySelectorAll('.slide');
	    const totalSlides = slides.length;

	    currentSlide += n;

	    if (currentSlide >= totalSlides) {
	        currentSlide = 0;
	    } else if (currentSlide < 0) {
	        currentSlide = totalSlides - 1;
	    }

	    const slideWidth = slides[0].clientWidth;
	    const translateValue = -currentSlide * slideWidth + 'px'; 
	    document.querySelector('.slides').style.transform = 'translateX(' + translateValue + ')';

	}

	// Ensure the function is attached to the buttons
	document.querySelector('.prev').addEventListener('click', () => moveSlide(-1));
	document.querySelector('.next').addEventListener('click', () => moveSlide(1));

	</script>

</body>
</html>