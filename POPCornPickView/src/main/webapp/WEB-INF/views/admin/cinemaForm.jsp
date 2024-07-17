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

.sidebar-box1 p:nth-child(2) a{
	color: #816bff !important;
}
 
h2 {
	margin-bottom: 20px;
	font-weight: 600;
	font-size: 22px;
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

input[type="text"]{
	width: 460px;
	height: 50px;
	border: 1px solid #dadada;
	border-radius: 0;
	box-sizing: border-box;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	margin-bottom: 20px;
}

input[type="file"]{
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
	margin-left: 200px;
}

#submitModify{
	padding: 15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background: #816bff;
	border: 1px solid #816bff;
	color:#fff;
	margin-left: 200px;
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
			<h2>지점 등록</h2>
			<!-- 영화관 등록 -->
			<div id="cinemaFormBox">
			<form name="cinemaFrm">
				<input type="hidden" name="cinemaNo" id="cinemaNo">
				<label for="cinemaLocation"><b>지역명<span>*</span></b></label>
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
				</select><br>
				<label for="cinemaName"><b>지점명<span>*</span></b></label>
				<input type="text" name="cinemaName" id="cinemaName"><br>
				<label for="cinemaAddr"><b>주소<span>*</span></b></label>
				<input type="text" name="cinemaAddr" id="cinemaAddr"><br>
				<label for="cinemaTel"><b>전화번호<span>*</span></b></label>
				<input type="text" name="cinemaTel" id="cinemaTel"><br>
				<label for="cinemaImg"><b>대표 이미지<span>*</span></b></label>
				<input type="file" id="cinemaImg" name="cinemaImg"><br>
				<label for="cinemaIntro"><b>중요공지<span>*</span></b></label>
				<input type="text" name="cinemaIntro" id="cinemaIntro"><br>
				<input type="button" id="submitWrite" value="영화관 등록하기" onclick="submitCinemaForm(event)">
				<input type="button" id="submitModify" value="수정하기" onclick="submitCinemaModify(event)">
			</form>
			</div>
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
				window.location.href="/cinema/list";
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