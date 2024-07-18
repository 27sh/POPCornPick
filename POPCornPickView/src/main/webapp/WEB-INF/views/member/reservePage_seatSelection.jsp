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

#simple_info_title_reservation, #simple_info_title_seat {
	position: absolute;
	text-align: center;
	width: 80px;
	background: rgb(248, 47, 98);
	height: 216.5px;
}
.simple_info_title{
	position: absolute;
	text-align: center;
	width: 80px;
	background: #c2bebe;
	height: 216.5px;
}
#simple_info_title_reservation p, #simple_info_title_seat p{
	position: relative;
	color: white;
	top: 50%;
	transform: translateY(-50%);
    font-size: 14px;
    font-weight: bold;
}
.simple_info_title p {
	position: relative;
	color: black;
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
	height: 216.5px;
	z-index: 9999;
}
.simple_info_content_all{
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.simple_info_content_all li{
	font-size: 12px;
    margin: 10px 0;
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
	font-size: 1.1rem;
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
	font-size: 1rem;
	font-weight: bold;
	position: absolute;
	left: 30px;
}

#movie_datetime {
	position: absolute;
	position: relative;
	top: 40px;
	left: 80px;
	font-size: 0.8rem;
}
#movie_datetime span:first-child{
	border-right: 1px solid #edebeb;
	padding-right: 10px;
}
#movie_datetime span:nth-child(2){
	padding-left: 5px;
}
#movie_room {
	position: absolute;
	top: 65px;
	left: 80px;
	font-size: 0.8rem;
}
#movie_room span span{
	color: #edebeb;
	padding: 0 5px;
}
#seat_amount_selections {
	position: absolute;
	position: relative;
	left: 530px;
	top: 35px;
	height: 100%;
}
#seat_amount_selections button{
	cursor: pointer;
}
#seat_amount_selections div {
	width: fit-content;
	height: fit-content;
	display: flex;
	flex-direction: row;
	align-items: center;
}
#seat_amount_selections div:nth-child(3){
	margin-left: 10px;
}
#seat_amount_selections div:nth-child(4){
	margin-left: 10px;
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
	border-radius: 5px;
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
	font-size: 0.8rem;
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
#seat_map_information_intro{
	width: 100%;
	text-align: center;
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
	cursor: pointer;
	line-height: 30px;
	border-radius: 5px;
	border-radius: 7px 7px 2px 0px;
}
#seat_type{
	display: flex;
}
#seat_type div:first-child span {
	display: block;
	width: 20px;
	height: 17px;
	margin: 5px;
	background-color: #3498db;
	color: transparent;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	border-radius: 7px 7px 2px 0px;
}
#seat_type div:nth-child(2) span {
	display: block;
	width: 20px;
	height: 17px;
	margin: 5px;
	background-color: grey;
	color: transparent;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	border-radius: 7px 7px 2px 0px;
}
#seat_type div:nth-child(3) span {
	display: block;
	width: 20px;
	height: 17px;
	margin: 5px;
	background-color: red;
	color: transparent;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	border-radius: 7px 7px 2px 0px;
}
#seat_type div{
	display: flex;
	align-items: center;
	margin: 0 5px;
}
#seat_type div p{
	color: white;
}
#seat_type{
	position: absolute;
	bottom: 30px;
	left: 30px;
}
#seat_map span:first-child{
	cursor: auto;
	background: none;
}
#seat_map div {
	margin: 5px;
	display: flex;
}
#payment_container{
	height: 81px;
	background: grey;
	display: flex;
	align-items: center;
}
#payment_total{
	width: 100%;
}
#payment_total p{
	color: white;
	margin-left: 20px;
}
#payment_total span{
	color: white;
	font-size: 2rem;
	font-weight: bold;
	position: relative;
	top: 3px;
}
#payment_confirm{
	height: 100%;
	background: red;
	width: 200px;
	cursor:pointer;
}
#payment_confirm p{
	color: white;
	cursor: pointer;
	font-size: 1.2rem;
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	text-align: center;
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
						<div class="simple_info_title" id="simple_info_title_reservation">
							<p>01</p>
							<p>상영시간</p>
						</div>
						<div class="simple_info_content none-active">
							<ul class="simple_info_content_all">
								<li class="simple_info_content_movie"> </li>
								<li class="simple_info_content_specific"> </li>
								<li class="simple_info_content_date"> </li>
								<li class="simple_info_content_time"> </li>
							</ul>
						</div>
					</div>
					<div class="simple_info">
						<div class="simple_info_title" id="simple_info_title_seat">
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
				<section id="seat_reservation_main">
					<div id="seat_reservation_header">
						<h4>인원/좌석 선택</h4>
						<p>&middot; 인원은 최대 4명까지 선택 가능합니다.</p>
					</div>
					<div id="seat_reservation_selection">
						
					</div>
					<div id="seat_map_information">
						<p id="seat_map_information_intro">- 인원을 선택하세요</p>
						<h4>S C R E E N</h4>
						<div id="seat_map"></div>
						<div id="seat_type">
							<div>
								<span>a</span>
								<p>예약 가능</p>
							</div>
							<div>
								<span>a</span>
								<p>예매 완료</p>
							</div>
							<div>
								<span>a</span>
								<p>선택</p>
							</div>
						</div>
					</div>
					<div id="payment_container">
						<div  id="payment_total">
							<p>총 합계<span id="total_cost"> 0 </span>원</p>
						</div>
						<div  id="payment_confirm">
							<p>결제하기</p>
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
					
					
					const scheduleNo = "${scheduleNo}";
					const movieTitle = "${movieTitle}";
					const cinemaName = "${cinemaName}";
					const date = "${date}";
					
					$(".simple_info_content_movie").text(movieTitle);
					$(".simple_info_content_specific").text(cinemaName);
					$(".simple_info_content_date").text(date);
					
					$.ajax({
						url : "http://localhost:9001/api/v1/reservation/seat/detail/" + scheduleNo,
						method: "GET",
						dataType : "json",
						success : function(response){
							
							const roomTotalColumn = response.room.roomType.roomTotalColumn;
							const roomTotalRow = response.room.roomType.roomTotalRow;
							
							const seatArray = new Array(roomTotalColumn);
							
							for (var i = 0; i < seatArray.length; i++) {
								seatArray[i] = new Array(roomTotalRow);
							}

							let seatStr = '';
							
							const startWorldTime = response.start;
					        const startKoreanTime = new Date(startWorldTime).toString();
					        const startTime = startKoreanTime.split(" ")[4].split(":")[0] + ":" + startKoreanTime.split(" ")[4].split(":")[1];
					        
					        const endWorldTime = response.end;
					        const endKoreanTime = new Date(endWorldTime).toString();
					        const endTime = endKoreanTime.split(" ")[4].split(":")[0] + ":" + endKoreanTime.split(" ")[4].split(":")[1];
							
					        const resultTime = startTime + " ~ " + endTime;
					        $(".simple_info_content_time").text(resultTime);
							
					        let cnt = 0;
					        
					        console.log(response.reservatedSeatList);
					        
							for (let i = 0; i < seatArray.length; i++) {
								const ascciCode = String.fromCharCode(65 + i);
								seatStr += "<div><span>" + ascciCode + "</span>";
								for (let j = 0; j < seatArray[1].length; j++) {
									if(response.reservatedSeatList.length === 0){
										seatStr += '<span class="seats" onclick="selectSeat(event)" >' + (j + 1) + '</span>';
									}else {
										if(response.reservatedSeatList[cnt].seatRow === (i + 1) && response.reservatedSeatList[cnt].seatColumn === (j + 1) && response.reservatedSeatList[cnt].booked === true){
											seatStr += '<span style="background: grey; cursor: default;">' + (j + 1) + '</span>';
											if(cnt === response.reservatedSeatList.length - 1){
												
											}else {
												cnt++;
											}
										}else {
											seatStr += '<span class="seats" onclick="selectSeat(event)" id="seatRow' + i + '"_seatColumn"' + j + '">' + (j + 1) + '</span>';
										}
									}
									
								}
								seatStr += "</div>";
							}
							
							// 출구 이미지 bg_window_right.png
							
							const imgApiUrl = fetchPoster(response.movieShowDetail.movie.title);
							
							let str = '<div id="movie_information">' +
						        		'<img alt="' + response.movieShowDetail.movie.title  + ' 사진"' +
						           		'src="' + imgApiUrl + '">' +
						     		    '<div id="movie_viewage">';
						     		   
						     		    // 관람가 여부
										if(response.movieShowDetail.movie.viewAge === "전체 관람가"){
										    str += '<img alt="전체" src="/img/grade_all.png">';
										}else if(response.movieShowDetail.movie.viewAge === "12세 이상 관람가"){
										    str += '<img alt="12세 관람가" src="/img/grade_12.png">';
										}else if(response.movieShowDetail.movie.viewAge === "15세 이상 관람가"){
										    str += '<img alt="15세 관람가" src="/img/grade_15.png">';
										}else if(response.movieShowDetail.movie.viewAge === "청소년 관람불가") {
											str += '<img alt="15세 관람가" src="/img/pc_grade_19.png">';
										}
						     		    
						    	 str += '<p>' + response.movieShowDetail.movie.title + ' (2D)</p>' + // 2d 데이터 없음
						     	        '</div>' +
						    	        '<div id="movie_datetime">' +
								        '<span>' + date + '</span> <span>' + resultTime + '</span>' +
								        '</div>' +
								        '<div id="movie_room">' +
								        '<span>' + response.room.cinema.cinemaName + "<span> | </span>" + response.room.roomType.roomName + " " + response.room.roomType.smallType + " "; 
								        
								        // 자막 더빙 여부
							    	 	if(response.movieShowDetail.dubbing === true){
									    	str += '<span>|</span> 더빙';								    	
									    }else if(response.movieShowDetail.subtitle === true){
									    	str += '<span>|</span> 자막';
									    }else {
									    }
								        
								 str += '</span>' +
								        '</div>' +
								        '</div>' +
								        '<div id="seat_amount_selections">' +
								        '<div class="seat_amount_selection" id="seat_amount_selection1">' +
								        '<p class="names">성인</p>' +
								        '<div class="counts">' +
								        '<button class="minus" onclick="minusAmount(event)" id="minus_adult">-</button>' +
								        '<p id="adult_amount">0</p>' +
								        '<button class="plus" onclick="plusAmount(event)" id="plus_adult">+</button>' +
								        '</div>' +
								        '</div>' +
								        '<div class="seat_amount_selection" id="seat_amount_selection2">' +
								        '<p class="names">청소년</p>' +
								        '<div class="counts">' +
								        '<button class="minus" onclick="minusAmount(event)" id="minus_teenager">-</button>' +
								        '<p id="teenager_amount">0</p>' +
								        '<button class="plus" onclick="plusAmount(event)" id="plus_teenager">+</button>' +
								        '</div>' +
								        '</div>' +
								        '<div class="seat_amount_selection" id="seat_amount_selection3">' +
								        '<p class="names">경로</p>' +
								        '<div class="counts">' +
								        '<button class="minus" onclick="minusAmount(event)" id="minus_senile">-</button>' +
								        '<p id="senile_amount">0</p>' +
								        '<button class="plus" onclick="plusAmount(event)" id="plus_senile">+</button>' +
								        '</div>' +
								        '</div>' +
								        '<div class="seat_amount_selection" id="seat_amount_selection4">' +
								        '<p class="names">장애인</p>' +
								        '<div class="counts">' +
								        '<button class="minus" onclick="minusAmount(event)" id="minus_disabled">-</button>' +
								        '<p id="disabled_amount">0</p>' +
								        '<button class="plus" onclick="plusAmount(event)" id="plus_disabled">+</button>' +
								        '</div>' +
								        '</div>' +
										'</div>';
							 
							$("#seat_reservation_selection").html(str);

							$("#seat_map").html(seatStr);
							
							
						},
						error : function(xhr, status, error) {
							console.log(error);
						}
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
					$("#simple_info_title_seat").on(
							"mouseenter",
							function() {
								$(this).next(".simple_info_content")
										.removeClass("none-active");
							});

					$("#simple_info_title_seat").on(
							"mouseleave",
							function() {
								$(this).next(".simple_info_content").addClass(
										"none-active");
							});

// 					$("#seat_map").on("click", "span" function(){
// 						$(this).css("background", "red");
// 					});
					
					// 결제하기 눌렀을때 이벤트 좌석이 선택 안됐을때 예외처리 
					$("#payment_confirm").on("click", function(){

						const movieTitle = $(".simple_info_content_movie").text();
						const cinemaName = $(".simple_info_content_specific").text();
						const date = $(".simple_info_content_date").text();
						const time = $(".simple_info_content_time").text();
						const typeCount = $("#type_count").text();
						const seatSelected = $("#seat_selected").text();
						const scheduleNo = "${scheduleNo}";

						const seatSelectedArray = seatSelected.split(", ");
						const typeCountArray = typeCount.split(", ");
	
						const teenagerAmount = parseInt($("#teenager_amount").text());
						const adultAmount = parseInt($("#adult_amount").text());
						const senileAmount = parseInt($("#senile_amount").text());
						const disabledAmount = parseInt($("#disabled_amount").text());
						
						const totalAmount = teenagerAmount + adultAmount + senileAmount + disabledAmount;
						
						if(seatSelectedArray.length === totalAmount && seatSelectedArray[0] !== "" && typeCountArray[0] !== null){
							if(confirm("이 정보로 결제창으로 넘어가시겠습니까?")){
								location.href="http://localhost:8080/reservation/pay/" + scheduleNo + "/" + movieTitle + "/" + cinemaName + "/" + date + "/" + time + "/" + typeCount + "/" + seatSelected;
							}
						}else {
							alert("좌석을 다시 선택해주십시오.");
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
		
		let finalAmount = 0;
		let selectedAmount = 0;
		let array = new Array();
		
		function minusAmount(event){
			$("#total_cost").text(" " + 0 + " ");
			const id = event.target.id;
			const type = id.substring(6, id.length);
			const totalAmount = 4;
			$("#seat_map_information_intro").text("- 좌석 선택 후 결제하기 버튼을 클릭하세요");			
			let amount = parseInt($("#" + type + "_amount").text());
			$(".seats").css("background", "#3498db");
			selectedAmount = 0;
			
			if(amount === 0){
			}else {
				amount--;
				finalAmount--;
			}
			$("#" + type + "_amount").text(amount);
			
			const teenagerAmount = parseInt($("#teenager_amount").text());
			const adultAmount = parseInt($("#adult_amount").text());
			const senileAmount = parseInt($("#senile_amount").text());
			const disabledAmount = parseInt($("#disabled_amount").text());
			
			let stringArray = new Array();
			let adultStr = '';
			let senileStr = '';
			let teenagerStr = '';
			let disabledStr = '';
			
			
			if(adultAmount > 0){
				adultStr = "성인" + adultAmount;
				stringArray.push(adultStr); 
			}
			if(teenagerAmount > 0){
				teenagerStr = "청소년" + teenagerAmount;
				stringArray.push(teenagerStr); 
			}	
			if(senileAmount > 0){
				senileStr = "경로" + senileAmount;
				stringArray.push(senileStr); 
			}	
			if(disabledAmount > 0){
				disabledStr = "장애인" + disabledAmount;
				stringArray.push(disabledStr); 
			}	
			
			let resultStr = ''; 
			
			if(stringArray.length > 1){
				stringArray.forEach(string => {
					if(stringArray[stringArray.length - 1] === string){
						resultStr += string;
					}else {
						resultStr += string + ", ";
					}
				});
			}else {
				if(stringArray.length === 0){
					resultStr = "";
				}else {
					resultStr = stringArray[0];
				}
			}
			
			$("#type_count").text(resultStr);
			array.length = 0;
			$("#seat_selected").text("");	
			
		}
		
		function plusAmount(event){
			const id = event.target.id;
			const type = id.substring(5, id.length);
			const totalAmount = 4;
			
			let amount = parseInt($("#" + type + "_amount").text());
			
			if(type === "adult") {
				const teenagerAmount = parseInt($("#teenager_amount").text());
				const senileAmount = parseInt($("#senile_amount").text());
				const disabledAmount = parseInt($("#disabled_amount").text());
				
				const resultAmount = teenagerAmount + senileAmount + disabledAmount + amount;
			
				if(resultAmount === 4){
				}else {
					amount++;
					finalAmount++;
				}
			
			}else if(type === "teenager") {
				$("#seat_map_information_intro").text("- 청소년 요금은 만 4세 이상 ~ 만 19세 미만의 청소년에 한해 적용됩니다.");	
				const adultAmount = parseInt($("#adult_amount").text());
				const senileAmount = parseInt($("#senile_amount").text());
				const disabledAmount = parseInt($("#disabled_amount").text());
				
				const resultAmount = adultAmount + senileAmount + disabledAmount + amount;
			
				if(resultAmount === 4){
				}else {
					amount++;
					finalAmount++;
				}
				
			} else if(type === "senile") {
				$("#seat_map_information_intro").text("- 반드시 본인의 신분증(만 65세 이상)을 소지하신 후 입장해주세요. 미지참 시 입장이 제한됩니다.");	
				const teenagerAmount = parseInt($("#teenager_amount").text());
				const adultAmount = parseInt($("#adult_amount").text());
				const disabledAmount = parseInt($("#disabled_amount").text());
				
				const resultAmount = teenagerAmount + adultAmount + disabledAmount + amount;
			
				if(resultAmount === 4){
				}else {
					amount++;
					finalAmount++;
				}
				
			} else if(type === "disabled") {
				$("#seat_map_information_intro").text("- 반드시 복지카드를 소지하신 후 입장해주세요. 미지참 시 입장이 제한됩니다. (장애의 정도가 심한 장애인: 동반 1인 포함 할인 가능/ 장애 정도가 심하지 않은 장애인: 본인에 한하여 할인 적용)");	
				const teenagerAmount = parseInt($("#teenager_amount").text());
				const adultAmount = parseInt($("#adult_amount").text());
				const senileAmount = parseInt($("#senile_amount").text());
				
				const resultAmount = teenagerAmount + adultAmount + senileAmount + amount;
			
				if(resultAmount === 4){
				}else {
					amount++;
					finalAmount++;
				}
				
			}			
			
			$("#" + type + "_amount").text(amount);
		
			const teenagerAmount = parseInt($("#teenager_amount").text());
			const adultAmount = parseInt($("#adult_amount").text());
			const senileAmount = parseInt($("#senile_amount").text());
			const disabledAmount = parseInt($("#disabled_amount").text());
			
			let stringArray = new Array();
			let adultStr = '';
			let senileStr = '';
			let teenagerStr = '';
			let disabledStr = '';
			
			
			if(adultAmount > 0){
				adultStr = "성인" + adultAmount;
				stringArray.push(adultStr); 
			}
			if(teenagerAmount > 0){
				teenagerStr = "청소년" + teenagerAmount;
				stringArray.push(teenagerStr); 
			}	
			if(senileAmount > 0){
				senileStr = "경로" + senileAmount;
				stringArray.push(senileStr); 
			}	
			if(disabledAmount > 0){
				disabledStr = "장애인" + disabledAmount;
				stringArray.push(disabledStr); 
			}	
			
			let resultStr = ''; 
			
			if(stringArray.length > 1){
				stringArray.forEach(string => {
					if(stringArray[stringArray.length - 1] === string){
						resultStr += string;
					}else {
						resultStr += string + ", ";
					}
				});
			}else {
				resultStr = stringArray[0];
			}
			
			$("#type_count").text(resultStr);
		}
		
		function selectSeat(event){
			
			if(selectedAmount === finalAmount - 1){
				
				const teenagerAmount = parseInt($("#teenager_amount").text());
				const adultAmount = parseInt($("#adult_amount").text());
				const senileAmount = parseInt($("#senile_amount").text());
				const disabledAmount = parseInt($("#disabled_amount").text());
				
				const totalCost = adultAmount * 14000 + teenagerAmount * 11000 + senileAmount * 7000 + disabledAmount * 5000;				
				
				$("#total_cost").text(" " + totalCost + " ");
				
			}
			
			const seatRow = event.target.parentNode.firstChild.innerText;
			const seatColumn = event.target.innerText;
			const scheduleNo = "${scheduleNo}";
			
			const object = {
				"seatRow" : seatRow,
				"seatColumn" : seatColumn,
				"scheduleNo" : scheduleNo
			}
			
			if(finalAmount === 0){
				alert("인원수를 선택해주세요.");
			}else {
			
				if(event.target.style.backgroundColor === "red"){
					event.target.style.backgroundColor = '#3498db';
					selectedAmount--;
					array.pop(object);
					$("#total_cost").text(" " + 0 + " ");
					
					let resultStr = ''; 
					
					console.log(array.length);
					
					if(array.length > 1){
						array.forEach(object => {
							if(array[array.length - 1] === object){
								resultStr += object.seatRow + object.seatColumn;
							}else {
								resultStr += object.seatRow + object.seatColumn + ", ";
							}
						});
					}else {
						if(array.length === 1){
							resultStr = array[0].seatRow + array[0].seatColumn;
						}else {
							resultStr = "";
						}
					}
					
					$("#seat_selected").text(resultStr);
					
				}else {
					
					if(selectedAmount === finalAmount){
						alert("선택한 인원수를 확인해주세요.");
					}else {
						event.target.style.backgroundColor = 'red';
						selectedAmount++;
						array.push(object);
						
						let resultStr = ''; 
						
						console.log(array.length);
						
						if(array.length > 1){
							array.forEach(object => {
								if(array[array.length - 1] === object){
									resultStr += object.seatRow + object.seatColumn;
								}else {
									resultStr += object.seatRow + object.seatColumn + ", ";
								}
							});
						}else {
							if(array.length === 1){
								resultStr = array[0].seatRow + array[0].seatColumn;
							}else {
								resultStr = "";
							}
						}
						
						$("#seat_selected").text(resultStr);
					}
				
				}
			}
			
			
			
		}
		
		
		
	</script>
</body>
</html>