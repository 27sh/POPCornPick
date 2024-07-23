<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
}

.member-info {
	width: 100%;
	height: 300px;
	border: 1px solid blue;
	box-sizing: border-box;
}

table tr:first-child th:first-child {
	width: 80px;
	box-sizing: border-box;
}

table tr:first-child th:nth-child(2),
table tr:first-child th:nth-child(3)  {
	width: 120px;
	box-sizing: border-box;
}

table tr:first-child th:nth-child(4) {
	width: 454px;
	box-sizing: border-box;
}


table tr:first-child th:nth-child(5),
table tr:first-child th:nth-child(6),
table tr:first-child th:nth-child(7) {
	width: 130px;
	box-sizing: border-box;
} 

#table {
	border-top: 2px solid;
	padding: 15px;
	margin: 10px 0;
}

h1 {
	margin: 20px 0;
}

.tr-group {
	border-bottom: 1px solid;
}

</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div class="member-info">
			
		</div>
		<h1>1:1 문의내역 목록</h1>
		<table id="table">
			<thead>
				<tr class="tr-group">
					<th>번호</th>
					<th>대분류</th>
					<th>소분류</th>
					<th>제목</th>
					<th>첨부파일</th>
					<th>작성일</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${qnaList }" varStatus="status">
					<tr class="tr-group">
						<td>${status.count }</td>
						<td>${qna.qnaBigCategory }</td>
						<td>${qna.qnaSmallCategory }</td>
						<td>${qna.qnaTitle }</td>
						<td>${qna.qnaFile }</td>
						<td>${qna.regdate }</td>
						<td>${qna.qnaAnswer }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</main>
	<footer>
		
	</footer>
	<script>
		let qnaList;
		
		function loadQnaList(){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				qnaList = this.responseText;
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/memInquiry/inquiry");
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		loadQnaList();
	</script>
</body>
</html>