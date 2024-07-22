<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람권/할인쿠폰 관리</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
#coupon-container {
	padding: 10px;
}

#have-coupon-container {
	padding: 10px;
}

#use-coupon-container {
	padding: 10px;
}

#coupon-etc-container {
	padding: 10px;
}
</style>
</head>
<body>
	<main>
		<%@ include file="./mainInfo.jsp"%>
		<div class="sidebar-container">
			<%@ include file="./sideMenu.jsp"%>
		</div>
		<div id="container">
			<div id="coupon-container">
				<h3 id="coupon-title">관람권/할인쿠폰 관리</h3>
				<div id="have-coupon-container">
					<div id="have-high-box">
						<p id="have-high-box-title">영화관람권 보유(등록) 내역</p>
						<button id="coupon-regi-btn">영화관람권 등록</button>
					</div>
					<div id="have-row-box">
						<table id="have-table">
							<thead>
								<tr>
									<th>관람권(번호)</th>
									<th>분류</th>
									<th>유효기간</th>
									<th>설명</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>0345-0520-3249-575</td>
									<td>미사용</td>
									<td>2024-12-30</td>
									<td>일반 영화관람권</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="use-coupon-container">
					<div id="use-high-box">
						<p id="use-high-box-title">영화관람권 사용내역</p>
					</div>
					<div id="use-filter">
						<div id="filter-text">조회기간</div>
						<div id="mid-context">
							<div id="fast-button">
								<button class="fast-btn-ele">2주일</button>
								<button class="fast-btn-ele">1개월</button>
								<button class="fast-btn-ele">3개월</button>
								<p>3개월 이전의 내역은 자동 삭제됩니다.</p>
							</div>
							<div id="search-self">
								<input type="date" id="start-date" class="select-date">
								<input type="date" id="end-date" class="select-date">
							</div>
						</div>
						<button id="find-btn">조회하기</button>
					</div>
					<div id="use-result-box">
						<table id="use-result-table">
							<thead>
								<tr>
									<th>관람권 이름</th>
									<th>영화관람권 번호</th>
									<th>분류</th>
									<th>기타</th>
									<th>상태</th>
									<th>사용일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>일반 영화관람권</td>
									<td>0345-1111-5226-589</td>
									<td>사용</td>
									<td>일반</td>
									<td>사용</td>
									<td>2024-04-10</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div id="coupon-etc-container">
					<div id="etc-left-box">이용안내</div>
					<div id="etc-right-box">
						영화관람권은 금액권이 아닙니다. (모닝영화/청소년 관람 시 차액환급 불가)<br> 영화관람권 이용 시 추가금액
						결제 후 특별관 영화 관람은 불가합니다.<br> 특정영화 관람권일 경우, 지정영화 상영기간 또는 사용기간
						중에만 사용이 가능 합니다.<br> 극장 현장 매표소와 홈페이지 인터넷 예매 시 사용 가능하며, 스크래치
						부분을 개봉 또는 훼손 시 현장 사용이 불가능합니다.<br> 영화 예매 시에는 다른 결제수단(신용카드,
						예매쿠폰, 계좌이체 등)과 병행하여 사용이 가능합니다.<br> (단, 2매 이상 구매하실 경우에 한합니다.
						2장 예매 시 1매는 영화예매권으로 결제, 다른 1장은 타 결제수단으로 결제) 홈페이지 예매 후 예매취소는 홈페이지에서
						상영시간 20분 전까지 가능합니다.<br> 취소 시 현금 환불은 되지 않으며, 기존 영화관람권으로 사용기간
						중에 재사용 하실 수 있습니다.<br> (단, 현장취소 시 기존의 영화관람권으로 재사용이 가능하며, 현장 구매
						티켓은 환불이 불가능하며 현장 교환만 가능합니다.) 영화관람권은 현금으로 환불이 되지 않습니다.<br>
						일반관에서 상영하는 영화의 입장권 1매로 교환하실 수 있습니다.<br> (IMAX, Dolby 상영관 이용관
						이용불가 및 3D, 4D 영화 제외)<br> 영화관람권으로 예매 시, 포인트 적립은 되지 않습니다.<br>
						영화관람권 앞면에 기재된 사용기한까지(관람일 기준) 사용하실 수 있습니다.<br> 유효기간이 경과한 미사용
						쿠폰(관람권)의 경우, 지난 3개월 내역만 보유(등록)내역에서 확인하실 수 있습니다.<br> 기타 문의사항이
						있으실 경우, 1544-1122 또는 홈페이지 고객의 말씀을 통해 문의하여 주시기 바랍니다.

					</div>
				</div>
			</div>
		</div>

	</main>
	<footer>
		<!-- -->
	</footer>
</body>
</html>