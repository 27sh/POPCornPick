<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA List</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../layout/adminHeader.jsp"%>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
body {
	font-family: 'Pretendard Variable', Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding-top: 50px;
}

h1 {
	text-align: left;
}

table {
	width: 100%;
	border-collapse: collapse;
	
}

thead tr {
	border-top: 2px solid #ddd;
}

tbody tr:last-child {
	border-bottom: 2px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: left; <!--
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	-->
}

th {
	height: 40px;
}

.btn {
	margin: 5px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	background-color: white;
	color: black;
	border-radius: 5px;
	cursor: pointer;
}

.btn:hover {
	background-color: #f4f4f4;
}

.btn-completed {
	background-color: #5c6bc0;
	color: white;
	border: none;
}

.btn-pending {
	color: gray;
	border: 1px solid #ddd;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Q&A</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일자</th>
					<th>답변상태</th>

				</tr>
			</thead>
			<tbody id="tablebody">

			</tbody>
		</table>
	</div>

	<script>
		$(document).ready(function(){
							$.ajax({
									url : "http://localhost:9001/api/v1/admin/inquiry",
									method : "GET",
									success : function(data) {
										var tableBody = $("#tablebody");
										tableBody.empty();
										data.forEach(function(qna) {
													var date = new Date(qna.regdate);
													var year = date.getFullYear();
													var month = (date.getMonth() + 1).toString().padStart(2,'0');
													var day = date.getDate().toString().padStart(2,'0');
													var formattedDate = year + '-' + month + '-' + day;
													var answerStatus = qna.qna_answer ? '답변완료' : '답변대기'; // 답변 상태 처리
													var answerClass = qna.qna_answer ? 'btn-completed' : 'btn-pending';
													var row = '<tr>'+
													'<td>' + qna.qnaNo + '</td>'+
													'<td>' + qna.qnaCategory + '</td>' +
													'<td>' + qna.qnaTitle + '</td>'	+
													'<td>' + qna.member.username + '</td>' +
													'<td>' + formattedDate + '</td>'+
													'<td>' + answerStatus + ' <input type="button" class="btn" value="답변하기"></td>'
															+ '</tr>';
														tableBody.append(row);
													});
										},
										error : function(xhr, status, error) {
											console.log(error);
										}
									});
						});
	</script>
</body>
</html>