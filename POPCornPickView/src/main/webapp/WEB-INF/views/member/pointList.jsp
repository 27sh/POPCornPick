<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람권/할인쿠폰 관리</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
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

#have-high-box-title {
    font-weight: bold;
    color: #a6a6a6;
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

#have-row-box {
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

#have-table tbody tr td:nth-child(2) {
	font-weight: bold;
    color: #0087ff;
}
</style>
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
                <h2 id="coupon-title">포인트 관리</h2>
                <div id="have-coupon-container">
                    <div id="have-high-box">
                        <p id="have-high-box-title">팝콘픽이용 / 포인트 적립 및 사용내역</p>
                    </div>
                    <div id="have-row-box">
                        <table id="have-table">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>사용가능 포인트</td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="use-coupon-container">
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
                                    <th>구매 구분</th>
                                    <th>적립일</th>
                                    <th>분류</th>
                                    <th>포인트</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- 결과 데이터는 여기서 추가됩니다. -->
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="coupon-etc-container">
                    <div id="etc-left-box">이용안내</div>
                    <div id="etc-right-box">
                        전체 포인트 적립 및 사용내역, 보너스 포인트, 선물포인트, 소멸포인트 정보는 홈페이지에서 조회하실 수 있습니다.
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<footer>
    <!-- footer 내용 -->
</footer>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const today = new Date();
    const oneMonthAgo = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());

    function toSimpleDate(date) {
        return date.toISOString().split('T')[0];
    }

    function setDateRange(startDate, endDate) {
        document.getElementById('start-date').value = toSimpleDate(startDate);
        document.getElementById('end-date').value = toSimpleDate(endDate);
        console.log(`Updated start-date to ${document.getElementById('start-date').value}`);
        console.log(`Updated end-date to ${document.getElementById('end-date').value}`);
    }

    setDateRange(oneMonthAgo, today);

    document.getElementById('fast-btn-2w').addEventListener('click', function () {
        const twoWeeksAgo = new Date(today);
        twoWeeksAgo.setDate(today.getDate() - 14);
        setDateRange(twoWeeksAgo, today);
    });

    document.getElementById('fast-btn-1m').addEventListener('click', function () {
        const oneMonthAgo = new Date(today);
        oneMonthAgo.setMonth(today.getMonth() - 1);
        setDateRange(oneMonthAgo, today);
    });

    document.getElementById('fast-btn-3m').addEventListener('click', function () {
        const threeMonthsAgo = new Date(today);
        threeMonthsAgo.setMonth(today.getMonth() - 3);
        setDateRange(threeMonthsAgo, today);
    });

    const token = localStorage.getItem("jwtToken");
    if (!token) {
        console.error("No token found in localStorage");
        return;
    }

    function fetchAndSetTotalPoints() {
        fetch("http://localhost:9001/api/v1/myPage/totalPoints", {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            document.querySelector("#have-table tbody tr td:nth-child(2)").textContent = data + "점";
        })
        .catch(error => console.error("Error fetching total points:", error));
    }

    fetchAndSetTotalPoints();

    function fetchAndDisplayPoints() {
        fetch("http://localhost:9001/api/v1/myPage/points", {
            method: "GET",
            headers: {
                "Authorization": "Bearer " + token
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            const startDate = document.getElementById('start-date').value;
            const endDate = document.getElementById('end-date').value;

            console.log(`Filtering points from ${startDate} to ${endDate}`);

            const filteredData = data.filter(point => {
                const pointDate = new Date(point.regdate.split('T')[0]);
                return pointDate >= new Date(startDate) && pointDate <= new Date(endDate);
            });

            const tbody = document.querySelector("#use-result-table tbody");
            tbody.innerHTML = '';

            filteredData.forEach(point => {
                const row = document.createElement('tr');

                const purchaseTypeCell = document.createElement('td');
                purchaseTypeCell.textContent = point.pointType;
                row.appendChild(purchaseTypeCell);

                const regDateCell = document.createElement('td');
                regDateCell.textContent = point.regdate.split('T')[0];
                row.appendChild(regDateCell);

                const categoryCell = document.createElement('td');
                categoryCell.textContent = point.acheive ? '적립' : '사용';
                categoryCell.style.color = point.acheive ? '#0087ff' : '#ff3a3a';
                row.appendChild(categoryCell);

                const pointCell = document.createElement('td');
                pointCell.textContent = point.acheive || point.pointUse;
                row.appendChild(pointCell);

                tbody.appendChild(row);
            });
        })
        .catch(error => console.error("Error fetching points:", error));
    }

    document.getElementById('find-btn').addEventListener('click', fetchAndDisplayPoints);

    // Initial fetch and display points
    fetchAndDisplayPoints();
});
</script>

</body>
</html>
