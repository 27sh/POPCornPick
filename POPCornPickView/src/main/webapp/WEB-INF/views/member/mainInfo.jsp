<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 기본정보</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    #mainInfoContainer {
        background-color: #f0f0f0; /* 회색 배경 */
        padding: 20px;
        border-radius: 10px; /* 모서리 둥글게 */
        display: flex;
        flex-direction: column;
        align-items: center;
        margin: 20px 0;
        width: 1160px;
    }
    .high-container {
        display: flex; /* Flexbox 사용 */
        align-items: center; /* 수직 가운데 정렬 */
        margin-bottom: 20px; /* 아래쪽에 간격 추가 */
        width: 100%;
        justify-content: flex-start; /* 왼쪽 정렬 */
        padding: 0 20px; /* 좌우 여백 추가 */
        padding-left: 40px; /* 요소들을 오른쪽으로 이동 */
    }
    #userProfile img {
        width: 150px; /* 원하는 너비로 설정 */
        height: 150px; /* 원하는 높이로 설정 */
        border-radius: 50%; /* 원형 이미지로 만들기 */
        margin: 10px 50px;
    }
    #userName {
        display: flex; /* Flexbox 사용 */
        flex-direction: column; /* 세로 정렬 */
        justify-content: center; /* 세로 가운데 정렬 */
    }
    #userName .name {
        font-size: 35px;
        font-weight: bold; /* 굵게 설정 */
        padding-top: 10px;	
    }
    #userName p {
        margin: 0; /* 기본 마진 제거 */
        padding-bottom: 5px;
    }
    #userId {
        position: relative; /* 위치 조정 */
        top: 10px; /* 아래로 10px 이동 */
        color: gray;
    }
    .mini-container {
        display: flex; /* Flexbox 사용하여 가로 정렬 */
        gap: 10px; /* 요소들 사이의 간격 */
        width: 200px;
        position: relative; /* 상대 위치 설정 */	
    }
    .row-container {
        display: flex;
        justify-content: space-between;
        align-items: center; /* 아이템들을 수직 가운데 정렬 */
        width: 100%;
        height: 200px;
    }
    .having {
        flex: 1;
        padding: 10px;
        margin: 0 10px;
        text-align: center; /* 텍스트 가운데 정렬 */
        display: flex;
        flex-direction: column;
        justify-content: center; /* 상하 가운데 정렬 */
        align-items: center; /* 수평 가운데 정렬 */
        height: 200px;
        position: relative; /* 상대 위치 설정 */
    }
    .mainInfo-h3 {
        margin-top: 10px;
	    position: absolute;
	    top: 10px;
	    font-size: 25px;
    }
    .having:first-child .mini-container {
        margin-top: 20px;
    }
    .likeCinema {
        width: 120px;
	    height: 40px;
	    margin: 5px 0;
	    border: 2px solid #ccc;
	    align-content: center;
    }
    .mainInfo-m-divider {
        width: 800px; /* 가로 길이 */
        height: 2px; /* 세로 높이 */
        background-color: #d3d3d3; /* 회색 배경색 */
        margin: 20px 0; /* 상하 여백 */
    }
    .mainInfo-l-divier {
        width: 2px;
        height: 100px;
        background-color: #d3d3d3;
        align-self: center; /* Flex 아이템을 수직 가운데 정렬 */
    }
    
    .mainInfo-count {
    	position: absolute;
    	right: 10px;
    	display: flex;
    }
    
    #totalPoints, #giftCardCount, #couponCount {
    	font-weight: bold;
    	margin-right: 2px;
    }
    
    #setPopcornPick {
    	cursor: pointer;
    }
    
    #setPopcornPick:hover {
	    color: rgb(248, 47, 98);
	}
</style>

<script>
        document.addEventListener("DOMContentLoaded", function() {
            const token = localStorage.getItem("jwtToken");
            if (!token) {
                console.error("No token found in localStorage");
                return;
            }

            fetch("http://localhost:9001/api/v1/myPage/info", {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token // 로컬 스토리지에 저장된 토큰을 사용하여 인증
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                document.getElementById("userId").textContent = "ID :  " + data.username;
                document.querySelector(".name").textContent = data.name;
            })
            .catch(error => console.error("Error fetching user info:", error));

            fetch("http://localhost:9001/api/v1/myPage/couponCount", {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token // 로컬 스토리지에 저장된 토큰을 사용하여 인증
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                document.getElementById("couponCount").textContent = data;
            })
            .catch(error => console.error("Error fetching coupon count:", error));

            fetch("http://localhost:9001/api/v1/myPage/giftCardCount", {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token // 로컬 스토리지에 저장된 토큰을 사용하여 인증
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                document.getElementById("giftCardCount").textContent = data;
            })
            .catch(error => console.error("Error fetching gift card count:", error));

            fetch("http://localhost:9001/api/v1/myPage/totalPoints", {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token // 로컬 스토리지에 저장된 토큰을 사용하여 인증
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                document.getElementById("totalPoints").textContent = data;
            })
            .catch(error => console.error("Error fetching total points:", error));

            fetch("http://localhost:9001/api/v1/myPage/expCinemas", {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + token // 로컬 스토리지에 저장된 토큰을 사용하여 인증
                }
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                const likeCinemaContainer = document.querySelectorAll(".likeCinema");
                likeCinemaContainer.forEach((container, index) => {
                    if (index < data.length) {
                        container.textContent = data[index].cinema.cinemaName; // Assuming cinema entity has cinemaName field
                    } else {
                        container.textContent = ""; // Clear remaining containers
                    }
                });
            })
            .catch(error => console.error("Error fetching exp cinemas:", error));

            document.getElementById("setPopcornPick").addEventListener("click", function() {
                window.location.href = "/memberCinema/cinemaPage";
            });
        });
    </script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<main>
    <div id="mainInfoContainer">
        <div class="high-container">
            <div id="userProfile">
                <img src="/img/profile.jpg" alt="유저 프로필 사진"> <!-- 유저 프로필 사진 삽입 -->
            </div>
            <div id="userName">
                    <p class="name"></p>
                    <p id="userId"></p>
                <div class="mainInfo-m-divider"></div> <!-- 회색 줄 추가 -->
            </div>
        </div>
        <div class="row-container">
            <div class="having">
                <h3 class="mainInfo-h3">MY COUPON</h3>
                <div class="mini-container">
                    <p>할인쿠폰</p>
                    <div class="mainInfo-count">
                    	<p id="couponCount"></p>
                    	개
                    </div>
                </div>
            </div>
            <div class="mainInfo-l-divier"></div>
            <div class="having">
                <h3 class="mainInfo-h3">POINT</h3>
                <div class="mini-container">
                    <p>사용가능 포인트</p>
                    <div class="mainInfo-count">
                    	<p id="totalPoints"></p>
                    	점
                    </div>
                </div>
            </div>
            <div class="mainInfo-l-divier"></div>
            <div class="having">
                <div class="likeCinema"></div>
                <div class="likeCinema"></div>
                <div class="likeCinema"></div>
                <p id="setPopcornPick">자주가는 팝콘픽 설정하기 ➧ </p>
            </div>
        </div>
    </div>
</main>

</body>
</html>
