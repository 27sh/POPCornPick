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
	<h1>지점별 상영관 관리</h1>
<!-- 		<select id="cinemaLocation" name="cinemaLocation" required> -->
<!-- 			<option value="all" selected>지역선택</option> -->
<!-- 			<option value="seoul">서울</option> -->
<!-- 			<option value="gyeonggi_incheon">경기/인천</option> -->
<!-- 			<option value="chungcheong_daejeon">충청/대전</option> -->
<!-- 			<option value="jeonla_gwangju">전라/광주</option> -->
<!-- 			<option value="gyeongbuk_daegu">경북/대구</option> -->
<!-- 			<option value="gyeongnam_busan_ulsan">경남/부산/울산</option> -->
<!-- 			<option value="gangwon">강원</option> -->
<!-- 			<option value="jeju">제주</option> -->
<!-- 		</select> -->
		
		<select id="cinemaName" name="cinemaName" required>
		</select>
		<!-- 1-1. 페이지 로딩 될 때 cinemaName 옵션 현재 존재하는 지점 목록 -->
		<!-- 1-2. 페이지 로딩 될 때 지역 옵션 미선택시 상영관을 선택해달라는 문구 -->
		<!-- 2. 지역 선택 시 지점목록 해당 지역에 관한 지점목록만 표시  -->
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
				let cinema = '<option value="" selected>선택</option>';
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
						let table = '<table border="1"><tr><th scope="col">관람관 명</th><th scope="col">관람관 종류</th><th scope="col">좌석현황</th><th scope="col">좌석 수정</th></tr><tbody class="table-group-divider">';

						for (let i = 0; i < data.length; i++) {
							table += '<div class="qna-list-area">';
							table += '<tr>';
							table += '<td class="listNum">' + (i + 1) + '</td>';
							table += '<td class="category">' + data[i].roomNo + '</td>';
							table += '<td><a href="/qna99/qnaDetail?cs_no='
									+ data[i].cs_no + '">' + data[i].cinemaNo
									+ '</a></td>';
							table += '<td class="listRegdate">' + data[i].roomTypeNo + '</td>';
							table += '<td class="listRegdate">' + data[i].total + '</td>';
							table += '<td class="listRegdate">' + data[i].bookedCnt + '</td>';
							table += '</tr>';
							table += '</div>';
						}
						table += '</tbody></table>';

						document.getElementById("qnaList").innerHTML = table;
					} else {
						document.getElementById("qnaNull").innerHTML = "문의 내역이 없습니다.";
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