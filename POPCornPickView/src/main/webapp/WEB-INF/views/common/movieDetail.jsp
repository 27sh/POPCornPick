<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화상세보기</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />0

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

#stats {
	display: flex;
	justify-content: space-evenly;
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

.write_review, .watch-button, .like-button {
	margin: 5px;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.write_review, .watch-button {
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
	height: 100px;
}

.graph {
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

.s {
	display: flex;
	transition: transform 0.5s ease-in-out;
}

.slider {
	position: relative;
	overflow: hidden;
	width: 100%;
	text-align: center;
}

.slides {
	display: flex;
	transition: transform 0.5s ease-in-out;
}

.slide {
	min-width: 100%;
	box-sizing: border-box;
}

.slide img {
	width: 90%;
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

.ratingcon {
	display: table;
}

.rating-breakdown div {
	margin: 5px 0;
}

.formats {
	display: inline-block;
	margin-left: 10px;
}

#reservation {
	color: white;
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

.modal-content1 {
	background-color: black;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 100%;
	max-width: 90%;
	border-radius: 8px;
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	height: 50%;
	border-radius: 8px;
	box-sizing: border-box;
}

.modal-content textarea {
	width: 100%;
	height: 70%;
	box-sizing: border-box;
	resize: none;
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

.poster {
	background-repeat: no-repeat;
	background-size: contain;
}

.scores {
	width: 80px;
}

input[type="radio"] {
	display: none;
}
#avgstar span img{
	width: 30px;
	
}
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<header>
		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div id="targetElement"></div>
		<div class="container"id="통계">
			<div class="stats">
				<h2>관객 통계</h2>
				<div class="stats graphs" id="stats">
					<div class="gender group">
						<h3>성별 관람비율</h3>
						<div class="graph age graph">
							<canvas id="agechar"></canvas>
						</div>
					</div>
					<div class="age group">
						<div class="rating" id="rating">
							<div class="ratingcon">
								<h2>실관람객 평점</h2>
								<div class="rating score">
									<span><span id="avgscore"></span> / 5 점</span>
								</div>
								<div id="avgstar">
																	
								</div>
								<div class="rating breakdown">
									<div><span id="avgamount"></span>명 참여</div>
									<br>
								</div>
							</div>
							<button class="write_review">평점작성</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 기존 예고편 모달 -->
			<div id="myModal" class="modal">
				<div class="modal-content1">
					<span class="close">&times;</span>
					<iframe id="modal-video" width="100%" height="1000px" src=""
						frameborder="0"
						allow="accelerometer; autoplay; clipboard-black; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
			</div>

			<!-- 새로 추가한 평점 작성 모달 -->
			<div id="ratingModal" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>
					<h2>평점 작성</h2>
					<form id="ratingForm">
						<span for="rating">평점:</span> <input type="radio" id="star1"
							name="score_radio" value="1"><label for="star1"><img
							id="starimg1" src="/img/blank_score.png" class="scores"
							onclick="ch_star(event,1)"></label>
						</radio>
						<input type="radio" id="star2" name="score_radio" value="2"><label
							for="star2"><img id="starimg2" src="/img/blank_score.png"
							class="scores" onclick="ch_star(event,2)"></label>
						</radio>
						<input type="radio" id="star3" name="score_radio" value="3"><label
							for="star3"><img id="starimg3" src="/img/blank_score.png"
							class="scores" onclick="ch_star(event,3)"></label>
						</radio>
						<input type="radio" id="star4" name="score_radio" value="4"><label
							for="star4"><img id="starimg4" src="/img/blank_score.png"
							class="scores" onclick="ch_star(event,4)"></label>
						</radio>
						<input type="radio" id="star5" name="score_radio" value="5"><label
							for="star5"><img id="starimg5" src="/img/blank_score.png"
							class="scores" onclick="ch_star(event,5)"></label>
						</radio>
						<br> <span for="review">리뷰:</span>
						<textarea id="review_text" name="review" rows="4" cols="50"></textarea>
						<br>
						<button type="button" onclick="inputScore(event)">평점등록</button>
					</form>
				</div>
			</div>
	</main>
	<footer> </footer>

	<script>
  // 모달관련 변수
  var modal = document.getElementById("myModal");
  var span = document.getElementsByClassName("close")[0];
  var modalVideo = document.getElementById("modal-video");

  // 평점 작성 모달 관련 변수
  //var ratingModal = getElementById("ratingModal");
  var ratingSpan = document.getElementsByClassName("close")[1];

  
  function ch_star(e,num){
		for(let i=1; i<6; i++){ 
			document.getElementById("starimg"+i).src="/img/blank_score.png";
		}
	  	for(let i=1; i<=num; i++){
			  document.getElementById("starimg"+i).src="/img/full_score.png";
		  }
		
//	 	//	$(this).children("img").attr("src", "/img/full_score.png");
//	  	//	$(this).siblings().children("img").attr("src", "/img/blank_score.png");
	 	}
  
  $(document).ready(function () {
	  
	const movieDetailDC = "${movieDC}";
    console.log(movieDetailDC);

    $.ajax({
      url: "http://localhost:9001/api/v1/film/movieDetail/" + movieDetailDC,
      method: "GET",
      success: function (data) {
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
        str += '            <span>장르: ' + data.utube[0].movie.genres + '/기본정보: ' + data.utube[0].movie.nations + ', ' + data.utube[0].movie.showTm + '분</span><br>';
        str += '            <span>개봉: ' + data.utube[0].movie.openDt + '</span><br><br>';
        str += '            <button class="watch-button"><a id="reservation" href="/reservation/main">예매하기</a></button>';
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
        str += '    <div class="reviews">';
        str += '        <h2>트레일러</h2>';
        str += '        <div class="review-list">';
        				for (let i = 0; i < data.utube.length; i++) {
        str += '       <div id="utuve' + i + '" class="video-thumbnail" data-vid="' + data.utube[i].vid + '">';
        str += '          <img src="https://img.youtube.com/vi/' + data.utube[i].vid + '/0.jpg" alt="트레일러 썸네일" style="width: 85%;">';
        str += '       </div>';
        				}
        str += '        </div>';
        str += '    </div>';
        str += '    <div class="still-cuts">';
        str += '        <h2>스틸컷</h2>';
        str += '        <div class="slider">';
        str += '            <div class="slides">';
        				for (let i = 0; i < data.stillcut.length; i++) {
        str += '               <div class="slide">';
        str += '                   <img src="/stillcut/' + data.stillcut[i].stillimg + '" alt="Slide' + i + '">';
        str += '               </div>';
        				}
        str += '            </div>';
        str += '            <button class="prev" onclick="moveSlides(-1)">&#10094;</button>';
        str += '            <button class="next" onclick="moveSlides(1)">&#10095;</button>';
        str += '        </div>';
        str += '    </div>';
        str += '    </div>';
        str += '</div>';

        $('#targetElement').html(str);

        // 예고편 modal로 출력하는 부분
        $(document).on('click', '.video-thumbnail', function () {
          var videoId = $(this).data('vid');
          modalVideo.src = "https://www.youtube.com/embed/" + videoId + "?autoplay=1&modestbranding=0&rel=0&loop=1&playlist=" + videoId + "&controls=0";
          modal.style.display = "block";
        });

        span.onclick = function () {
          modal.style.display = "none";
          modalVideo.src = '';
        };

        // 평점 작성 modal로 출력하는 부분
        $(document).on('click', '.write_review', function () {
          ratingModal.style.display = "block";
        });
		//평점modal에서 modal바깥부분 클릭시 꺼지는 
        ratingSpan.onclick = function () {
          ratingModal.style.display = "none";
        };
        window.onclick = function (event) {
        	if (event.target == modal) {
                modal.style.display = "none";
                modalVideo.src = '';
           }if (event.target == ratingModal) {
            ratingModal.style.display = "none";
          	}
        };

      },
      error: function (error) {
        console.log("에러 : ", error);
        console.log("에러상세 : ", error.responseText);
      }
      
    });

    $.ajax({
    	url: "http://localhost:9001/api/v1/film/score/"+ movieDetailDC,
    	method: "GET",
    	dataType: "json",
    	success:function(score){
    		console.log(score);
    		const avgscore = score.acgscore;
    		const acgcount = score.avgcount;
    		
    		$("#avgscore").text(avgscore.toFixed(1));
    		let str = '';
    		if(avgscore <= 0.5){
	    		str += '<span><img src="/img/blank_score.png"></span>';
	    		str += '<span><img src="/img/blank_score.png"></span>';
	    		str += '<span><img src="/img/blank_score.png"></span>';
	    		str += '<span><img src="/img/blank_score.png"></span>';
	    		str += '<span><img src="/img/blank_score.png"></span>';
    		}else if(avgscore > 0.5 && avgscore <= 1.5){
    			str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
    		}else if(avgscore > 1.5 && avgscore <= 2.5){
    			str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
    		}else if(avgscore > 2.5 && avgscore <= 3.5){
    			str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
    		}else if(avgscore > 3.5 && avgscore <= 4.5){
    			str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/blank_score.png"></span>';
    		}else if(avgscore > 4.5 && avgscore <= 5){
    			str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
        		str += '<span><img src="/img/full_score.png"></span>';
    		}
    		$("#avgstar").html(str);
    		
    		$("#avgamount").text(acgcount);
    	},
    	error(error){
    		console.log("에러 : ", error);
    		console.log("에러상세 : ", error.responseText);
    	}
    	
    	
    })
    
    
    
    
    
    
    
    // TMDb API를 사용하여 영화 포스터를 가져오는 함수
    function fetchPoster(movieNm) {
    const apiKey = '4b5db8493a5df33fa9def848bcdda8b1';
    const baseUrl = "https://api.themoviedb.org/3";
    const searchUrl = baseUrl + '/search/movie?api_key=' + apiKey + '&query=' + encodeURIComponent(movieNm);

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
            return 'https://image.tmdb.org/t/p/w500' + posterPath;
          }else {	
            return 'https://via.placeholder.com/200x300'; // 포스터를 찾을 수 없을 때 기본 포스터 이미지
          }
          }else {
          console.error('Error fetching poster:', xhr.status, xhr.statusText);
          return 'https://via.placeholder.com/200x300'; // 에러 발생 시 기본 포스터 이미지
        }
      }
      return 'https://via.placeholder.com/200x300'; // 기본 포스터 이미지 (여기까지 올 수 있는 경우)
    }
	
	
	console.log(movieDetailDC +"janfakjewnflkajenfalkjenflknejflakwejnflakwejnflakwejnf");
	$.ajax({
		url: "http://localhost:9001/api/v1/film/ticketchart/" + movieDetailDC,
		method: "GET",
		dataType:"json",
		success: function(fmlist){
			
			console.log(fmlist);
			
			let genderarr = new Array();
			let amount = new Array();
			
// 			fmlist.forEach(fm => {
// 				genderarr.push(fm.gender);
// 				amount.push(fm.totalAmount);
// 			});
						
			for(let i=0; i <fmlist.length; i++){
				genderarr.push(fmlist[i].gender);
				amount.push(fmlist[i].totalAmount);		
			}
						
			//차트
			const ctx = document.getElementById('agechar').getContext('2d');
			const salesChart = new Chart(ctx, {
			    type: 'pie', // 차트 유형을 'pie'로 설정
			    data: {
			        labels: genderarr, // 데이터 레이블
			        datasets: [
			            {
			                label: '성별비율',
			                data: amount, // 데이터 배열
			                backgroundColor: ['#b4d6fa', 'blue'], // 각 조각의 배경 색상
			            }
			        ]
			    },
			    options: {
			        maintainAspectRatio: false, // 비율 유지 여부
			        responsive: true // 반응형 차트
			    }
			});
		},
		error(error){
			console.log("에러" + error);
			console.log("상세" + error.responseText);	
			
		}
		
	})





  


  }); //ready 끝
	//스틸컷 슬라이드 
  let slideIndex = 0;

  function moveSlides(n) {
    let slides = document.getElementsByClassName("slide");
    slideIndex += n;

    if (slideIndex >= slides.length) {
      slideIndex = 0;
    }else if (slideIndex < 0) {
      slideIndex = slides.length - 1;
    }

    let translateValue = -slideIndex * 100; // 현재 슬라이드 위치 계산
    document.getElementsByClassName("slides")[0].style.transform = "translateX(" + translateValue + "%)";
  }
  
	function inputScore(event){
		const selectedRating = document.querySelector('input[name="score_radio"]:checked').value;
		const sltRating = parseInt(selectedRating);
		const textreview = $("#review_text").val();
		//console.log(typeof sltRating);
		const jwttoken = localStorage.getItem("jwtToken");
		const movieDC = "${movieDC}";
		
		console.log("무비코드"+movieDC);
		console.log(jwttoken);
		$.ajax({
			url:"http://localhost:9001/api/v1/film/ScoreInput/"+ movieDC,
			method:"POST",
			contentType: "application/json",
			headers: {
				'Authorization' : 'Bearer ' + jwttoken 
			},
			data: JSON.stringify({
				reviewScore : sltRating,
				reviewContent : textreview,
				spoiler : false,
				
				
			}),
			
			success:function(inputScore){
				alert("평점이 등록되었습니다");
				
				console.log("평점등록중");
 				window.location.href="/film/noapi";
			},
			error:function(error){
				alert("예매정보가 없습니다.");
				console.log(error);
				console.log("에러상세" + error.responseText);
				document.getElementById("ratingModal").style.display = "none";
			}
			
			
		})
	}
  
	
	
	
	
</script>

</body>
</html>
