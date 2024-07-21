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
}
#payment_result div:nth-child(4), #payment_result div:nth-child(5), #payment_result div:nth-child(6){
	height: 53px;
	background: black;
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 10px;
}
#payment_result div:nth-child(4) p, #payment_result div:nth-child(4) span, #payment_result div:nth-child(5) p, #payment_result div:nth-child(5) span, #payment_result div:nth-child(6) p, #payment_result div:nth-child(6) span {
	color: white;
}
#payment_result div:nth-child(4) h6, #payment_result div:nth-child(5) h6, #payment_result div:nth-child(6) h6{
	color: white;
	font-size: 1rem;
	font-weight: bold;
}
#payment_result div:nth-child(7){
	background: red;
	height: 53px;
	width: 100%;
	text-align: center;
}
#payment_result div:nth-child(7) p{
	color: white;
	position: relative;
	top: 50%;
	transform: translateY(-50%);
	font-weight: bold;
}
#avaliable_point{
	height: 70px;
	width: 100%;
	background: #ddd;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	
}
#avaliable_point p, #avaliable_point span {
	color: black;
}
#use_all_point{
	display: flex;
	margin-left: 20px;
}
#use_all_point p{
	margin-right: 5px;
}
#point_inputs{
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: auto 0;
}
#left_point{
	text-align: right;
	font-size: 12px;
	position: relative;
	right: 20px;
	bottom: 10px;	
}
#use_point_div{
	margin-right: 20px;
	display: flex;
	align-items: center;
}
#use_point_div input{
	width: 100px;
	font-size: 17px;
	padding: 2px;
	text-align: right;
}
#movie_detail {
	position: relative;
	height: 350px;
	padding-top: 40px;
	padding-bottom: 50px;
	padding-left: 40px;
	padding-right: 40px;
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
	position: relative;
	right: 10px;
	font-size: 1.2rem;
	display: flex;
	align-items: center;
	margin-top: 15px;
}
#movie_detail_grade_title img{
	margin-right: 10px;
}
#movie_detail_date_time {
	font-size: 0.8rem;
	margin: 10px 0;
	font-weight: bold;
	position: relative;
	right: 10px;
}
#movie_detail_date_time span:nth-child(2){
	position: relative;
	left: 22px;
}
#cinema_detail{
	font-size: 0.8rem;
	margin-top: 10px 0;
	font-weight: bold;
	position: relative;
	right: 10px;
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
	margin-right: 21px;
}
#selectedSeats span:first-child{
	margin-right: 21px;
}
#pay_type_tool{
	height: 400px;
}
#pay_type_discount{
	border-bottom: 1px solid grey;
	overflow-y: scroll;
	height: 400px;
	padding-bottom: 11px;
	width: 100%;
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
	height: 529px;
	background: white;
	overflow-y: scroll;
}
.unactivated{
	visibility: hidden;
}
.activated{
	visibility: visible;
}
#pay_type_discount_types_list{
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
	gap: 10px;
	margin-top: 20px;
	margin-left: 20px;
	justify-content: flex-start;
	align-items: flex-start;
}
.gift_card{
	width: 80px;
	border-radius: 5px;
	height: 40px;
	border: 1px solid #ddd;
	background: white;
	padding: 10px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	cursor: pointer;
}
.gift_card:hover{
	background: #f7f5f5;
}
.gift_card p{
	margin: 1px 0;
	text-align: center;
}

.gift_card p:first-child{
	font-size: 13px;
	color: black;
	font-weight: bold;
}
.gift_card p:nth-child(2){
	font-size: 10px;
	margin: 2px 0;
	color: blue;
}
.gift_card p:nth-child(3){
	font-size: 10px;
	color: red;
}

.discount_coupon{
	width: 90px;
	height: 47px;
	border-radius: 5px;
	border: 1px solid #ddd;
	background: white;
	padding: 10px 5px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	cursor: pointer;
}
.discount_coupon:hover{
	background: #f7f5f5;
}
.discount_coupon p{
	text-align: center;
}
.discount_coupon p:first-child{
	font-size: 13px;
	color: black;
	font-weight: bold;
}
.discount_coupon p:nth-child(2){
	font-size: 11px;
	margin: 2px 0;
	color: blue;
}
.discount_coupon p:nth-child(3){
	font-size: 10px;
	color: red;
}
#reservation_receipt{
	width: 100%;
	text-align: center;
	table-layout: fixed;
	border-spacing: 0;
}
#reservation_receipt th{
	padding-bottom: 5px;
	background: #ddd;
	font-size: 13px;
}
#reservation_receipt tbody td{
	padding: 10px 0;
}
#reservation_receipt tbody tr:last-child td{
	padding-bottom: 10px;
}
#reservation_receipt tbody td:first-child{
	font-weight: bold;
}
#reservation_receipt tbody td:last-child{
	font-weight: bold;
}

#reservation_receipt tbody td:nth-child(2){
	font-size: 12px;
	color: grey;
}

.giftcard_or_coupon{
	width: 100%;
	text-align: center;
	border-spacing: 0;
	table-layout: fixed;
}

.giftcard_or_coupon th{
	border-bottom: 1px solid #ddd;
	background: #ddd;
	padding-bottom: 5px;
	font-size: 13px;
}
.giftcard_or_coupon tbody td{
	padding-top: 10px;
	padding-bottom: 10px;
}
.giftcard_or_coupon tbody td:first-child{
	font-weight: bold;
}

.giftcard_or_coupon tbody td:nth-child(2){
	font-size: 12px;
	color: grey;
}
.giftcard_or_coupon tbody td:nth-child(3){
	font-size: 14px;
	font-weight: bold;
}
.discount_coupon.selected{
	background: #ddd;
}
.gift_card.selected{
	background: #ddd;
}
.giftcard_or_coupon tbody tr:hover{
	cursor: pointer;
	background: #e8e6e6;
}
#discount_title{
	position: relative;
	text-align: left;
	background: #ddd;
	padding-left: 10px;
	padding-top: 5px;
	font-size: 12px;
	color: white;
}
#receipt_title{
	position: relative;
	top: 0;
	left: 0;
	text-align: left;
	background: #ddd;
	padding-left: 10px;
	padding-top: 5px;
	font-size: 12px;
	color: white;
}
#giftcard_title{
	position: relative;
	top: 0;
	left: 0;
	text-align: left;
	background: #ddd;
	padding-left: 10px;
	padding-top: 5px;
	font-size: 12px;
	color: white;
	
}
#my_discount_coupon.selected{
	background: white;
	font-weight: bold;
	border-radius: 5px;
}
#my_gift_card.selected{
	background: white;
	border-top-left-radius: 5px; 
	border-bottom-left-radius: 5px; 
	font-weight: bold;
}
#creditcard_types div.selected{
	background: #ddd;
}
#pay_type_discount_alert{
	color: red;
	font-size: 13px;
	position: relative;
	top: -35px;
	left: 220px;
	font-weight: bold;
}
#pay_type_discount_alert span{
	position: relative;
	top: 2px;
	color: red;
	font-weight: bold;
	right: 2px;
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
							<p id="pay_type_discount_alert"><span>*</span>기프트카드 할인쿠폰 중 1개만 사용 가능합니다.</p>
							<div id="pay_type_discount_types">
								<p id="my_gift_card">기프트 카드</p>
								<p id="my_discount_coupon">할인 쿠폰</p>
							</div>
							<div id="pay_type_discount_types_list">
								
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
						<div id="payment_receipt">
							<div>
								<table id="reservation_receipt">
									<caption id="receipt_title">영수증</caption>
									<thead>
										<tr>
											<th>인원</th>
											<th>수량</th>
											<th>가격</th>
										</tr>
									</thead>
									<tbody id="receipt_result">
									</tbody>
								</table>
							</div>
							<div id="giftcard_and_coupon_container">
								<table class="giftcard_or_coupon" id="coupon_table">
									
								</table>
								<table class="giftcard_or_coupon" id="giftcard_table">
									
								</table>
							</div>
						</div>
						
						<div id="avaliable_point">
							<div id="point_inputs">
								<div id="use_all_point">
									<p>포인트</p>
									<input type="button" value="전액사용" id="use_all_point_btn">
								</div>
								<div id="use_point_div">
									<input type="number" min="0" value="0" name="using_point" id="use_point_input">
									<p>원</p>
								</div>
							</div>
							<p id="left_point">잔여 : <span id="totalPoint"></span> 원</p>
						</div>
						<div id="payment_result_before_cost">
							<h6>상품금액</h6>
							<p><span id="before_cost_total"></span>원</p>
						</div>
						<div id="payment_result_discount">
							<h6>할인금액</h6>
							
							<p>- <span id="discount_price_total">0 </span>원</p>
						</div>
						<div id="payment_result_pay_cost">
							<h6>결제금액</h6>
							<p><span id="pay_result">0 </span>원</p>
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
	
	 function getTableRowClassNames() {
         // 배열을 생성하여 각 tr 요소의 클래스 이름을 저장
         const classNames = [];
         
         // jQuery를 사용하여 모든 tr 요소를 선택하고 each 메서드로 순회
         $('#giftcard_table tbody tr').each(function() {
             // 현재 tr 요소의 클래스 이름을 가져옴
             const className = $(this).attr('class');
             if (className) { // 클래스 이름이 있을 때만 추가
                 classNames.push(className);
             }
         });

         return classNames;
     }
	
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
			
			let totalMoney = 0;
			let receiptStr = '';
							
			console.log(typeCountArray);
							
			for(let i = 0; i < typeCountArray.length ; i++){
				let ageType = typeCountArray[i];
				if(ageType.includes("성인")){
					totalMoney += parseInt(ageType.substring(2, ageType.length)) * 14000;
					receiptStr += '<tr> ' +
									'<td>성인</td> ' +
									'<td>' + ageType.substring(2, ageType.length) + '</td> ' + 
							    	'<td>' +  parseInt(ageType.substring(2, ageType.length)) * 14000 + '</td> ' +
									'</tr> ';
									
				}else if(ageType.includes("청소년")){
					totalMoney += parseInt(ageType.substring(3, ageType.length)) * 11000;
					receiptStr += '<tr> ' +
									'<td>청소년</td> ' +
									'<td>' + ageType.substring(3, ageType.length) + '</td> ' + 
							    	'<td>' +  parseInt(ageType.substring(3, ageType.length)) * 11000 + '</td> ' +
									'</tr> ';
				}else if(ageType.includes("경로")){
					totalMoney += parseInt(ageType.substring(2, ageType.length)) * 7000;
					receiptStr += '<tr> ' +
									'<td>경로</td> ' +
									'<td>' + ageType.substring(2, ageType.length) + '</td> ' + 
							    	'<td>' +  parseInt(ageType.substring(2, ageType.length)) * 7000 + '</td> ' +
									'</tr> ';
				}else if(ageType.includes("장애인")){
					totalMoney += parseInt(ageType.substring(3, ageType.length)) * 5000;	
					receiptStr += '<tr> ' +
									'<td>장애인</td> ' +
									'<td>' + ageType.substring(3, ageType.length) + '</td> ' + 
							    	'<td>' +  parseInt(ageType.substring(3, ageType.length)) * 5000 + '</td> ' +
									'</tr> ';
				}
			}
			
			$("#receipt_result").html(receiptStr);
			
			const formattedTotalMoney = totalMoney.toLocaleString(); // 숫자를 3자리 단위로 , 를 붙여주는 함수
			$("#pay_result").text(formattedTotalMoney);
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
				
				$("#my_gift_card").addClass("selected");
				$("#my_discount_coupon").removeClass("selected");
				
				const jwtToken = localStorage.getItem("jwtToken");
				
				const classNames = getTableRowClassNames();
				
				console.log(classNames);
				
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/my/gift/card",
					method : "GET",
					dataType : "json",
					headers: {
				        'Authorization': 'Bearer ' + jwtToken  // Authorization 헤더에 JWT 토큰 추가
				    },
					success : function(response){
						
						let str = "";
						// 기프트 카드가 한 개 이상일 때
						if(response.length > 0){
							
							response.forEach(giftCard => {

								const formattedDate = formatDate(giftCard.product.productEndDate, 'YYYY.MM.DD');
								const formattedTotalMoney = giftCard.product.productPrice.toLocaleString();
								
								console.log(formattedTotalMoney);
								
								if(classNames.includes("giftCardNo_" + giftCard.giftCardNo)){
									str += '<div class="gift_card selected" id="giftCardNo_' + giftCard.giftCardNo + '" onclick="selectGiftCard(event)"> ' +
										   '<p class="giftCardName">' + giftCard.product.productName + '</p> ' +
										   '<p class="giftCardPrice">- ' + formattedTotalMoney + '원</p> ' +
										   '<p class="date">~ ' + formattedDate + '</p> ' +
										   '</div> ';
								}else {
									str += '<div class="gift_card" id="giftCardNo_' + giftCard.giftCardNo + '" onclick="selectGiftCard(event)"> ' +
									   '<p class="giftCardName">' + giftCard.product.productName + '</p> ' +
									   '<p class="giftCardPrice">- ' + formattedTotalMoney + '원</p> ' +
									   '<p class="date">~ ' + formattedDate + '</p> ' +
									   '</div> ';
								}
								
							});
						}
						
						
						
						$("#pay_type_discount_types_list").html(str);
						
					},
					error: function(xhr, status, error){
						console.log(error);
					}
				});
				
				
			});

			$("#my_discount_coupon").on("click", function(){
				
				const jwtToken = localStorage.getItem("jwtToken");
				
				$("#my_discount_coupon").addClass("selected");
				$("#my_gift_card").removeClass("selected");
				
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/my/discount/coupon",
					method: "GET",
					dataType : "json",
					headers: {
						"Authorization" : "Bearer " + jwtToken
					},
					success : function(response){
						
						let str = "";
						const className = $('#coupon_table tbody tr').attr("class");
						
						// 할인 쿠폰이 1개 이상일 때 
						if(response.length > 0){
							
							response.forEach(coupon => {
								
								const formattedDate = formatDate(coupon.couponNo.endDate, 'YYYY.MM.DD');
								
								
								if(className === "issueNo_" + coupon.issueNo){
									str += '<div class="discount_coupon selected" id="issueNo_' + coupon.issueNo + '" onclick="selectDiscountCoupon(event)"> ' +
										   '<p class="couponName">' + coupon.couponNo.couponName + '</p> ' +
										   '<p class="discount">' + coupon.couponNo.discount + '%</p> ' +
										   '<p class="date">~ ' + formattedDate + '</p> ' +
										   '</div> ';							
								}else {
									str += '<div class="discount_coupon" id="issueNo_' + coupon.issueNo + '" onclick="selectDiscountCoupon(event)"> ' +
									   '<p class="couponName">' + coupon.couponNo.couponName + '</p> ' +
									   '<p class="discount">' + coupon.couponNo.discount + '%</p> ' +
									   '<p class="date">~ ' + formattedDate + '</p> ' +
									   '</div> ';	
								}		
							
							});
							
						}
						
						$("#pay_type_discount_types_list").html(str);
						
					},
					error : function(xhr, status, error){
						console.log(error);
					}
				});
			});
			
			const jwtToken = localStorage.getItem("jwtToken");
			
			$.ajax({
				url : "http://localhost:9001/api/v1/reservation/my/point",
				method : "GET",
				dataType : "json",
				headers: {
			        'Authorization': 'Bearer ' + jwtToken  // Authorization 헤더에 JWT 토큰 추가
			    },
			    success : function(response){
			    	
			    	$("#totalPoint").text(response);
			    },
			    error : function(xhr, status, error){
			    	console.log(error);
			    }
				
			});
			
			let savePoint = 0;
			
			$("#use_all_point_btn").on("click", function(){
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/my/point",
					method : "GET",
					dataType : "json",
					headers: {
				        'Authorization': 'Bearer ' + jwtToken  // Authorization 헤더에 JWT 토큰 추가
				    },
				    success : function(response){
				    	$("#totalPoint").text(response);
				    	$("#use_point_input").val(response);
				    	$("#totalPoint").text(response - response);
				    	
				    	
				    	
				    },
				    error : function(xhr, status, error){
				    	console.log(error);
				    }
					
				});
			});
			
			let beforeDiscountPrice = 0;
			
			$("#use_point_input").on("blur", function(event){
			
				$.ajax({
					url : "http://localhost:9001/api/v1/reservation/my/point",
					method : "GET",
					dataType : "json",
					headers: {
				        'Authorization': 'Bearer ' + jwtToken  // Authorization 헤더에 JWT 토큰 추가
				    },
				    success : function(response){
				    	$("#totalPoint").text(response);
				    	const inputPoint = Number($("#use_point_input").val());
				    	if($("#before_cost_total").text() === $("#pay_result").text()){

				    		const before_cost_total = $("#before_cost_total").text();
				    		const beforeCostTotalWithoutCommas = before_cost_total.replace(/,/g, '');
				    		
				    		$("#discount_price_total").text(inputPoint.toLocaleString());
				    		
				    		if(beforeCostTotalWithoutCommas - inputPoint < 0){
				    			$("#discount_price_total").text(beforeCostTotalWithoutCommas.toLocaleString());
				    			$("#pay_result").text(0 + " ");
				    			$("#use_point_input").val(beforeCostTotalWithoutCommas);
				    			$("#totalPoint").text($("#totalPoint").text() - beforeCostTotalWithoutCommas);
				    		}else {
					    		$("#pay_result").text((beforeCostTotalWithoutCommas - inputPoint).toLocaleString());
					    		$("#totalPoint").text($("#totalPoint").text() - inputPoint);
				    		}
				    		
				    	}else {
				    		
				    		if($("#coupon_table").find("tbody tr").length === 0 && $("#giftcard_table").find("tbody tr").length === 0){
				    			
				    			const before_cost_total = $("#before_cost_total").text();
					    		const beforeCostTotalWithoutCommas = before_cost_total.replace(/,/g, '');
					    		
					    		$("#discount_price_total").text(inputPoint.toLocaleString());
					    		
					    		if(beforeCostTotalWithoutCommas - inputPoint < 0) {
					    			$("#pay_result").text(0 + " ");
					    			$("#totalPoint").text($("#totalPoint").text() - beforeCostTotalWithoutCommas);
					    			$("#use_point_input").val(beforeCostTotalWithoutCommas);
					    			$("#discount_price_total").text(beforeCostTotalWithoutCommas.toLocaleString());
					    		}else {
						    		$("#pay_result").text((beforeCostTotalWithoutCommas - inputPoint).toLocaleString());
						    		$("#totalPoint").text($("#totalPoint").text() - inputPoint);
						    		$("#discount_price_total").text(inputPoint.toLocaleString());

					    		}
				    		} else {
				    			
				    			if($("#coupon_table").find("tbody tr").length > 0) {
				    				const className = $("#coupon_table").children("tbody").children("tr").attr("class");
				    				
				    				const discount = $($("." + className).children("td")[2]).text();
				    				
				    				const formattedDiscount = discount.replace("%", "").replace(" ", "");
				    				
				    				const before_cost_total = $("#before_cost_total").text();
						    		const beforeCostTotalWithoutCommas = Number(before_cost_total.replace(/,/g, ''));
				    				
						    		const payFinal =  beforeCostTotalWithoutCommas - (beforeCostTotalWithoutCommas * Number(formattedDiscount) / 100) - inputPoint;
						    		
						    		if(payFinal < 0){ // 결제 금액이 0보다 작으면
										$("#pay_result").text(0 + " ");				    				
					    			}else {
						    			$("#pay_result").text(payFinal);
						    			$("#discount_price_total").text((((beforeCostTotalWithoutCommas * Number(formattedDiscount) / 100) + inputPoint).toLocaleString());
						    			$("#totalPoint").text($("#totalPoint").text() - inputPoint);
					    			}
						    		
				    			} else if($("#giftcard_table").find("tbody tr").length > 0) {
				    				console.log("기프트카드 적용");
				    			}
				    			
				    			const before_cost_total = $("#before_cost_total").text();
					    		const beforeCostTotalWithoutCommas = before_cost_total.replace(/,/g, '');
				    			
				    			const discount_price_total = $("#discount_price_total").text();
				    			const discountPriceTotalWithoutCommas = discount_price_total.replace(/,/g, '');
				    			
				    			console.log(beforeDiscountPrice);
				    			
				    			const payFinal =  Number(beforeCostTotalWithoutCommas) - Number(discountPriceTotalWithoutCommas) - inputPoint;
				    			
				    			
				    			if(payFinal < 0){ // 결제 금액이 0보다 작으면
									$("#pay_result").text(0 + " ");				    				
				    			}else {
					    			$("#pay_result").text(payFinal);
					    			$("#discount_price_total").text((Number(discountPriceTotalWithoutCommas) + inputPoint).toLocaleString());
					    			$("#totalPoint").text($("#totalPoint").text() - inputPoint);
				    			}
				    			
				    			
				    		}
				    		
				    	}
				    	
				    },
				    error : function(xhr, status, error){
				    	console.log(error);
				    }
				});
			});
			
			$("#use_point_input").on("blur", function(){ // 인풋이 실행될때 이벤트가 발생하는 것을 인풋에서 블러 될때 발생하게 수정해야 한다.
				$("#use_point_input").val();					
				
			})
			
			$("#creditcard_types").on("click", "div", function(){
				$(this).addClass("selected");
				$(this).siblings().removeClass("selected");
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
		
		function formatDate(dateString, format) {
		    const date = new Date(dateString);

		    const map = {
		        'YYYY': date.getFullYear(),
		        'MM': String(date.getMonth() + 1).padStart(2, '0'),
		        'DD': String(date.getDate()).padStart(2, '0'),
		        'HH': String(date.getHours()).padStart(2, '0'),
		        'mm': String(date.getMinutes()).padStart(2, '0'),
		        'ss': String(date.getSeconds()).padStart(2, '0')
		    };

		    return format.replace(/YYYY|MM|DD|HH|mm|ss/g, matched => map[matched]);
		}
		
// 		const parentElement = document.getElementById("pay_type_discount_types_list");
		
// 		const couponChild = parentElement.querySelectorAll(".discount_coupon");
		
// 		const giftCardChild = parentElement.querySelectorAll(".gift_card");
		
// 		for (let i = 0; i < couponChild.length; i++) {
// 			couponChild[i].addEventListener("click", function() {
// 		        console.log("sssss");
// 		    });
// 		}
		
// 		for (let i = 0; i < giftCardChild.length; i++) {
// 			giftCardChild[i].addEventListener("click", function() {
// 		        console.log("sssss");
// 		    });
// 		}
		
		
		
		let giftCardArray = new Array();
		let idArray = new Array();
		
		function selectGiftCard(event){
	
			let id = '';
			
			if(event.target.tagName === "P") {
				id = event.target.parentNode.id;
			}else {
				id = event.target.id;
			}
			
			$("#coupon_table").empty();
			
			$("#" + id).addClass("selected");
			
			const giftCardName = $("#" + id).children(".giftCardName").text();
			const giftCardPrice = $("#" + id).children(".giftCardPrice").text();
			
			const object = {
				"name" : giftCardName,
				"price" : giftCardPrice,
				"id" : id
			};
			
			const isDuplicated = hasDuplicateId(idArray, id);
			
			if(!isDuplicated){
				giftCardArray.push(object);
			}
			
			let str = '<table class="giftcard_or_coupon"> ' +
			  '<caption id="giftcard_title">기프트카드</caption> ' +
			  '<thead><tr><th>이름</th><th>수량</th><th>할인금액</th></tr></thead><tbody> ';
			
			// const nameCountsPairs = countNames(giftCardArray, idArray, id); 
			
			idArray.push(id);
			
			const before_cost_totalString = $("#before_cost_total").text();
			
			const numberWithoutCommas = before_cost_totalString.replace(/,/g, ''); // "20000"
			let before_cost_totalNumber = Number(numberWithoutCommas);
			let discountPrice = 0;
			giftCardArray.forEach(giftCard => {
				str += ' <tr class="' + giftCard.id + '" onclick="deleteSelf(event)"><td> ' +
					  giftCard.name + 	
					  '</td><td>' + 
					  1 + 
					  '</td><td> ' +
					  giftCard.price +
					  '</td></tr> '; 
					  const priceString = giftCard.price.split(" ")[1].replace("원",  "");
					  const priceWithoutCommas = priceString.replace(/,/g, '');
					  let price = Number(priceWithoutCommas);
					  discountPrice += price;
					  before_cost_totalNumber = before_cost_totalNumber - price;
					  if(before_cost_totalNumber < 0){
					 	before_cost_totalNumber = 0;
					  }
			});
			
			$("#discount_price_total").text(discountPrice.toLocaleString());
			
			$("#pay_result").text(before_cost_totalNumber.toLocaleString());
			str += '</tbody></table> ';
			$("#giftcard_table").html(str);
			
		}
		
		function selectDiscountCoupon(event){
			
			$("#discount_price_total").text(0 + " ");
			$("#pay_result").text(0 + " ");
			
			let id = '';
			
			if(event.target.tagName === "P") {
				id = event.target.parentNode.id;
			}else {
				id = event.target.id;
			}
			
			giftCardArray.splice(0, giftCardArray.length);
			idArray.splice(0, idArray.length);
			
			$("#giftcard_table").empty();
			
			$("#" + id).siblings().removeClass("selected");
			$("#" + id).addClass("selected");
			
			const couponName = $("#" + id).children(".couponName").text();
			const discount = $("#" + id).children(".discount").text();
			
			let str = '<table class="giftcard_or_coupon"> ' +
					  '<caption id="discount_title">할인쿠폰</caption> ' +
					  '<thead><tr><th>이름 ' +
 					  '</th><th>수량</th><th>할인율</th></tr></thead><tbody><tr class="' + id +'" onclick="deleteSelf(event)"><td> ' +
					  couponName	+
					  '</td><td> ' +
					  1 +											
					  '</td><td class="discount"> ' +
					  discount +
					  '</td> ' +
					  '</tr></tbody></table> ';
			
			$("#coupon_table").html(str);
			
			const before_cost_total = $("#before_cost_total").text();
			const priceWithoutCommas = before_cost_total.replace(/,/g, '');
			const discountNumber = Number(discount.replace("%", ""));
			
			const discountPrice = (priceWithoutCommas * discountNumber / 100);
			const resultPrice = priceWithoutCommas - discountPrice;
			const formattedResultPrice= resultPrice.toLocaleString()
			const formattedDiscountPrice = discountPrice.toLocaleString();
			$("#discount_price_total").text(formattedDiscountPrice);
			$("#pay_result").text(formattedResultPrice);
			
			
		}
		
		function countNames(list, idArray, id) {
		    // 이름과 해당 이름의 출현 횟수를 저장할 객체
			const nameCounts = {};

		    // 리스트의 각 요소를 순회하면서 이름의 출현 횟수를 카운트
		    list.forEach(function(item) {
		        const name = item.name; // 리스트 요소의 이름 속성을 가져옴
		        
			        if (name in nameCounts) {
			            nameCounts[name]++; // 이미 있는 이름이면 카운트 증가
			        } else {
		    	        nameCounts[name] = 1; // 새로운 이름이면 카운트를 1로 초기화
		        	}
		    });

		    // 이름과 카운트를 매칭시키는 객체를 반환
		    const nameCountPairs = Object.entries(nameCounts).map(([name, count]) => ({ name, count }));

		    return nameCountPairs;
		}
		
		function hasDuplicateId(list, idToCheck) {
		    // 리스트를 순회하면서 같은 이름이 있는지 검사
		    for (let i = 0; i < list.length; i++) {
		        if (list[i] === idToCheck) {
		            return true; // 같은 이름을 찾으면 true 반환
		        }
		    }
		    return false; // 같은 이름을 찾지 못하면 false 반환
		}
		
		function deleteSelf(event){
			const tr = event.target.closest('tr');
	        if (tr) {
	            tr.remove();
	        }
				        
	        if(tr.className.includes("issueNo_")){
				$("#" + tr.className).removeClass("selected");
				$("#coupon_table").empty();
				
				const before_cost_total = $("#before_cost_total").text();
				
				$("#pay_result").text(before_cost_total + " ");
				$("#discount_price_total").text(0 + " ");
				
			}else if(tr.className.includes("giftCardNo_")){
				$("#" + tr.className).removeClass("selected");

				const giftCardName = $("#" + tr.className).children(".giftCardName").text();
				const giftCardPrice = $("#" + tr.className).children(".giftCardPrice").text();
				const before_cost_total = $("#before_cost_total").text();
				
				const beforeCostToalWithoutCommas = before_cost_total.replace(/,/g, '');
				
				
				const object = {
					"name" : giftCardName,
					"price" : giftCardPrice,
					"id" : tr.className
				};
				
				const before_cost = $("#discount_price_total").text();
				const pay_result = $("#pay_result").text();
				const priceString = giftCardPrice.split(" ")[1].replace("원",  "");
				const priceWithoutCommas = priceString.replace(/,/g, '');
				let beforeCostWithoutCommas = before_cost.replace(/,/g, '');
				let price = Number(priceWithoutCommas);
				beforeCostWithoutCommas -= price; // 기프트카드를 삭제할때 결제 금액이 올라가야한다. 하지만 만약 결제 금액이 0보다 작으면 0으로 고정했기 때문에 올라가는 금액이 원래 결제해야할 금액보다 커진다.
// 				$("#pay_result").text(Number(pay_result) + price);
				
				$("#discount_price_total").text(beforeCostWithoutCommas.toLocaleString());
				
				$("#pay_result").text((beforeCostToalWithoutCommas - beforeCostWithoutCommas).toLocaleString());
				
				giftCardArray = removeObjectFromArray(giftCardArray, object); // 기프트카드 리스트에서 선택한 요소 제거 제거
				idArray = removeElementFromArray(idArray, tr.className); // 아이디 리스트에서 선택한 요소 제거
				
				if(giftCardArray.length === 0){
					$("#giftcard_table").empty();
				}
				
			}
			
		}
		
		function removeObjectFromArray(arr, objToRemove) {
		    // filter 메서드를 사용하여 주어진 객체와 같지 않은 객체들로 이루어진 새 배열 생성
		    let filteredArray = arr.filter(obj => !isEqual(obj, objToRemove));
		    return filteredArray;
		}
		
		function isEqual(obj1, obj2) {
		    // 간단하게 모든 속성이 일치하는지 확인
		    return JSON.stringify(obj1) === JSON.stringify(obj2);
		}
		
		// 주어진 요소와 같은 요소를 찾아 제거하는 함수
		function removeElementFromArray(arr, elementToRemove) {
		    // filter 메서드를 사용하여 주어진 요소와 같지 않은 요소들로 이루어진 새 배열 생성
		    let filteredArray = arr.filter(element => element !== elementToRemove);
		    return filteredArray;
		}
		
	</script>
</body>
</html>