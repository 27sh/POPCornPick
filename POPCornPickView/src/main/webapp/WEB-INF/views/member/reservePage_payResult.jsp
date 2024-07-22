<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
 <link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#container {
	background-color: #444;
	background: #444;
}

#wrapper {
	margin: 0 auto;
	width: 1279.5px;
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

.simple_info:first-child .simple_info_title, .simple_info:nth-child(2) .simple_info_title, .simple_info:nth-child(3) .simple_info_title, .simple_info:last-child .simple_info_title {
	position: absolute;
	text-align: center;
	width: 80px;
	background: rgb(248, 47, 98);
	height: 216.5px;
}

.simple_info:first-child .simple_info_title p, .simple_info:nth-child(2) .simple_info_title p, .simple_info:nth-child(3) .simple_info_title p, .simple_info:last-child .simple_info_title p {
	position: relative;
	color: white;
	top: 50%;
	transform: translateY(-50%);
	font-size: 14px;
    font-weight: bold;
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
ul.simple_info_content_all{
	display: flex;
	flex-direction: column;
	justify-content: center;
	height: 100%;
}
ul.simple_info_content_all li{
	font-size: 12px;
    color: white;
    margin: 10px 0;
}

.none-active {
	display: none;
}

main {
	width: 100%;
	padding: 50px 0;
	background: #444;
}
section{
	width: 1199.5px;
	background: #ddd;
	height: 100%;
	position: absolute;
	left: 80px;
	position: relative;
}
#pay_result_header{
	text-align: center;
}
#pay_result_container{
	width: 100%;
	background: #ddd;
	margin: auto 0;
	position: absolute;
	top: 50%;
	transform: translateY(-50%);	
}
#pay_result_header h4:first-child{
	margin-bottom: 20px;
}
#buttons_container{
	display: flex;
	justify-content: center;
	gap: 20px;
}
#buttons_container button:first-child{
	background: rgb(248, 47, 98);
	width: 100px;
	height: 40px;
	border: none;
	color: white;
	cursor: pointer;
	border-radius: 5px;
}
#buttons_container button:nth-child(2){
	background: grey;
	width: 100px;
	height: 40px;
	border: none;
	color: white;
	cursor: pointer;
	border-radius: 5px;
}
#pay_result_allinfo_movie_cinema_container{
	display: flex;
	justify-content: start;
}
#pay_result_allinfo_movie_cinema{
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	margin-left: 30px;
}
#pay_result_allinfo_movie_cinema div{
	font-weight: bold;
}
#pay_result_allinfo_img{
	margin-left: 10px;
	width: 200px;
}
#movie_title {
	display: flex;
	gap: 5px;
}
#movie_title p{
	font-weight: bold;
}
#pay_result_allinfo{
	display: flex;
	justify-content: space-between;
	width: 80%;
	margin: 30px auto;
	background: #f5f5f5;
	padding: 20px;
}
#pay_result_allinfo_receipt_result div span{
	font-weight: bold;
	margin-left: 30px;
}
#pay_result_allinfo_receipt_result{
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
	margin-right: 30px;
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
						<div class="simple_info_content none-active">
							<ul class="simple_info_content_all">
								<li class="simple_info_content_movie" style="color: white"></li>
								<li class="simple_info_content_specific" style="color: white"></li>
								<li class="simple_info_content_date" style="color: white"></li>
								<li class="simple_info_content_time" style="color: white"></li>
							</ul>
						</div>
					</div>
					<div class="simple_info">
						<div class="simple_info_title" id="simple_info_title_seats">
							<p>02</p>
							<p>인원/좌석</p>
						</div>
						<div class="simple_info_content none-active">
							<ul class="simple_info_content_all">
								<li id="type_count" style="color: white"></li>
								<li id="seat_selected" style="color: white"></li>
							</ul>
						</div>
					</div>
					<div class="simple_info">
						<div class="simple_info_title" id="simple_info_title_pay">
							<p>03</p>
							<p>결제</p>
						</div>
						<div class="simple_info_content none-active">
							<ul class="simple_info_content_all">
								<li style="color: white" id="ticket_price"></li>
								<li style="color: white" id="ticket_discount"></li>
								<li style="color: white" id="ticket_result"></li>
								<li style="color: white"></li>
							</ul>
						</div>
					</div>
					<div class="simple_info">
						<div class="simple_info_title">
							<p>04</p>
							<p>결제완료</p>
						</div>
						<div class="simple_info_content none-active">
							<ul class="simple_info_content_all">
							</ul>
						</div>
					</div>
				</div>

				<!-- 메인 부분 -->
				<section>
					<div id="pay_result_container">
						<div id="pay_result_header">
							<h4>영화 예매가 완료되었습니다.</h4>
							<h4>에매번호 : 20240700001</h4>
						</div>
						
						<div id="pay_result_allinfo_container">
<!-- 							<div id="pay_result_allinfo"> -->
<!-- 								<div id="pay_result_allinfo_movie_cinema_container"> -->
<!-- 									<img alt="" src="https://i.namu.wiki/i/FKDq5ZRzIdkOwEX9wjH9XNSKJajvuytw9CDxDdFWMpJM78cJVjCxTfqgvz4MNWPC_UYe7epT2daozm1UuaSQlOf_2IjwszTTm-535oalBPi5FR-4TKyJxegZTZ2li-nkjKglMR44XZ4dFtIq43sDJQ.webp" id="pay_result_allinfo_img">  -->
<!-- 									<div id="pay_result_allinfo_movie_cinema"> -->
<!-- 										<div id="movie_title"> -->
<!-- 											<img alt="" src="/img/grade_all.png"> -->
<!-- 											<p>데드풀 울버린</p> -->
<!-- 										</div> -->
<!-- 										<div id="date_time">2024-07-23 ( 화 ) 22:58 ~ 15:00</div> -->
<!-- 										<div id="cinema_name">고양백석 1관</div> -->
<!-- 										<div id="typecount">성인1, 청소년1, 경로1, 장애인1</div> -->
<!-- 										<div id="seatSelected">A4, B4, A5, B5</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div id="pay_result_allinfo_receipt_result"> -->
<!-- 										<div id="receipt_before_discount">총 예매 금액 <span>37,000 원</span></div> -->
<!-- 										<div id="receipt_total_discount">총 할인 금액 <span>- 0 원</span></div> -->
<!-- 										<div id="receipt_pay_result">총 결제 금액 <span>37,000 원</span></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
						
						<div id="buttons_container">
							<button>결제내역</button>
							<button id="toMain">메인화면으로</button>
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	<footer> </footer>
	<script type="text/javascript">
	
		$(document).ready(function(){
			
			const selectedCardName = "${selectedCardName}";
			const scheduleNo = "${scheduleNo}";
			const movieTitle = "${movieTitle}";
			const cinemaName = "${cinemaName}";
			const date = "${date}";
			const time = "${time}";
			const typeCount = "${typeCount}";
			const seatSelected = "${seatSelected}";
			const beforeDiscount = "${beforeDiscount}";
			const discountTotal = "${discountTotal}";
			const payResult = "${payResult}";
			
			
			$(".simple_info_content_movie").text(movieTitle);
			$(".simple_info_content_specific").text(cinemaName);
			$(".simple_info_content_date").text(date);
			$(".simple_info_content_time").text(time);
			$("#type_count").text(typeCount);
			$("#seat_selected").text(seatSelected);
			$("#ticket_price").text("티켓금액 " + beforeDiscount + "원");
			$("#ticket_discount").text("할인금액 " + discountTotal + "원");
			$("#ticket_result").text("총합계 " + payResult + "원");
			
			// 화면이 시작될때 상세 정보 가지고 오는 ajax
			$.ajax({
				url : "http://localhost:9001/api/v1/reservation/seat/detail/" + scheduleNo,
				method : "GET",
				dataType : "json",
				success : function(response){
					console.log(response);
					
					const posterUrlPath = fetchPoster(movieTitle);
					
					let str = '<div id="pay_result_allinfo"> ' + 
							  '<div id="pay_result_allinfo_movie_cinema_container"> ' + 
							  '<img alt="' + movieTitle + ' 사진" src="' + posterUrlPath + '" id="pay_result_allinfo_img"> ' +  
							  '<div id="pay_result_allinfo_movie_cinema"> ' + 
							  '<div id="movie_title"> ';
							  if(response.movieShowDetail.movie.viewAge === "전체 관람가"){
								    str += '<img alt="전체 관람가" src="/img/grade_all.png">';
								}else if(response.movieShowDetail.movie.viewAge === "12세 이상 관람가"){
								    str += '<img alt="12세 이상 관람가" src="/img/grade_12.png"> ';
								}else if(response.movieShowDetail.movie.viewAge === "15세 이상 관람가"){
								    str += '<img alt="15세 관람가" src="/img/grade_15.png">';
								}else if(response.movieShowDetail.movie.viewAge === "청소년 관람불가") {
									str += '<img alt="15세 관람가" src="/img/pc_grade_19.png">';
								}
					str += '<p>' + movieTitle + '</p> ' + 
			  				   '</div> ' + 
			 				   '<div id="date_time">' + date + ' ' + time + '</div> ' + 
							   '<div id="cinema_name">' + cinemaName + '</div> ' + 
							   '<div id="typecount">' + typeCount + '</div> ' + 
							   '<div id="seatSelected">' + seatSelected + '</div> ' + 
							   '</div> ' + 
						       '</div> ' + 
							   '<div id="pay_result_allinfo_receipt_result"> ' + 
							   '<div id="receipt_before_discount">총 예매 금액 <span>' + beforeDiscount +  ' 원</span></div> ' + 
							   '<div id="receipt_total_discount">총 할인 금액 <span>- ' + discountTotal + ' 원</span></div> ' + 
							   '<div id="receipt_pay_result">총 결제 금액 <span>' + payResult + ' 원</span></div> ' + 
							   '</div> ' + 
							   '</div>';
					
							   $("#pay_result_allinfo_container").html(str);
					
				},
				error : function(xhr, status, error) { 
					console.log(error);
				}
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
		
		$("#toMain").on("click", function(){
			location.href="http://localhost:8080/";
		});
		
		
		$("#simple_info_title_reservation").on(
				"mouseenter",
				function() {
					$(this).next(".simple_info_content")
							.removeClass("none-active");
				});

		$("#simple_info_title_reservation").on(
				"mouseleave",
				function() {
					$(this).next(".simple_info_content").addClass(
							"none-active");
				});
		$("#simple_info_title_seats").on(
				"mouseenter",
				function() {
					$(this).next(".simple_info_content")
							.removeClass("none-active");
				});

		$("#simple_info_title_seats").on(
				"mouseleave",
				function() {
					$(this).next(".simple_info_content").addClass(
							"none-active");
				});
		$("#simple_info_title_pay").on(
				"mouseenter",
				function() {
					$(this).next(".simple_info_content")
							.removeClass("none-active");
				});

		$("#simple_info_title_pay").on(
				"mouseleave",
				function() {
					$(this).next(".simple_info_content").addClass(
							"none-active");
				});
		
		
	</script>
</body>
</html>