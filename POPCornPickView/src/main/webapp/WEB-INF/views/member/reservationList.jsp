<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매내역 조회 페이지</title>
<style>
main {
	width: 1200px;
	margin: 80px auto;
/* 	min-height: 700px; */
	border:1px solid #eee;
}

.flex-box {
	display: flex;
	box-sizing: border-box;
}

.myInfo {
	width: 900px;
	margin: 0 35px;
}

.myInfo h2 {
	margin-top: 20px;
}

.myInfo #p1,
.myInfo #right {
	margin: 15px 0;
}

#p1 {
	padding-bottom: 20px;
	border-bottom: 1px solid;
}

#right {
	text-align: right;
}

#red {
	color: red;
}

#cancelListTable {
	width: 900px;
}

.reservationList {
	display: flex;
	width: 900px;
	height: 250px;
}

.reservationInfo {
	display: flex;
	margin: 30px 0;
}

.ticketingNo {
	width: 200px;
	text-align: center;
	line-height: 100px;
}

.moviePoster {
	width: 200px;
}

.ticketingNo h3 {
	
}

.ticketingInfo {
	border: 1px solid;
}

.h3 {
	margin: 20px 0;
	border-top: 1px solid;
	padding-top: 20px;
	width: 700px;
	height: 30px;
	position: relative;
	left: 200px;
}

#cancelTicket {
	position: absolute;
	right: 50px;
	border: none;
	border-radius: 8px;
	width: 80px;
	height: 25px;
}

</style>
</head>
<body>
	<header>
		<%@ include file="../member/mainInfo.jsp"%>
	</header>
	<main>
		<div class="flex-box">
			<div class="sidebar">
				<%@ include file="../member/sideMenu.jsp"%>
			</div>
			<div class="myInfo">
				<h2>나의 예매 내역 <span id="ticketingCount"></span></h2>
				<p id="p1">지난 <span id="red">1개월</span>까지의 예매내역을 확인하실수 있습니다.</p>
				<p id="right">예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</p>
				<div class="ticketingInfo">
					<div class="reservationList">
						<div class="ticketingNo">
							<h3>예매번호 <span id="reservationNo"></span></h3>
							<p class="reservationDate">예매날짜</p>
						</div>
						<div class="reservationInfo">
							<img alt="예매한 영화 포스터" src="" class="moviePoster">
							<div class="movieInfo">
								<div class="movieName">
									영화 제목
								</div>
								<table border="1" class="previewInfo">
									<tr>
										<th>관람극장</th>
										<td></td>
									</tr>
									<tr>
										<th>관람일시</th>
										<td></td>
									</tr>
									<tr>
										<th>관람좌석</th>
										<td></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<h3 class="h3">총 결제금액  <span class="span1">11,000원</span> <input id="cancelTicket" type="button" value="예매취소" onclick="cancelTicketing()"></h3>
				</div>
				<div class="cancelList">
					<h2>나의 취소내역 <span class="span2">상영일 기준 지난 7일 동안의 취소내역입니다.</span></h2>
					<table border="1" id="cancelListTable">
						<thead>
							<tr>
								<th>관람 영화/매점</th>
								<th>관람 극장</th>
								<th>관람 일시</th>
								<th>취소일</th>
								<th>결제취소 금액</th>
							</tr>
						</thead>
						<tbody id="tbody">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
	</main>
	<footer>
		
	</footer>
	<script>
		
		document.addEventListener("DOMContentLoaded", () => {
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				console.log(this.responseText);
				if(this.responseText != null){
					const reservationList = JSON.parse(this.responseText);
					const reservationContainer = document.querySelector('.reservationList');
					
					reservationList.forEach(reservation => {
						const reservationDiv = document.createElement('div');
						reservationDiv.classList.add('reservationList');
						
						reservationDiv.innerHTML += `<div class="ticketingNo">
		                        <h3>예매번호 <span id="reservationNo">${reservation.ticketingNo}</span></h3>
		                        <p class="reservationDate">${reservation.regdate}</p>
		                    </div>
		                    <div class="reservationInfo">
		                        <img alt="예매한 영화 포스터" src="${reservation.promotionPoster}" id="moviePoster">
		                        <div class="movieInfo">
		                            <div class="movieName">${reservation.movieNm}</div>
		                            <table border="1" class="previewInfo">
		                                <tr>
		                                    <th>관람극장</th>
		                                    <td>${reservation.cinemaName}</td>
		                                </tr>
		                                <tr>
		                                    <th>관람일시</th>
		                                    <td>${reservation.start}</td>
		                                </tr>
		                                <tr>
		                                    <th>관람좌석</th>
		                                    <td>${reservation.seatRow} + " " + ${reservation.seatColumn}</td>
		                                </tr>
		                            </table>
			                        <h3>총 결제금액  <span class="span1">${reservation.payTotalAmount}원</span> <input id="cancelTicket" type="button" value="예매취소" onclick="cancelTicketing()"></h3>
		                        </div>
		                    </div>
		                `;

		                reservationContainer.appendChild(reservationDiv);
					});
					
					
				}
				
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/mem/reservation");
			xhttp.setRequestHeader("Authorization", token);
			xhttp.send();
		});
		
		function reservationcancelList(){
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/mem/cancelReservation");
			xhttp.setRequestHeader("Authorization", token);
			xhttp.send()
			
			
		}
		
// 		reservationList.forEach(reservation =>{
// 			const tr = document.createElement('tr');
// 			const movieTd = document.createElement('td');
// 			const theaterTd = document.createElement('td');
// 			const reservationDateTd = document.createElement('td');
// 			const cancelDateTd = document.createElement('td');
// 			const refundAmountTd = document.createElement('td');
			
// 			movieTd.textContent = reservation.movieTitle;
// 			theaterTd.textContent = reservation.theater;
// 			reservationDateTd.textContent = reservation.reservationDate;
// 			cancelDateTd.textContent = reservation.cancelDate;
// 			refundAmountTd.textContent = reservation.refundAmount;
			
// 			tr.appendChild(movieTd);
// 			tr.appendChild(theaterTd);
// 			tr.appendChild(reservationDateTd);
// 			tr.appendChild(cancelDateTd);
// 			tr.appendChild(refundAmountTd);
			
// 			tbody.appendChild(tr);
		
	</script>
</body>
</html>