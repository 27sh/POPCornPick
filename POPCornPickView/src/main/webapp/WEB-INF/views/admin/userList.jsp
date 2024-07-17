<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style>
main {
	width: 1100px;
	margin: 80px auto;
	margin-top: 10px;
	min-height: 700px;
}

h2{
	margin-bottom: 20px;
	font-weight: 400;
	font-size: 22px;
}

</style>
</head>
<%@ include file="../layout/adminHeader.jsp"%>
<body>
	<main>
		<div id="container">
			<h2>회원 관리</h2>
			<div id="memberList">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th><th scope="col">제목</th><th scope="col">시작일</th><th scope="col">종료일</th>
						</tr>
					</thead>
					<tbody id="roomList">
					
					</tbody>					
				</table>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
</body>
</html>