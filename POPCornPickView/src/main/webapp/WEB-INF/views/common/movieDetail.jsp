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
	display: none; /* 모달이 기본적으로 보이지 않음 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	transition: opacity 0.3s ease;
}

.modal-content {
	background-color: #000;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal.show {
	display: block; /* 모달이 화면에 표시됨 */
	opacity: 1;
}
.video-thumbnail img {
  width: 85%; /* 기존 스타일 유지 */
  transition: transform 0.3s ease; /* 이미지에 부드러운 확대 효과 추가 (선택 사항) */
}

.video-thumbnail:hover img {
  cursor: pointer; /* 클릭 커서로 변경 */
  transform: scale(1.05); /* 이미지 확대 (선택 사항) */
}

.poster{
    background-repeat: no-repeat;
    background-size: contain;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div id="targetElement"></div>

		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<iframe id="modal-video" width="100%" height="1000px" src="" frameborder="0" allow="accelerometer; autoplay; clipboard-black; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		</div>
	</main>
	<footer> </footer>

	<script>
	  //모달관련 변수
	   var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];
        var modalVideo = document.getElementById("modal-video");
	
	$(document).ready(function(){
		
		const movieDetailDC = "${movieDC}"
		console.log(movieDetailDC);
		
		
		$.ajax({
			url : "http://localhost:9001/api/v1/film/movieDetail/" + movieDetailDC,
			method : "GET",
			success: function(data){
				const posterUrl = fetchPoster(data.utube[0].movie.movieNm);	
				var basePath = 'C:\\Users\\GG\\Desktop\\popcornpick\\POPCornPickView\\src\\main\\resources\\static\\stillcut\\';
				console.log(data);
				console.log(data.utube[0].movie.movieNm);
				console.log(data.stillcut); 
			    let str = '';
			    str += '<div class="container">';
			    str += '    <div class="header">';
			    str += '<div class="poster" style="background-image: url(' + posterUrl + '); width: 250px; height: 350px;"></div>';
			    str += '        <div class="movie-info">';
			    str += '            <h1>' + data.utube[0].movie.movieNm + '</h1>';
			    str += '            <span>감독: ' + data.utube[0].movie.directors + '/배우: ' + data.utube[0].movie.actors + '</span><br>';
			    str += '            <span>장르: ' + data.utube[0].movie.genres + '/기본정보: ' + data.utube[0].movie.nations +',' + data.utube[0].movie.showTm + '</span><br>';
			    str += '            <span>개봉: ' + data.utube[0].movie.openDt + '</span><br><br>';
			    str += '            <button class="watch-button">예매하기</button>';
			    str += '            <div class="formats">';
			    str += '                <span class="format">IMAX</span>';
			    str += '                <span class="format">4DX</span>';
			    str += '            </div>';
			    str += '        </div>';
			    str += '    </div>';
			    str += '    <div class="description">';
			    str += '        <h2>영화 설명</h2>';
			    str += '        <p style="white-space: pre-line;">' + data.utube[0].movie.description + '</p>';
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
			    str += '            </div>';
			    str += '        </div>';
			    str += '    </div>';
			    str += '    <div class="reviews">';
			    str += '        <h2>트레일러</h2>';
			    str += '        <div class="review-list">';
			       			for(let i = 0; i < data.utube.length; i++){
	      		str += '       <div id="utuve'+ i +'" class="video-thumbnail" data-vid="' + data.utube[i].vid + '">';
	        	str += '          <img src="https://img.youtube.com/vi/' + data.utube[i].vid + '/0.jpg" alt="트레일러 썸네일" style="width: 85%;">';
	        	str += '       </div>';
			   				 }
			    str += '        </div>';
			    str += '    </div>';
			    str += '    <div class="still-cuts">';
			    str += '        <h2>스틸컷</h2>';
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			    str += '        <div class="slider">';
			    str += '            <div class="slides">';
			    					for(let i=0; i < data.stillcut.length; i++){
			    str += '                <div class="slide">';
			    str += '                    <img src="/stillcut/' + data.stillcut[i].stillimg +'" alt="나와랏!!!">';
			    str += '                </div>';
			    					}
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
			    
			    //예고편 modal로 출력하는부분
			    $(document).on('click', '.video-thumbnail', function(){
					 var videoId = $(this).data('vid');
  			         modalVideo.src = "https://www.youtube.com/embed/" + videoId + "?autoplay=1&modestbranding=0&rel=0&loop=1&playlist=" + videoId + "";
			         modal.style.display = "block";
			    });
			    
			    span.onclick = function() {
			        modal.style.display = "none";
			        modalVideo.src = '';
			    }
			    window.onclick = function(event) {
			        if (event.target == modal) {
			            modal.style.display = "none";
			            modalVideo.src = '';
			        }
			    }
			    
			    
			},
			 error: function(error) {
                 console.log("에러 : ", error);
                 console.log("에러상세 : ", error.responseText);
             }
			
			
		})
		
		
		// TMDb API를 사용하여 영화 포스터를 가져오는 함수
        function fetchPoster(movieNm) {
            const apiKey = '4b5db8493a5df33fa9def848bcdda8b1';
            const baseUrl = "https://api.themoviedb.org/3";
            const searchUrl = baseUrl + '/search/movie?api_key=' + apiKey +'&query=' + encodeURIComponent(movieNm);

            // XMLHttpRequest 객체 생성
            const xhr = new XMLHttpRequest();
            xhr.open('GET', searchUrl, false); // false는 동기적 요청을 나타냄
            xhr.send();

            // 요청이 완료되었을 때 처리
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const data = JSON.parse(xhr.responseText);
                    if (data.results && data.results.length > 0) {
                        const posterPath = data.results[0].poster_path;
                        return 'https://image.tmdb.org/t/p/w500'+ posterPath;
                    } else {
                        return 'https://via.placeholder.com/200x300'; // 포스터를 찾을 수 없을 때 기본 포스터 이미지
                    }
                } else {
                    console.error('Error fetching poster:', xhr.status, xhr.statusText);
                    return 'https://via.placeholder.com/200x300'; // 에러 발생 시 기본 포스터 이미지
                }
            }
            return 'https://via.placeholder.com/200x300'; // 기본 포스터 이미지 (여기까지 올 수 있는 경우)
        }

		
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

	
	document.querySelector('.prev').addEventListener('click', () => moveSlide(-1));
	document.querySelector('.next').addEventListener('click', () => moveSlide(1));

	</script>

</body>
</html>