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

.myInfo p {
	margin: 15px 0;
}

.myInfo p:nth-child(2) {
	padding-bottom: 20px;
	border-bottom: 1px solid;
}

.myInfo p:nth-child(3) {
	text-align: right;
}

p span {
	color: red;
}

table {
	width: 900px;
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
				<h2>나의 예매 내역 <span id="reservationListNo"></span></h2>
				<p>지난 <span>1개월</span>까지의 예매내역을 확인하실수 있습니다.</p>
				<p>예매번호로만 티켓을 찾을 수 있으니 반드시 확인 부탁드립니다.</p>
				<div class="reservationList">
					예매내역
				</div>
				<div class="cancerList">
					<h2>나의 취소내역 <span>상영일 기준 지난 7일 동안의 취소내역입니다.</span></h2>
					<table border="1">
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
				if(this.responseText != null){
					const reservationList = JSON.parse(this.responseText);
					const tbody = document.querySelector("#tbody");
					
				}
				
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/mem/reservation");
			xhttp.setRequestHeader("Authorization", token);
			xhttp.send();
		});
		
	</script>
</body>
</html>