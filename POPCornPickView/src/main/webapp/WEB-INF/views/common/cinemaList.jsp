<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
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
	border: 1px solid #ccc;
	box-sizing:border-box;
}

.sidebar-box1 p:nth-child(3) a{
	color: #816bff !important;
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
			<h1>지점 관리</h1>
			<!-- 극장 검색 기능 구현예정 -->
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
			</form>
			
			<!-- 카테고리 미선택시 전체 지점 리스트 출력 -->
			<div id="cinemaList"></div>
			<div id="cinemaListNull"></div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			if(this.readyState == 4 && this.status == 200){
				const data = JSON.parse(this.responseText);
				console.log(data);
				if(data != null && data.length > 0){
					let table = '<table border="1"><tr><th scope="col">번호</th><th scope="col">지역</th><th scope="col">지점명</th><th scope="col">지점 대표 연락처</th></tr><tbody>';
					for(let i = 0 ; i < data.length ; i++){
						table += '<div>';
						table += '<tr>';
						table += '<td>' + (i + 1) + '</td>';
						table += '<td>' + data[i].cinemaLocation + '</td>';
						table += '<td><a href="/cinema/detail?cinemaNo='+ data[i].cinemaNo +'">' + data[i].cinemaName + '</a></td>';
						table += '<td>' + data[i].cinemaTel + '</td>';
						table += '</tr>';
						table += '</div>';
					}
					table += '</tbody></table>';
					document.getElementById("cinemaList").innerHTML = table;
				} else{
					document.getElementById("cinemaListNull").innerHTML = table;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		
		xhttp.open("GET", "http://localhost:9001/api/v1/cinema/list", true);
		xhttp.send();
	});
	</script>
</body>
</html>