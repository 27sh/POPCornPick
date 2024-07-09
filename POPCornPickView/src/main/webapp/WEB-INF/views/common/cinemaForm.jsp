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
		<label for="cinemaLocation">지역명<span>*</span></label>
		<select id="cinemaLocation" name="cinemaLocation" required>
			<option value="" disabled selected>선택</option>
			<option value="서울">서울</option>
			<option value="경기/인천">경기/인천</option>
			<option value="충청/대전">충청/대전</option>
			<option value="전라/광주">전라/광주</option>
			<option value="경북/대구">경북/대구</option>
			<option value="경남/부산/울산">경남/부산/울산</option>
			<option value="강원">강원</option>
			<option value="제주">제주</option>
		</select>
		<div>지점명<span>*</span></div>
		<input type="text" name="cinemaName">
		<div>주소<span>*</span></div>
		<input type="text" name="cinemaAddr">
		<div>전화번호<span>*</span></div>
		<input type="text" name="cinemaTel">
		<div>대표 이미지<span>*</span></div>
		<input type="file" id="cinemaImg" name="cinemaImg">
		<div>중요공지</div>
		<input type="text" name="cinemaIntro"><br>
		<input type="button" value="영화관 등록하기" onclick="submitCinemaForm(event)">
	</form>
	
	</div>
	<!-- 관람관 등록 -->
	<div>
	
	</div>
	</main>
	<footer>
	
	</footer>
	<script>
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
				console.log("success : ", data);
			},
			error : function(e){
				console.log("error : " );
			}
		});
		
	}
	</script>
</body>
</html>