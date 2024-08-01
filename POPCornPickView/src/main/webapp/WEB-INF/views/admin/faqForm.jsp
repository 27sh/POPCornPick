<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ Form</title>
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
}

thead tr {
	border-top: 2px solid #ddd;
}

tbody tr:last-child {
	border-bottom: 2px solid #ddd;
}

th, td {
	padding: 10px;
	text-align: left;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-left: 1px solid #ddd;
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
	background-color: #4b0082;
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

.btn {
	background-color: #816bff; /* 보라색 */
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	margin-left: 10px;
}

#qnaanswer {
	width: 560px;
	height: 220px;
}
</style>
</head>
<body>
	<main>
		<div class="sidebar-container">
			<%@ include file="../layout/serviceSideBar.jsp"%>
		</div>
		<div class="container">
			<div class="header-text">
				<h1>FAQ</h1>
			</div>
			<table>
				<tr>
					<td>카테고리</td>
					<td><select name="category">
							<option value="홈페이지" selected="selected">홈페이지</option>
							<option value="회원">회원</option>
							<option value=""></option>
							<option value="특별관">특별관</option>
							<option value="영화관이용">영화관이용</option>
							<option value="할인혜택">할인혜택</option>
							<option value="관람권/결제수단">관람권/결제수단</option>
							<option value="예매/매표">예매/매표</option>
					</select></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" id="title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" id="content"></td>
				</tr>
			</table>
			<div class="button-container">
				<button class="btn" onclick="faqWrite(event)">등록</button>
			</div>
		</div>
	</main>


	<script>
		function faqWrite(event) {

			var category = $("select[name='category']").val();
			var title = $("#title").val();
			var content = $("#content").val();

			console.log(category);
			console.log(title);
			console.log(content);

			$.ajax({
				url : "http://localhost:9001/api/v1/admin/Frequently",
				method : "POST",
				contentType : "application/json",
				data : JSON.stringify({
					faqCategory : category,
					faqTitle : title,
					faqContent : content
				}),
				success : function(response) {
					alert("FAQ등록 완료");
					window.location.href = "";
				},
				error : function(xhr, status, error) {
					console.log(error);
				}
			})

		}
	</script>







</body>
</html>