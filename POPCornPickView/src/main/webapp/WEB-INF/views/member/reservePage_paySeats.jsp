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

.simple_info_title {
	position: absolute;
	text-align: center;
	width: 80px;
	background: rgb(248, 47, 98);
	height: 216.5px;
}

.simple_info_title p {
	position: relative;
	color: white;
	top: 50%;
	transform: translateY(-50%);
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

.simple_info_content_all {
	position: relative;
}

.simple_info_content_all {
	position: absolute;
	top: 50%;
}

.simple_info_content_all {
	position: relative;
	top: 50%;
	transform: translateY(-50%);
}

.simple_info_content_all {
	color: white;
}

.none-active {
	display: none;
}
h4{
	display: flex;
	align-items: center;
	justify-content: center;
}
#pay_main h4 {
	background: black;
	color: white;
	text-align: center;
	height: 55px;
}
#reservation_information {
	position: absolute;
	left: 80px;
	width: 300px;
	height: 866px;
	border-right: 1px solid grey;
}
#pay_type {
	position: absolute;
	left: 380px;
	width: 486px;
	background: #f7f5f5;
	height: 866px;
	overflow: hidden;
}
#payment_result {
	position: absolute;
	left: 866px;
	width: 413px;
	height: 866px;
	overflow-y: scroll;
}
#payment_result div:nth-child(3), #payment_result div:nth-child(4), #payment_result div:nth-child(5){
	height: 53px;
	background: black;
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 10px;
}
#payment_result div:nth-child(3) p, #payment_result div:nth-child(3) span, #payment_result div:nth-child(4) p, #payment_result div:nth-child(4) span, #payment_result div:nth-child(5) p, #payment_result div:nth-child(5) span {
	color: white;
}
#payment_result div:nth-child(3) h6, #payment_result div:nth-child(4) h6, #payment_result div:nth-child(5) h6{
	color: white;
	font-size: 1rem;
	font-weight: bold;
}
#payment_result div:nth-child(6){
	background: red;
	height: 53px;
	width: 100%;
	text-align: center;
}
#payment_result div:nth-child(6) p{
	color: white;
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	font-weight: bold;
}
#movie_detail {
	position: relative;
	height: 350px;
	padding: 30.5px;
	border-bottom: 1px solid grey;
}
#movie_detail .movie_detail_img {
	width: 170px;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
}
#movie_detail_grade_title {
	font-weight: bold;
	font-size: 1.2rem;
	display: flex;
	align-items: center;
	margin-top: 15px;
}
#movie_detail_grade_title img{
	margin-right: 5px;
}
#movie_detail_date_time {
	font-size: 0.8rem;
	margin-top: 10px;
	font-weight: bold;
}
#movie_detail_date_time span:nth-child(2){
	position: relative;
	left: 20px;
}
#cinema_detail{
	font-size: 0.8rem;
	margin-top: 10px;
	font-weight: bold;
	position: relative;
}
#cinema_detail span:nth-child(2){
	display: inline-block;
	width: 200px;
	position: absolute;
	left: 44px;
	top:0;
	word-break: keep-all;
}
#cinema_detail span:first-child{
	display: inline-block;
	position: absolute;
	top:0;
	left: 0;
}
#seat_detail{
	margin-top: 30px;
}
#countType, #selectedSeats{
	font-size: 0.8rem;
	margin-top: 10px;
	font-weight: bold;
	position: relative;
	padding: 0 30px;
	margin-top: 10px;
}
#countType span:first-child{
	margin-right: 19px;
}
#selectedSeats span:first-child{
	margin-right: 19px;
}
#pay_type_discount{
	height: 411px;
	overflow-y: scroll;
}
#pay_type_tool{
	height: 400px;
	overflow-y: scroll;
}
#pay_type_discount{
	border-bottom: 1px solid grey;
}
#pay_type_discount h5, #pay_type_tool h5{
	padding: 15px;
	font-size: 1.2rem;
}
#pay_type_discount_types{
	display: flex;
	text-align: center;
	justify-content: center;
	border: 1px solid black;
	border-radius: 5px;
	width: 400px;
	margin: 0 auto;
	align-items: center;
}
#pay_type_discount_types p{
	cursor: pointer;
	width: 200px;
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
}
#pay_type_discount_types p:nth-child(2):hover{
	background: white;
	border-radius: 5px;
}
#pay_type_discount_types p:first-child:hover{
	background: white;
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px; 
}
#pay_type_discount_types p:first-child{
	border-right: 1px solid grey;
}
#pay_type_tool_creditcard{
	width: 100px;
	height: 30px;
	padding: 20px;
	text-align: center;
	border: 1px solid #DDD;
	margin-left: 30px;
	background: white;
	border-radius: 5px;
	cursor: pointer;
}
#pay_type_tool_creditcard:hover {
	background: #f7f5f5;
}
#creditcard_types{
	margin-top: 20px;
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	margin-left: 30px;
}
#creditcard_types div{
	border: 1px solid black;
	background: white;
	text-align: center;
	font-size: 0.8rem;
	width: 70px;
	height: 30px;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
	overflow: hidden;
	font-size: 0.7rem;
}
#creditcard_types div p {
	width: 100%;
}
#payment_receipt{
	height: 600px;
	background: white;
}
.unactivated{
	visibility: hidden;
}
.activated{
	visibility: visible;
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
							<ul class="simple_info_content_all">
								<li id="type_count"></li>
								<li id="seat_selected"></li>
							</ul>
						</div>
					</div>
					<div class="simple_info">
						<div class="simple_info_title">
							<p>03</p>
							<p>결제</p>
						</div>
						<div class="simple_info_content none-active">
							<ul class="simple_info_content_all">
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
							<ul class="simple_info_content_all">
								<li></li>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
					</div>
				</div>

				<!-- 메인 부분 -->
				<section id="pay_main">
					<div id="reservation_information">
						
					</div>
					<div id="pay_type">
						<h4>결제수단</h4>
						<div id="pay_type_discount">
							<h5>할인/포인트</h5>
							<div id="pay_type_discount_types">
								<p id="my_gift_card">기프트 카드</p>
								<p id="my_discount_coupon">할인 쿠폰</p>
							</div>
							<div>
							</div>
						</div>
						<div id="pay_type_tool">
						 	<h5>최종 결제수단</h5>
							<div id="pay_type_tool_creditcard">
								<img alt="신용카드 사진" src="/img/method_ic_card.png">
								<p>신용카드</p>
							</div>
							<div id="creditcard_types" class="unactivated">
								<div id="lottecard">
									<img alt="롯데 카드 사진" src="/img/card_logo_lotte.png">
									<p>롯데카드</p>
								</div>
								<div id="kbcard">
									<img alt="국민 카드 사진" src="/img/card_logo_kb.png">
									<p>국민카드</p>
								</div>
								<div id="kakaocard">
									<img alt="카카오뱅크 사진" src="/img/card_logo_kakao.png">
									<p>카카오뱅크</p>
								</div>
								<div id="shinhancard">
									<img alt="신한 카드 사진" src="/img/card_logo_shinhan.png">
									<p>신한카드</p>
								</div>
								<div id="samsungcard">
									<img alt="삼성 카드 사진" src="/img/card_logo_samsung_20230112.png">
									<p>삼성카드</p>
								</div>
								<div id="hyndaicard">
									<img alt="현대 카드 사진" src="/img/card_logo_hyundai.png">
									<p>현대카드</p>
								</div>
								<div id="hana_wehwancard">
									<img alt="하나 카드 사진" src="/img/card_logo_hana.png">
									<p>하나카드</p>
								</div>
								<div id="lottecard">
									<img alt="하나/외환 카드 사진" src="/img/card_logo_hana.png">
									<p>하나/외환카드</p>
								</div>
								<div id="wooricard">
									<img alt="우리 카드 사진" src="/img/card_logo_woori.png">
									<p>우리카드</p>
								</div>
								<div id="bccard">
									<img alt="비씨 카드 사진" src="/img/card_logo_bc.png">
									<p>BC카드</p>
								</div>
								<div id="citicard">
									<img alt="씨티 카드 사진" src="/img/card_logo_citi.png">
									<p>씨티카드</p>
								</div>
								<div id="nhcard">
									<img alt="농협 카드 사진" src="/img/card_logo_nh.png">
									<p>농협카드</p>
								</div>
								<div id="jbcard">
									<img alt="전북 카드 사진" src="/img/card_logo_jb.png">
									<p>전북</p>
								</div>
								<div id="gwangjucard">
									<img alt="광주 카드 사진" src="/img/card_logo_jb.png">
									<p>광주카드</p>
								</div>
							</div>
						</div>
					</div>
					<div id="payment_result">
						<h4>결제하기</h4>
						<div id="payment_receipt"></div>
						<div id="payment_result_before_cost">
							<h6>상품금액</h6>
							<p><span id="before_cost_total">200,000,000 </span>원</p>
						</div>
						<div id="payment_result_discount">
							<h6>할인금액</h6>
							
							<p>- <span>200,000,000 </span>원</p>
						</div>
						<div id="payment_result_pay_cost">
							<h6>결제금액</h6>
							<p><span>0 </span>원</p>
						</div>
						<div id="payment_confirm">
							<p>결제하기</p>
						</div>
					</div>
				</section>
			</div>
		</div>
	</main>
	<footer> </footer>
	<script type="text/javascript">
		$(document).ready(function(){
			
			const scheduleNo = "${scheduleNo}";
			const movieTitle = "${movieTitle}";
			const cinemaName = "${cinemaName}";
			const date = "${date}";
			const time = "${time}";
			const typeCount = "${typeCount}";
			const seatSelected = "${seatSelected}";
			
			const seatSelectedArray = seatSelected.split(", ");
			const typeCountArray = typeCount.split(", ");
			
			console.log(seatSelectedArray);
			console.log(typeCountArray);
			
			let totalMoney = 0;
			
			for(let i = 0; i < typeCountArray.length ; i++){
				let ageType = typeCountArray[i];
				if(ageType.includes("성인")){
					totalMoney += parseInt(ageType.substring(2, ageType.length)) * 14000;		
				}else if(ageType.includes("청소년")){
					totalMoney += parseInt(ageType.substring(3, ageType.length)) * 11000;	
				}else if(ageType.includes("노약자")){
					totalMoney += parseInt(ageType.substring(3, ageType.length)) * 7000;	
				}else if(ageType.includes("장애인")){
					totalMoney += parseInt(ageType.substring(3, ageType.length)) * 5000;	
				}
			}
			
			const formattedTotalMoney = totalMoney.toLocaleString(); // 숫자를 3자리 단위로 , 를 붙여주는 함수
			
			$("#before_cost_total").text(formattedTotalMoney);
			
			// 화면이 시작될때 상세 정보 가지고 오는 ajax
			$.ajax({
				url : "http://localhost:9001/api/v1/reservation/seat/detail/" + scheduleNo,
				method : "GET",
				dataType : "json",
				success : function(response){
					console.log(response);
					
					const posterUrlPath = fetchPoster(movieTitle);
					
					let str = '<h4>예매 정보</h4> ' +
					 		 '<div id="movie_detail"> ' + 
					 		 '<img src="' + posterUrlPath + '" alt="' + movieTitle + '사진" class="movie_detail_img"> ' +
					 		 '<p id="movie_detail_grade_title"> ';
					if(response.movieShowDetail.movie.viewAge === "전체 관람가"){
					    str += '<img alt="전체 관람가" src="/img/grade_all.png">';
					}else if(response.movieShowDetail.movie.viewAge === "12세 이상 관람가"){
					    str += '<img alt="12세 이상 관람가" src="/img/grade_12.png"> ';
					}else if(response.movieShowDetail.movie.viewAge === "15세 이상 관람가"){
					    str += '<img alt="15세 관람가" src="/img/grade_15.png">';
					}else if(response.movieShowDetail.movie.viewAge === "청소년 관람불가") {
						str += '<img alt="15세 관람가" src="/img/pc_grade_19.png">';
					}
					
					str += '<span>' + movieTitle;
					if(response.movieShowDetail.dubbing === true){
					  	str += '(더빙2D)</span> ';								    	
					}else if(response.movieShowDetail.subtitle === true){
				 	 	str += '(자막2D)</span> ';
					}else {
					}
					
					str += '</p> ' +					
				      '<p id="movie_detail_date_time"><span>일시</span><span>' + date + ' ' + time + '</span></p> ' +
					  '<p id="cinema_detail"><span>영화관</span><span>' + cinemaName +  ' ' + response.room.roomType.roomName + ' ' + response.room.roomType.smallType + '</span></p> ' +	
					  '</div> ' +
					  '<div id="seat_detail"> ' +
					  '<p id="countType"><span>인원</span><span>' + typeCount + '</span></p> ' +
					  '<p id="selectedSeats"><span>좌석</span><span>' + seatSelected + '</span></p> ' +
					  '</div> ';
			
			
					$(".simple_info_content_movie").text(movieTitle);
					$(".simple_info_content_specific").text(cinemaName);
					$(".simple_info_content_date").text(date);
					$("#reservation_information").html(str);
					
					
				},
				error : function(xhr, status, error) { 
					console.log(error);
				}
			});
			
			
			$("#pay_type_tool_creditcard").on("click", function(){
				if($("#creditcard_types").attr("class") === "unactivated"){
					$("#creditcard_types").removeClass("unactivated");
					$("#creditcard_types").addClass("activated");
				}else {
					$("#creditcard_types").removeClass("activated");
					$("#creditcard_types").addClass("unactivated");
				}
			});
			
			$("#my_gift_card").on("click", function(){
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/my/gift/card/",
					method : "GET",
					dataType : "json",
					success : function(response){
						
					},
					error: function(xhr, status, error){
						console.log(error);
					}
				});
			});

			$("#my_discount_coupon").on("click", function(){
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/my/discount/coupon/",
					method: "GET",
					dataType : "json",
					success : function(response){
						
					},
					error : function(xhr, status, error){
						console.log(error);
					}
				});
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