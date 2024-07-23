<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람권/할인쿠폰 관리</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
#main-content {
	width: 100%;
}

#full-container {
    display: flex;
    width: 100%;
}

#sidebar-container {
	width: 200px;
	background-color: #f4f4f4;
	padding: 10px;
}

#container {
	flex: 1;
	padding: 10px;
}

#coupon-container {
	padding: 10px;
}

#have-coupon-container {
	padding: 10px;
}

#have-high-box {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px 0;
}

#use-coupon-container {
	padding: 10px;
}

#use-filter {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 30px;
    border: 1px solid;
    background-color: #f9f9f9;
    margin: 20px 0;
}

#filter-text {
    font-weight: bold;
    padding-left: 20px;
}

#fast-button {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

#find-btn {
	background-color: #2d2d2d;
    color: white;
    font-size: 12px;
    text-align: center;
    height: 30px;
    align-content: center;
    font-weight: bold;
    cursor: pointer;
    width: 80px;
}

#coupon-etc-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
	padding: 50px 0;
	border: 1px solid #999;
    margin: 10px;
    argin-top: 50px;
}

#etc-left-box {
    width: 150px;
    padding: 20px;
}

#etc-right-box {
	margin-left: 20px;
    padding: 0 30px;
    font-size: 13px;
    color: #a7a7a7;
}

#etc-right-box {
    margin-left: 20px;
    border-left: 1px solid #ccc;
}

#coupon-title {
	margin-bottom: 30px;
}

#have-high-box-title, #use-high-box-title{
	font-weight: bold;
    color: #a6a6a6;
}

#coupon-regi-btn{
	background-color: #2d2d2d;
    color: white;
    font-size: 12px;
    width: 140px;
    text-align: center;
    height: 30px;
    align-content: center;
    font-weight: bold;
    cursor: pointer;
}

table {
    width: 100%;
    border-collapse: collapse;
}

thead {
    background-color: #f0f0f0;
}

thead th {
    text-align: center;
    padding: 10px;
    border-bottom: 1px solid #ddd;
    color: #999;
}

tbody td {
    text-align: center;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

#have-row-box{
	padding-top: 10px;
    padding-bottom: 20px;
}
#mid-context {
	width: 600px;
	margin-left: 100px;
}
.fast-btn-ele {
	background-color: transparent;
    border: 1px solid #999;
    width: 60px;
    height: 20px;
    margin-right: 10px;
    color: gray;
    cursor: pointer;
}
.select-date {
	width: 200px;
    height: 30px;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function () {
    // 오늘 날짜와 1개월 전 날짜를 구합니다.
    const today = new Date();
    const oneMonthAgo = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

    // ISO 문자열을 기반으로 'YYYY-MM-DD' 형식으로 변환합니다.
    function toSimpleDate(isoString) {
        return isoString.slice(0, 10);  // 'YYYY-MM-DD' 부분만 잘라내기
    }

    // 원본 날짜 객체와 ISO 문자열을 콘솔에 출력합니다.
    console.log('Today (raw):', today);
    console.log('One month ago (raw):', oneMonthAgo);
    console.log('Today (ISO):', today.toISOString());
    console.log('One month ago (ISO):', oneMonthAgo.toISOString());

    // 계산된 날짜 값을 콘솔에 출력합니다.
    const formattedToday = toSimpleDate(today.toISOString());
    const formattedOneMonthAgo = toSimpleDate(oneMonthAgo.toISOString());
    console.log('Today (formatted):', formattedToday);
    console.log('One month ago (formatted):', formattedOneMonthAgo);

    // 입력 필드에 기본 날짜를 설정합니다.
    document.getElementById('start-date').value = formattedOneMonthAgo;
    document.getElementById('end-date').value = formattedToday;

    // 버튼 클릭 이벤트 핸들러 추가
    document.getElementById('fast-btn-2w').addEventListener('click', function () {
        const twoWeeksAgo = new Date();
        twoWeeksAgo.setDate(today.getDate() - 14);
        document.getElementById('start-date').value = toSimpleDate(twoWeeksAgo.toISOString());
    });

    document.getElementById('fast-btn-1m').addEventListener('click', function () {
        const oneMonthAgo = new Date();
        oneMonthAgo.setMonth(today.getMonth() - 1);
        document.getElementById('start-date').value = toSimpleDate(oneMonthAgo.toISOString());
    });

    document.getElementById('fast-btn-3m').addEventListener('click', function () {
        const threeMonthsAgo = new Date();
        threeMonthsAgo.setMonth(today.getMonth() - 3);
        document.getElementById('start-date').value = toSimpleDate(threeMonthsAgo.toISOString());
    });

    // fetch 요청을 보내기 위한 함수
    function fetchData() {
        fetch('http://localhost:9001/api/v1/myPage/having', {
            method: 'GET',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('jwtToken')
            }
        })
        .then(response => response.json())
        .then(data => {
            // 응답 데이터를 확인하기 위해 콘솔에 출력
            console.log('Response data:', data);

            const coupons = data[0];
            const giftCards = data[1];
            const haveTableBody = document.querySelector('#have-table tbody');
            const useResultTableBody = document.querySelector('#use-result-table tbody');

            console.log('Coupons:', coupons);
            console.log('GiftCards:', giftCards);

            // 기존 테이블 내용을 비웁니다.
            haveTableBody.innerHTML = '';
            useResultTableBody.innerHTML = '';

            // 쿠폰 데이터를 테이블에 삽입
            coupons.forEach(coupon => {
                if (!coupon.moddate) { // moddate가 없는 경우에만 처리
                    const row = document.createElement('tr');

                    const issueNoCell = document.createElement('td');
                    issueNoCell.textContent = coupon.issueNo;
                    row.appendChild(issueNoCell);

                    const typeCell = document.createElement('td');
                    typeCell.textContent = '미사용';
                    row.appendChild(typeCell);

                    const expiryDateCell = document.createElement('td');
                    expiryDateCell.textContent = coupon.couponNo ? toSimpleDate(new Date(coupon.couponNo.endDate).toISOString()) : 'N/A';
                    row.appendChild(expiryDateCell);

                    const descriptionCell = document.createElement('td');
                    descriptionCell.textContent = coupon.couponNo ? coupon.couponNo.couponName : 'N/A';
                    row.appendChild(descriptionCell);

                    haveTableBody.appendChild(row);
                } else { // moddate가 있는 경우에 처리
                    const row = document.createElement('tr');

                    const nameCell = document.createElement('td');
                    nameCell.textContent = coupon.couponNo ? coupon.couponNo.couponName : 'N/A';
                    row.appendChild(nameCell);

                    const numberCell = document.createElement('td');
                    numberCell.textContent = coupon.issueNo;
                    row.appendChild(numberCell);

                    const typeCell = document.createElement('td');
                    typeCell.textContent = '쿠폰';
                    row.appendChild(typeCell);

                    const extraCell = document.createElement('td');
                    extraCell.textContent = '일반';
                    row.appendChild(extraCell);

                    const statusCell = document.createElement('td');
                    statusCell.textContent = '사용';
                    row.appendChild(statusCell);

                    const useDateCell = document.createElement('td');
                    useDateCell.textContent = toSimpleDate(new Date(coupon.moddate).toISOString());
                    row.appendChild(useDateCell);

                    useResultTableBody.appendChild(row);
                }
            });

            // 영화 관람권 데이터를 테이블에 삽입
            giftCards.forEach(giftCard => {
                if (!giftCard.moddate) { // moddate가 없는 경우에만 처리
                    const row = document.createElement('tr');

                    const giftCardNoCell = document.createElement('td');
                    giftCardNoCell.textContent = giftCard.giftCardNo;
                    row.appendChild(giftCardNoCell);

                    const typeCell = document.createElement('td');
                    typeCell.textContent = '미사용';
                    row.appendChild(typeCell);

                    const expiryDateCell = document.createElement('td');
                    expiryDateCell.textContent = giftCard.product ? toSimpleDate(new Date(giftCard.product.productEndDate).toISOString()) : 'N/A';
                    row.appendChild(expiryDateCell);

                    const descriptionCell = document.createElement('td');
                    descriptionCell.textContent = giftCard.product ? giftCard.product.productName : 'N/A';
                    row.appendChild(descriptionCell);

                    haveTableBody.appendChild(row);
                } else { // moddate가 있는 경우에 처리
                    const row = document.createElement('tr');

                    const nameCell = document.createElement('td');
                    nameCell.textContent = giftCard.product ? giftCard.product.productName : 'N/A';
                    row.appendChild(nameCell);

                    const numberCell = document.createElement('td');
                    numberCell.textContent = giftCard.giftCardNo;
                    row.appendChild(numberCell);

                    const typeCell = document.createElement('td');
                    typeCell.textContent = '영화관람권';
                    row.appendChild(typeCell);

                    const extraCell = document.createElement('td');
                    extraCell.textContent = '일반';
                    row.appendChild(extraCell);

                    const statusCell = document.createElement('td');
                    statusCell.textContent = '사용';
                    row.appendChild(statusCell);

                    const useDateCell = document.createElement('td');
                    useDateCell.textContent = toSimpleDate(new Date(giftCard.moddate).toISOString());
                    row.appendChild(useDateCell);

                    useResultTableBody.appendChild(row);
                }
            });
        })
        .catch(error => console.error('Error:', error));
    }

    // 페이지 로드 시 데이터 가져오기
    fetchData();

    // 조회 버튼 클릭 이벤트 핸들러 추가
    document.getElementById('find-btn').addEventListener('click', function () {
        const startDate = new Date(document.getElementById('start-date').value);
        const endDate = new Date(document.getElementById('end-date').value);

        fetch('http://localhost:9001/api/v1/myPage/having', {
            method: 'GET',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('jwtToken')
            }
        })
        .then(response => response.json())
        .then(data => {
            const useResultTableBody = document.querySelector('#use-result-table tbody');

            // 기존 테이블 내용을 비웁니다.
            useResultTableBody.innerHTML = '';

            // 쿠폰 데이터를 필터링하여 테이블에 삽입
            data[0].forEach(coupon => {
                const moddate = new Date(coupon.moddate);
                if (moddate >= startDate && moddate <= endDate) {
                    const row = document.createElement('tr');

                    const nameCell = document.createElement('td');
                    nameCell.textContent = coupon.couponNo ? coupon.couponNo.couponName : 'N/A';
                    row.appendChild(nameCell);

                    const numberCell = document.createElement('td');
                    numberCell.textContent = coupon.issueNo;
                    row.appendChild(numberCell);

                    const typeCell = document.createElement('td');
                    typeCell.textContent = '쿠폰';
                    row.appendChild(typeCell);

                    const extraCell = document.createElement('td');
                    extraCell.textContent = '일반';
                    row.appendChild(extraCell);

                    const statusCell = document.createElement('td');
                    statusCell.textContent = '사용';
                    row.appendChild(statusCell);

                    const useDateCell = document.createElement('td');
                    useDateCell.textContent = toSimpleDate(new Date(coupon.moddate).toISOString());
                    row.appendChild(useDateCell);

                    useResultTableBody.appendChild(row);
                }
            });

            // 영화 관람권 데이터를 필터링하여 테이블에 삽입
            data[1].forEach(giftCard => {
                const moddate = new Date(giftCard.moddate);
                if (moddate >= startDate && moddate <= endDate) {
                    const row = document.createElement('tr');

                    const nameCell = document.createElement('td');
                    nameCell.textContent = giftCard.product ? giftCard.product.productName : 'N/A';
                    row.appendChild(nameCell);

                    const numberCell = document.createElement('td');
                    numberCell.textContent = giftCard.giftCardNo;
                    row.appendChild(numberCell);

                    const typeCell = document.createElement('td');
                    typeCell.textContent = '영화관람권';
                    row.appendChild(typeCell);

                    const extraCell = document.createElement('td');
                    extraCell.textContent = '일반';
                    row.appendChild(extraCell);

                    const statusCell = document.createElement('td');
                    statusCell.textContent = '사용';
                    row.appendChild(statusCell);

                    const useDateCell = document.createElement('td');
                    useDateCell.textContent = toSimpleDate(new Date(giftCard.moddate).toISOString());
                    row.appendChild(useDateCell);

                    useResultTableBody.appendChild(row);
                }
            });
        })
        .catch(error => console.error('Error:', error));
    });
});
</script>
</head>
<body>
	<main>
		<%@ include file="./mainInfo.jsp"%>

		<div id="full-container">
			<div class="sidebar-container">
				<%@ include file="./sideMenu.jsp"%>
			</div>
			<div id="container">
				<div id="coupon-container">
					<h2 id="coupon-title">관람권/할인쿠폰 관리</h2>
					<div id="have-coupon-container">
						<div id="have-high-box">
							<p id="have-high-box-title">관람권/할인쿠폰 보유(등록) 내역</p>
							<a href="/myPage/registCouponForm" id="coupon-regi-btn">관람권/할인쿠폰 등록</a>
						</div>
						<div id="have-row-box">
							<table id="have-table">
								<thead>
									<tr>
										<th>상품 번호</th>
										<th>분류</th>
										<th>유효기간</th>
										<th>설명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
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
									<button class="fast-btn-ele" id="fast-btn-2w">2주일</button>
									<button class="fast-btn-ele" id="fast-btn-1m">1개월</button>
									<button class="fast-btn-ele" id="fast-btn-3m">3개월</button>
									<p style="color: #999; font-size: 13px;">3개월 이전의 내역은 자동 삭제됩니다.</p>
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
										<th>상품명</th>
										<th>상품 번호</th>
										<th>분류</th>
										<th>기타</th>
										<th>상태</th>
										<th>사용일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="coupon-etc-container">
						<div id="etc-left-box">이용안내</div>
						<div id="etc-right-box">
							영화관람권은 금액권이 아닙니다. (모닝영화/청소년 관람 시 차액환급 불가)<br> 영화관람권 이용 시
							추가금액 결제 후 특별관 영화 관람은 불가합니다.<br> 특정영화 관람권일 경우, 지정영화 상영기간 또는
							사용기간 중에만 사용이 가능 합니다.<br> 극장 현장 매표소와 홈페이지 인터넷 예매 시 사용 가능하며,
							스크래치 부분을 개봉 또는 훼손 시 현장 사용이 불가능합니다.<br><br> 영화 예매 시에는 다른
							결제수단(신용카드, 예매쿠폰, 계좌이체 등)과 병행하여 사용이 가능합니다.<br> (단, 2매 이상 구매하실
							경우에 한합니다. 2장 예매 시 1매는 영화예매권으로 결제, 다른 1장은 타 결제수단으로 결제) 홈페이지 예매 후
							예매취소는 홈페이지에서 상영시간 20분 전까지 가능합니다.<br> 취소 시 현금 환불은 되지 않으며, 기존
							영화관람권으로 사용기간 중에 재사용 하실 수 있습니다.<br> (단, 현장취소 시 기존의 영화관람권으로
							재사용이 가능하며, 현장 구매 티켓은 환불이 불가능하며 현장 교환만 가능합니다.)<br><br> 영화관람권은 현금으로 환불이 되지
							않습니다.<br> 일반관에서 상영하는 영화의 입장권 1매로 교환하실 수 있습니다.<br>
							(IMAX, Dolby 상영관 이용관 이용불가 및 3D, 4D 영화 제외)<br> 영화관람권으로 예매 시,
							포인트 적립은 되지 않습니다.<br> 영화관람권 앞면에 기재된 사용기한까지(관람일 기준) 사용하실 수
							있습니다.<br> 유효기간이 경과한 미사용 쿠폰(관람권)의 경우, 지난 3개월 내역만 보유(등록)내역에서
							확인하실 수 있습니다.<br> 기타 문의사항이 있으실 경우, 1544-1122 또는 홈페이지 고객의 말씀을
							통해 문의하여 주시기 바랍니다.

						</div>
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
