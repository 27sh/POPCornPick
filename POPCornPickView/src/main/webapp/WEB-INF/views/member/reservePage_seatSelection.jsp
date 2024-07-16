<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
	background-color: #444;
	background: #444;
}

#wrapper {
	margin: 0 auto;
	width: 1280px;
	height: 866px;
	background: white;
	position: relative;
}

#simple_infos {
	position: absolute;
	left: 0;
	height: 100%;
}

.simple_info {
	position: relative;
	height: 216.5px;
	width: 80px;
}

.simple_info_title {
	position: absolute;
	text-align: center;
	width: 80px;
	background: rgb(248, 47, 98);
	height: 216.5px;
}

.simple_info_title p {
	color: white;
}

.simple_info_content {
	top: 0;
	position: absolute;
	left: 80px;
	width: 230px;
	background: rgb(248, 47, 98);
	color: white;
	height: 216.5px;
	z-index: 9999;
}

.simple_info_content ul li {
	color: white;
}

.none-active {
	display: none;
}

#seat_reservation_header {
	top: 0;
	left: 0;
	background: black;
	position: absolute;
	width: 100%;
	text-align: center;
	color: white;
	position: relative;
	height: 60px;
}

#seat_reservation_header h4 {
	color: white;
	padding: 20px;
}

#seat_reservation_header p {
	position: absolute;
	right: 0;
	bottom: 0;
	color: white;
	padding-bottom: 5px;
	padding-right: 5px;
}

#seat_reservation_main {
	position: absolute;
	position: relative;
	top: 0;
	left: 80px;
	background: white;
	width: 1200px;
	z-index: 1;
}

#seat_reservation_selection {
	height: 140px;
	position: relative;
}

#movie_information {
	position: absolute;
	position: relative;
	left: 35px;
	top: 20px;
}

#movie_information img {
	position: absolute;
	left: 0;
	height: 100px;
}

#movie_viewage {
	position: absolute;
	position: relative;
	left: 80px;
	top: 10px;
}

#movie_viewage img {
	height: 22px;
	width: 22px;
}

#movie_viewage p {
	position: absolute;
	left: 30px;
}

#movie_datetime {
	position: absolute;
	position: relative;
	top: 40px;
	left: 80px;
}

#movie_room {
	position: absolute;
	top: 65px;
	left: 80px;
}

#seat_amount_selections {
	position: absolute;
	position: relative;
	left: 400px;
	top: 20px;
	height: 100%;
}

#seat_amount_selections div {
	width: fit-content;
	height: fit-content;
	display: flex;
	flex-direction: row;
	align-items: center;
}

.names {
	padding-right: 10px;
}

#seat_amount_selection1 {
	position: absolute;
	left: 0;
	top: 0;
}

#seat_amount_selection2 {
	position: absolute;
	left: 150px;
	top: 0;
}

#seat_amount_selection3 {
	position: absolute;
	left: 300px;
	top: 0;
}

#seat_amount_selection4 {
	position: absolute;
	left: 450px;
	top: 0;
}

.minus, .plus {
	padding: 0 10px;
	border: none;
	background-color: white;
	font-size: 1.5rem;
}

.counts {
	border: 1px solid grey;
	text-align: center;
	padding-right: 5px;
	padding-left: 5px;
	width: fit-content;
	padding-top: 5px;
	padding-bottom: 5px;
}

#seat_map_information {
	background: black;
	position: relative;
	height: 585.5px;
}

#seat_map_information p:first-child {
	position: absolute;
	top: 10px;
	color: white;
	font-size: 0.9rem;
	left: 50%;
	transform: translateX(-50%);
}

#seat_map_information h4 {
	position: absolute;
	top: 60px;
	width: 1100px;
	height: 20px;
	background-color: grey;
	text-align: center;
	left: 50%;
	color: white;
	padding: 5px;
	transform: translateX(-50%);
}

#seat_map {
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	top: 110px;
}

#seat_map span {
	display: block;
	width: 25px;
	height: 24px;
	margin: 5px;
	background-color: #3498db;
	color: white;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	cursor: pointer;
	border-radius: 7px 7px 2px 0px;
}
#seat_map span:first-child{
	cursor: auto;
	background: none;
}
#seat_map div {
	margin: 5px;
	display: flex;
}
#payment_total{
	height: 80px;
	background: grey;
}
main {
	width: 100%;
	padding: 50px 0;
	background: #444;
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
						<div class="simple_info_content none-active">
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
						<div class="simple_info_content none-active">
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
						<div class="simple_info_content none-active">
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
						<div class="simple_info_content none-active">
							<ul>
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- 메인 부분 -->
				<section id="seat_reservation_main">
					<div id="seat_reservation_header">
						<h4>인원/좌석 선택</h4>
						<p>&middot; 인원은 최대 4명까지 선택 가능합니다.</p>
					</div>
					<div id="seat_reservation_selection">
						<div id="movie_information">
							<img alt="탈주 사진"
								src="https://cf.lottecinema.co.kr//Media/MovieFile/MovieImg/202407/21144_103_1.jpg">
							<div id="movie_viewage">
								<img alt="12세 이상 관람가" src="/img/grade_12.png">
								<p>탈주 (2D)</p>
							</div>
							<div id="movie_datetime">
								<span>24.07.15(월)</span> <span>10:10 ~ 11:44</span>
							</div>
							<div id="movie_room">
								<span>4관 리클라이너(레이저 영사기) ·</span>
							</div>
						</div>
						<div id="seat_amount_selections">
							<div class="seat_amount_selection" id="seat_amount_selection1">
								<p class="names">성인</p>
								<div class="counts">
									<button class="minus">-</button>
									<p>0</p>
									<button class="plus">+</button>
								</div>
							</div>
							<div class="seat_amount_selection" id="seat_amount_selection2">
								<p class="names">청소년</p>
								<div class="counts">
									<button class="minus">-</button>
									<p>0</p>
									<button class="plus">+</button>
								</div>
							</div>
							<div class="seat_amount_selection" id="seat_amount_selection3">
								<p class="names">경로</p>
								<div class="counts">
									<button class="minus">-</button>
									<p>0</p>
									<button class="plus">+</button>
								</div>
							</div>
							<div class="seat_amount_selection" id="seat_amount_selection4">
								<p class="names">장애인</p>
								<div class="counts">
									<button class="minus">-</button>
									<p>0</p>
									<button class="plus">+</button>
								</div>
							</div>
						</div>
					</div>
					<div id="seat_map_information">
						<p>- 인원을 선택하세요</p>
						<h4>S C R E E N</h4>
						<div id="seat_map"></div>
					</div>
					<div id="payment_total"></div>
					<div id="seat_type">
						<div>
							
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	<footer> </footer>
	<script type="text/javascript">
		$(document).ready(
				function() {
					
					const newUrl = "http://localhost:8080/reservation/seat";
					
					window.history.replaceState({path: newUrl}, "", newUrl);
					
// 					const scheduleNo = "${scheduleNo}";
// 					const movieTitle = "${movieTitle}";
// 					const cinemaName = "${cinemaName}";
// 					const date = "${date}";
					
// 					const movie = $(".simple_info_content_movie").text(movieTitle);
// 					const specific = $(".simple_info_content_specific").text(cinemaName);
// 					const date = $(".simple_info_content_date").text(date);
					
// 					$.ajax({
// 						url : "http://localhost:9001/api/v1/reservation/seat/detail/" + scheduleNo,
// 						method: "GET",
// 						dataType : "json",
// 						success : function(response){
							
// 							console.log(response);
							
// 							const roomTotalColumn = response.room.roomType.roomTotalColumn;
// 							const roomTotalRow = response.room.roomType.roomTotalRow;
							
// 							const seatArray = new Array(roomTotalColumn);
							
// 							for (var i = 0; i < seatArray.length; i++) {
// 								seatArray[i] = new Array(roomTotalRow);
// 							}

// 							let seatStr = '';

// 							for (let i = 0; i < seatArray.length; i++) {
// 								const ascciCode = String.fromCharCode(65 + i);
// 								seatStr += "<div><span>" + ascciCode + "</span>";
// 								for (let j = 0; j < seatArray[1].length; j++) {
// 									seatStr += '<span>' + (j + 1) + '</span>';
// 								}
// 								seatStr += "</div>";
// 							}
							
// 							// 출구 이미지 bg_window_right.png

// 							$("#seat_map").html(seatStr);
							
							
							
// 						},
// 						error : function(xhr, status, error) {
// 							console.log(error);
// 						}
// 					});
					
					$(".simple_info_title").on(
							"mouseenter",
							function() {
								$(this).next(".simple_info_content")
										.removeClass("none-active");
							});

					$(".simple_info_title").on(
							"mouseleave",
							function() {
								$(this).next(".simple_info_content").addClass(
										"none-active");
							});

					

				});
		
		function fetchPoster(movieNm) {
			const apiKey = '4b5db8493a5df33fa9def848bcdda8b1'; // 여기에 본인의 TMDb API 키를 입력하세요
			const baseUrl = 'https://api.themoviedb.org/3';
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
		                console.log('Poster URL:', posterUrl);
		                console.log('데이터데이터' + data);
		            } else {
		                return 'https://via.placeholder.com/200x300'; // 포스터를 찾을 수 없을 때 기본 포스터 이미지
		            }
		        } else {
		            console.error('Error fetching poster:', xhr.status, xhr.statusText);
		            console.log('데이터데이터' + data);
		            return 'https://via.placeholder.com/200x300'; // 에러 발생 시 기본 포스터 이미지
		        }
		    }
		    return 'https://via.placeholder.com/200x300'; // 기본 포스터 이미지 (여기까지 올 수 있는 경우)
		}
	</script>
</body>
</html>