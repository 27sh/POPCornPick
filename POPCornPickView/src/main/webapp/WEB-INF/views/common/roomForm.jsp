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
	min-height: 700px;
	border:1px solid #eee;
}

</style>
</head>
<body>
	<header>
		<%@ include file="../layout/adminHeader.jsp"%>
	</header>
	<main>
	<h1>관람관 관리</h1>
	<hr>
	<form id="roomForm">
		<label for="bigType">대분류</label>
		<select id="bigType" name="bigType" required onchange="updateSmallType()">
			<option value="" disabled selected>선택</option>
			<option value="일반관">일반관</option>
			<option value="특별관">특별관</option>
		</select>
		
		<label for="smallType">소분류</label>
		<select id="smallType" name="smallType" required>
			<option value="" disabled selected>선택</option>
			<option value="4DX">4DX</option>
			<option value="IMAX">IMAX</option>
			<option value="PRIVATE BOX">PRIVATE BOX</option>
		</select>
		
		<label for="roomName">관</label>
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
		관람관 총 행 수: <input type="number" name="roomTotalRow"><br>
		관람관 총 열 수: <input type="number" name="roomTotalColumn"><br>
		<input type="button" value="상영관 등록하기" onclick="submitRoomForm(event)">
	</form>
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