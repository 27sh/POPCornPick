<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 등록</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<style>
main {
	width: 1100px;
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
	<h1>영화관 등록</h1>
	<hr>
	<!-- 영화관 등록 -->
	<div>
	<form name="cinemaFrm">
		<input type="hidden" name="cinemaNo" id="cinemaNo">
		<label for="cinemaLocation">지역명<span>*</span></label>
		<select id="cinemaLocation" name="cinemaLocation" required>
			<option value="" disabled selected>선택</option>
			<option value="seoul">서울</option>
			<option value="gyeonggi_incheon">경기/인천</option>
			<option value="chungcheong_daejeon">충청/대전</option>
			<option value="jeonla_gwangju">전라/광주</option>
			<option value="gyeongbuk_daegu">경북/대구</option>
			<option value="gyeongnam_busan_ulsan">경남/부산/울산</option>
			<option value="gangwon">강원</option>
			<option value="jeju">제주</option>
		</select>
		<div>지점명<span>*</span></div>
		<input type="text" name="cinemaName" id="cinemaName">
		<div>주소<span>*</span></div>
		<input type="text" name="cinemaAddr" id="cinemaAddr">
		<div>전화번호<span>*</span></div>
		<input type="text" name="cinemaTel" id="cinemaTel">
		<div>대표 이미지<span>*</span></div>
		<input type="file" id="cinemaImg" name="cinemaImg">
		<div>중요공지</div>
		<input type="text" name="cinemaIntro" id="cinemaIntro"><br>
		<input type="button" id="submitWrite" value="영화관 등록하기" onclick="submitCinemaForm(event)">
		<input type="button" id="submitModify" value="수정하기" onclick="submitCinemaModify(event)">
	</form>
	
	</div>
	<!-- 관람관 등록 -->
	<div>
	<div>관람관</div>
	<div id="roomList"></div>	
	</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const xhttp = new XMLHttpRequest();
		const urlParams = new URLSearchParams(window.location.search);
		let cinemaNo = urlParams.get('cinemaNo');
		
		var writeForm = $('#submitWrite');
		var modifyForm = $('#submitModify');
		
		if(cinemaNo){
			writeForm.hide();
			modifyForm.show();
			cinemaModify(cinemaNo);
		} else{
			writeForm.show();
			modifyForm.hide();
		}
		
		xhttp.onload = function() {
			if (this.readyState == 4 && this.status == 200) {
				const data = JSON.parse(this.responseText);
				console.log("data: ",data);
				if(data != null && data.length > 0){
					let table = '<table border="1">';

					for (let i = 0; i < data.length; i++) {
						table += '<div>';
						table += '<tr>';
						table += '<td>' + data[i].bigType + '</td>';
						table += '<td>' + data[i].smallType + '</td>';
						table += '<td>' + data[i].roomName + '</td>';
						table += '</tr>';
						table += '</div>';
					}
					table += '</table>';

					document.getElementById("roomList").innerHTML = table;
				} else {
					document.getElementById("roomList").innerHTML = "등록되어있는 상영관이 없습니다.";
				}
				
			} else if (this.readyState == 4 && this.status != 200) {
				alert("목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		xhttp.open("GET", "http://localhost:9001/api/v1/cinema/room", true);
		xhttp.send();
	});
	
	function submitCinemaForm(event){
		event.preventDefault();
		
		var form = document.forms['cinemaFrm'];
		var formData = new FormData(form);
		
		formData.forEach((value, key) => {
			console.log(key + " : " + value);
		});
		
		$.ajax({
			type : "POST",
			enctype : 'multipart/form-data',
			url : "http://localhost:9001/api/v1/cinema",
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			cache : false,
			success : function(data){
				alert("지점 등록이 완료되었습니다.");
				window.location.href="/cinema/list";
			},
			error : function(e){
				console.log("error : ",e );
			}
		});
	}
	
	function submitCinemaModify(event){
		event.preventDefault();
		
		var form = document.forms['cinemaFrm'];
		var formData = new FormData(form);
		
		formData.forEach((value, key) => {
			console.log(key + " : " + value);
		});
		
		$.ajax({
			type : "PUT",
			enctype : 'multipart/form-data',
			url : "http://localhost:9001/api/v1/cinema",
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			cache : false,
			success : function(data){
				alert(data);
				//alert("지점 정보 수정이 완료되었습니다.");
				//window.location.href="/cinema/list";
			},
			error : function(e){
				console.log("error : ", e);
			}
		});
	}
	
	function cinemaModify(cinemaNo){
		$.ajax({
			url : "http://localhost:9001/api/v1/cinema/detail",
			type : "GET",
			data : {
				cinemaNo : cinemaNo
			},
			success : function(data){
				$('#cinemaNo').val(data.cinemaNo);
				$('#cinemaLocation').val(data.cinemaLocation);
				$('#cinemaName').val(data.cinemaName);
				$('#cinemaAddr').val(data.cinemaAddr);
				$('#cinemaTel').val(data.cinemaTel);
				$('#cinemaIntro').val(data.cinemaIntro);
			},
			error : function(error){
				alert("정보를 불러오는데 실패했습니다. 다시 시도해 주세요.");
				window.location.href="/cinema/detail?cinemaNo="+cinemaNo;
			}
		});
	}
	</script>
</body>
</html>