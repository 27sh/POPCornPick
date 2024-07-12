<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람관 등록</title>
<style>
main {
	width: 1200px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	box-sizing:border-box;
}

.sidebar-box2 p:nth-child(2) a{
	color: #816bff !important;
}

h2 {
	margin-bottom: 20px;
	font-weight: 400;
	font-size: 22px;
}

input[name="roomTotalRow"]{
	width: 460px;
	height: 50px;
	border: 1px solid #dadada;
	border-radius: 0;
	box-sizing: border-box;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	margin-bottom: 20px;
}

input[name="roomTotalColumn"]{
	width: 460px;
	height: 50px;
	border: 1px solid #dadada;
	border-radius: 0;
	box-sizing: border-box;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	margin-bottom: 20px;
}

label b{
	display: inline-block;
	width: 160px;
	font-weight: 500;
}

label b span{
	color: red;
	font-weight: 400;
	padding-left: 8px;
	font-size: 14px;
}

select {
	width: 150px;
	height: 35px;
	border: 1px solid #ccc;
	color: #666;
	font-family: "Pretendard Variable", Pretendard;
	margin-bottom: 20px;
}

#submitWrite {
	padding: 15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background: #816bff;
	border: 1px solid #816bff;
	color:#fff;
	margin-left: 300px;
}



</style>
</head>
<body>
	<header>
		<%@ include file="../layout/adminHeader.jsp"%>
	</header>
	<main>
		<div class="sidebar-container">
			<%@ include file="../layout/cinemaSideBar.jsp"%>
		</div>
		<div id="container">
			<h2 id="big-title">관람관 관리</h2>
			<form id="roomForm">
				<label for="bigType"><b>대분류<span>*</span></b></label>
				<select id="bigType" name="bigType" required onchange="updateSmallType()">
					<option value="" disabled selected>선택</option>
					<option value="일반관">일반관</option>
					<option value="특별관">특별관</option>
				</select>
				<br>
				<label for="smallType"><b>소분류<span>*</span></b></label>
				<select id="smallType" name="smallType" required>
					<option value="" disabled selected>선택</option>
					<option value="4DX">4DX</option>
					<option value="IMAX">IMAX</option>
					<option value="PRIVATE BOX">PRIVATE BOX</option>
				</select>
				<br>
				<label for="roomName"><b>상영관 이름<span>*</span></b></label>
				<select id="roomName" name="roomName" required>
					<option value="" disabled selected>선택</option>
					<option value="1">1관</option>
					<option value="2">2관</option>
					<option value="3">3관</option>
					<option value="4">4관</option>
					<option value="5">5관</option>
					<option value="6">6관</option>
				</select>
				<br>
				<label for="roomTotalRow"><b>관람관 총 행<span>*</span></b></label>
				<input type="number" name="roomTotalRow"><br>
				<label for="roomTotalColumn"><b>관람관 총 열<span>*</span></b></label>
				<input type="number" name="roomTotalColumn"><br>
				<input type="button" id="submitWrite" value="상영관 등록하기" onclick="submitRoomForm(event)">
			</form>
		</div>
	</main>
	<footer>
	
	</footer>
	
	<script>
		function updateSmallType(){
			var bigType = document.getElementById("bigType").value;
			var smallType = document.getElementById("smallType");
			console.log(bigType);
			
			if(bigType === "특별관"){
				smallType.innerHTML = `<option value="" disabled selected>선택</option> <option value="4DX">4DX</option> <option value="IMAX">IMAX</option> <option value="PRIVATE BOX">PRIVATE BOX</option>`;
			} else if(bigType === "일반관"){
				smallType.innerHTML = `<option value="*" disabled selected>*</option>`;
			} else{
				smallType.innerHTML = `<option value="" disabled selected>선택</option>`;
			}
		}
		
		function submitRoomForm(event){
			event.preventDefault();
			const bigType1 = document.querySelector("select[name='bigType']");
			const smallType1 = document.querySelector("select[name='smallType']");
			const roomName1 = document.querySelector("select[name='roomName']");
			const roomTotalRow1 = document.querySelector("Input[name='roomTotalRow']");
			const roomTotalColumn1 = document.querySelector("Input[name='roomTotalColumn']");
			
			const roomType = {
				bigType : bigType1.value,
				smallType : smallType1.value,
				roomName : roomName1.value,
				roomTotalRow : roomTotalRow1.value,
				roomTotalColumn : roomTotalColumn1.value
			}
			
			console.log(roomType);
			
			const sendData = JSON.stringify(roomType);
			console.log("sendData : " + sendData);
			
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				if(this.status === 200){
					alert(this.responseText);
				} else{
					alert("다시 등록해주세요.");
				}
			};
			xhttp.open("POST", "http://localhost:9001/api/v1/room");
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(sendData);
		}
	</script>
</body>
</html>