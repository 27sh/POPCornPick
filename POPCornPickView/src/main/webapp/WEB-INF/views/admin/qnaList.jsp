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
main {
	width: 1200px;
	margin: 80px auto;
	display: flex;
	justify-content: space-between;
}

main #container {
	width: 900px;
	min-height: 700px;
	box-sizing: border-box;
}

body {
	font-family: 'Pretendard Variable', Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	padding: 20px;
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align-last: center;	
}

thead tr {
	border-top: 2px solid #ddd;
	border: none;
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
	<main>
		<div class="sidebar-container">
			<%@ include file="../layout/serviceSideBar.jsp"%>
		</div>
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
	</main>


	<script>
		$(document)
				.ready(
						function() {
							$
									.ajax({
										url : "http://localhost:9001/api/v1/admin/inquiry",
										method : "GET",
										success : function(data) {
											var tableBody = $("#tablebody");
											tableBody.empty();
											data
													.forEach(function(qna) {

														var date = new Date(
																qna.regdate);
														var year = date
																.getFullYear();
														var month = (date
																.getMonth() + 1)
																.toString()
																.padStart(2,
																		'0');
														var day = date
																.getDate()
																.toString()
																.padStart(2,
																		'0');
														var formattedDate = year
																+ '-'
																+ month
																+ '-' + day;
														var answerClass = qna.qnaAnswer ? 'btn-completed'
																: 'btn-pending';
														var answerStatus = (qna.qnaAnswer === null) ? '답변대기<input type="button" class="btn"'
																+ answerClass
																+ ' onclick="answerToQna(event)" id="answer'
																+ qna.qnaNo
																+ '" value="답변하기">'
																: '답변완료'; // 답변 상태 처리
														var row = '<tr>'
																+ '<td>'
																+ qna.qnaNo
																+ '</td>'
																+ '<td>'
																+ qna.qnaBigCategory
																+ '</td>'
																+ '<td>'
																+ qna.qnaTitle
																+ '</td>'
																+ '<td>'
																+ qna.member.username
																+ '</td>'
																+ '<td>'
																+ formattedDate
																+ '</td>'
																+ '<td>'
																+ answerStatus
																+ ' </td>'
																+ '</tr>';
														tableBody.append(row);
													});
										},
										error : function(xhr, status, error) {
											console.log(error);
										}
									});
						});

		function answerToQna(event) {
			const qnaNo = event.target.id.substring(6);
			location.href = "/admin/qnaEdit/" + qnaNo;
		}
	</script>
</body>
</html>