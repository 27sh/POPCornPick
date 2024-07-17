<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지점별 관람관 목록</title>
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
	box-sizing:border-box;
}

.sidebar-box2 p:nth-child(3) a{
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
	margin-bottom: 50px;
}

#resultCinemaName{
 	color: #816bff;
 	margin-bottom: 20px;
	font-weight: 700;
	font-size: 22px;
}

#cinemaRoomList{
	width:100%;
}

#cinemaRoomList .table{
	width:100%;
	margin:0 auto;
	
}
#cinemaRoomList .table .roomTypeNo{
	width:100px;
}

#cinemaRoomList .table .smallType .seatState .detailButton{
	width:100px;
}

#cinemaRoomList{
	text-align: center;
}
</style>
</head>
<%@ include file="../layout/adminHeader.jsp"%>
<body>
	<main>
		<div class="sidebar-container">
			<%@ include file="../layout/cinemaSideBar.jsp"%>
		</div>
		<div id="container">
			<h2>지점별 상영관 관리</h2>
			<select id="cinemaLocation" name="cinemaLocation" required>
				<option value="all" selected>지역선택</option>
				<option value="seoul">서울</option>
				<option value="gyeonggi_incheon">경기/인천</option>
				<option value="chungcheong_daejeon">충청/대전</option>
				<option value="jeonla_gwangju">전라/광주</option>
				<option value="gyeongbuk_daegu">경북/대구</option>
				<option value="gyeongnam_busan_ulsan">경남/부산/울산</option>
				<option value="gangwon">강원</option>
				<option value="jeju">제주</option>
			</select>
			<select id="cinemaName" name="cinemaName" required></select>
			<div id="resultCinemaName"></div>
			<div id="cinemaRoomList">
				<table class="table">
					<thead>
						<tr>
							<th scope="col" class="roomTypeNo">상영관 명</th><th scope="col" class="smallType">구분</th><th scope="col" class="seatState">좌석현황</th><th scope="col" class="detailButton">관리</th>
						</tr>
					</thead>
					<tbody id="roomList">
					
					</tbody>					
				</table>
			</div>
			
			<!-- 1-1. 페이지 로딩 될 때 cinemaName 옵션 현재 존재하는 지점 목록 -->
			<!-- 1-2. 페이지 로딩 될 때 지역 옵션 미선택시 상영관을 선택해달라는 문구 -->
			<!-- 2. 지역 선택 시 지점목록 해당 지역에 관한 지점목록만 표시  -->
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		$.ajax({
			type : "GET",
			url : "http://localhost:9001/api/v1/cinema/list",
			dataType : 'json',
			success : function(data){
				let cinema = '<option value="" selected>지점선택</option>';
				for(let i = 0 ; i < data.length ; i++){
					console.log(data[i].cinemaName);
					cinema += '<option id="option'+ i +'" value="'+ data[i].cinemaName +'">'+ data[i].cinemaName +'</option>';
					$('#cinemaName').html(cinema);
				}
			},
			error : function(e){
				console.log("error : ", e);
			}
		});
		
		
		$('#cinemaName').change(function(){
			var selectedText = $(this).find('option:selected').val();
			console.log(selectedText);
			$.ajax({
				type : "GET",
				url : "http://localhost:9001/api/v1/cinema/roomDetail",
				data : {cinemaName : selectedText},
				dataType : 'json',
				success : function(data){

					if(data != null && data.length > 0){
						let table = '';

						for (let i = 0; i < data.length; i++) {
							table += '<tr>';
							table += '<td>' + data[i].roomTypeNo + '관' + '</td>';
							table += '<td>' + data[i].smallType + '</td>';
							table += '<td>' + data[i].bookedCnt + ' / ' + data[i].total + '</td>';
							table += '<td><button><a href="/cinema/roomDetail?roomNo=' + data[i].roomNo + '">자세히 보기</a></button></td>';
							table += '</tr>';
						}
						document.getElementById("roomList").innerHTML = table;
						document.getElementById("resultCinemaName").innerHTML = data[1].cinemaName;
					} else {
						document.getElementById("roomList").innerHTML = "지점을 선택해 주세요.";
					}
				},
				error : function(e){
					console.log("error : ", e);
				}
			});
			
			
		});
		
		
	});
	
// 	$(document).ready(function(){
// 		$("#cinemaLocation").change(function(){
// 			const selectedValue = $(this).val();
// 			const secondSelect = document.getElementById("cinemaName");
// 			console.log(selectedValue);
// 			$.ajax({
// 				type : "GET",
// 				url : "http://localhost:9001/api/v1/cinema/roomList",
// 				data : {
// 					cinemaLocation : selectedValue
// 				},
// 				dataType : 'json',
// 				success : function(data){
// 					$('#secondSelect').empty();
					
// 					data.forEach(function(item){
// 						console.log(item);
// 						console.log(item.cinemaName);
// 						$('#secondSelect').append($('<option>', {value:item.cinemaName, text:item.cinemaName}));
// 					});
// 				},
// 				error : function(e){
// 					console.log("error : ", e);
// 				}
// 			});
// 		});
// 	});
	</script>
</body>
</html>