<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
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
	<h1>이벤트 등록</h1>
	<form>
		<span>시작일<span>*</span></span>
		<input type="date" name="startEvent">
		<span> ~ 종료일<span>*</span></span>
		<input type="date" name="endEvent"><br>
		<hr>
		<span>제목<span>*</span></span>
		<input type="text" name="eventTitle"><br>
		<span>내용<span>*</span></span>
		<input type="text" name="eventContent"><br>
		<input type="text" name="eventFile"><br>
		<input type="button" id="eventFormSubmit" value="등록하기" onclick="">
		<input type="hidden" id="eventModifySubmit" value="수정하기" onclick="">
	</form>
	</main>
	<footer>
	
	</footer>
</body>
</html>