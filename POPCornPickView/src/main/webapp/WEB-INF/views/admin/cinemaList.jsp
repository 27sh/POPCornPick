<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
main {
	width: 1200px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width: 740px;
	margin: 0 auto;
	min-height: 700px;
	background: #fff;
}

.sidebar-box1 p:nth-child(3) a{
	color: #816bff !important;
}

h2{
	margin-bottom: 20px;
	font-weight: 600;
	font-size: 22px;
}

table, tr, th, td{
	border-collapse:collapse;
	border:1px solid #eee;
	border-right:0;
	border-left:0;
	padding:20px;
	text-align:center;
}

select {
	width: 150px;
	height: 35px;
	border: 1px solid #ccc;
	color: #666;
	font-family: "Pretendard Variable", Pretendard;
	margin-bottom: 20px;
}

#cinemaList{
	width:100%;
}
#cinemaList .table{
	width:100%;
	margin:0 auto;
	
}
#cinemaList .table .listNum{
	width:40px;
	color:#777;
}
#cinemaList .table .cinemaLocation{
	width:100px;
	font-size:13px;
	color:#666;
}
#cinemaList .table .cinemaTel{
	width:85px;
	font-size:13px;
	color:#aaa;
}

#cinemaListNull{
	text-align: center;
	margin: 20px;
	font-weight: 400;
	font-size: 15px;
}

#searchBox{
	width: 150px;
	height: 35px;
	border: 1px solid #ccc;
	color: #666;
	font-family: "Pretendard Variable", Pretendard;
	margin-bottom: 20px;
	margin-left: 5px;
}

#searchSubmit{
	width: 50px;
	height: 35px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 5px;
	background: #816bff;
	border: 1px solid #816bff;
	color:#fff;
}


</style>
</head>
<body>
<%@ include file="../layout/adminHeader.jsp"%>
	<main>
		<div class="sidebar-container">
			<%@ include file="../layout/cinemaSideBar.jsp"%>
		</div>
		<div id="container">
			<h2>지점 관리</h2>
			<!-- 극장 검색 기능 구현예정 -->
			<select id="cinemaLocation" name="cinemaLocation" required onchange="seletedLocationList()">
				<option value="" disabled selected>지역</option>
				<option value="서울">서울</option>
				<option value="경기/인천">경기/인천</option>
				<option value="충청/대전">충청/대전</option>
				<option value="전라/광주">전라/광주</option>
				<option value="경북/대구">경북/대구</option>
				<option value="경남/부산/울산">경남/부산/울산</option>
				<option value="강원">강원</option>
				<option value="제주">제주</option>
			</select>
			<input type="text" id="searchBox" name="searchBox" placeholder="지점명 검색...">
			<button id="searchSubmit" onclick="searchResult()">검색</button>
			
			<!-- 카테고리 미선택시 전체 지점 리스트 출력 -->
			<div id="cinemaList">
			
			</div>
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
					let table = '<table class="table"><tr><th scope="col">번호</th><th scope="col">지역</th><th scope="col">지점명</th><th scope="col">지점 대표 연락처</th></tr><tbody>';
					for(let i = 0 ; i < data.length ; i++){
						table += '<tr>';
						table += '<td class="listNum">' + (i + 1) + '</td>';
						table += '<td>' + data[i].cinemaLocation + '</td>';
						table += '<td><a href="/cinema/detail?cinemaNo='+ data[i].cinemaNo +'">' + data[i].cinemaName + '</a></td>';
						table += '<td>' + data[i].cinemaTel + '</td>';
						table += '</tr>';
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
		xhttp.open("GET", "http://localhost:9001/api/v1/admin/cinema/list", true);
		xhttp.send();
	});
	
	function seletedLocationList(){
		document.getElementById("cinemaListNull").innerHTML = "";

		var selectedLocation = document.getElementById("cinemaLocation").value;
		
		console.log(selectedLocation);
		
		$.ajax({
			type : "GET",
			enctype : 'application/json',
			url : "http://localhost:9001/api/v1/admin/cinema/choiceList",
			data : {
				cinemaLocation : selectedLocation
			},
			dataType : 'json',
			success : function(data){
				console.log("data: ", data)
				if(data != null && data.length > 0){
					let table = '<table class="table"><tr><th scope="col">번호</th><th scope="col">지역</th><th scope="col">지점명</th><th scope="col">지점 대표 연락처</th></tr><tbody>';
					for(let i = 0 ; i < data.length ; i++){
						table += '<tr>';
						table += '<td class="listNum">' + (i + 1) + '</td>';
						table += '<td>' + data[i].cinemaLocation + '</td>';
						table += '<td><a href="/cinema/detail?cinemaNo='+ data[i].cinemaNo +'">' + data[i].cinemaName + '</a></td>';
						table += '<td>' + data[i].cinemaTel + '</td>';
						table += '</tr>';
					}
					table += '</tbody></table>';
					document.getElementById("cinemaList").innerHTML = table;
				} else if(data.length == 0){
					let table = '<table class="table"><tr><th scope="col">번호</th><th scope="col">지역</th><th scope="col">지점명</th><th scope="col">지점 대표 연락처</th></tr><tbody>';
					document.getElementById("cinemaList").innerHTML = table;
					document.getElementById("cinemaListNull").innerHTML = "해당 지역에 지점이 존재하지 않습니다.";
				}
			},
			error : function(e){
			}
		});
	}
	
// 	function searchResult(){
// 		const searchContent = document.getElementById("searchBox").value;
// 		var blank = /[\s]/g;
// 		console.log(searchContent);
// 		if(blank.test(searchContent) == true){
// 			alert("공백을 사용할 수 없습니다.");
// 		} else if(searchContent.length == 0 || searchContent == ' '){
// 			alert("검색 내용을 입력해주세요.");
// 		} else{
// 			$.ajax({
// 				type : "GET",
// 				enctype : 'application/json',
// 				url : "http://localhost:9001/api/v1/admin/cinema/searchResult",
// 				data : {
// 					searchContent : searchContent
// 				},
// 				dataType : 'json',
// 				success : function(data){
// 					console.log("data: ", data)
// 					if(data != null && data.length > 0){
						
// 					} else if(data.length == 0){
// 					}
// 				},
// 				error : function(e){
// 				}
// 			});
// 		}
// 	}
	</script>
</body>
</html>