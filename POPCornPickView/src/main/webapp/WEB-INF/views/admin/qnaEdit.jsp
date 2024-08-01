<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnaEdit</title>
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

.btn {
	background-color: #800080; /* 보라색 */
	color: white;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	margin-left: 10px;
}

.btn button:hover {
	background-color: #4b0082; /* 진한 보라색 */
}
#qnaanswer{
	width: 560px;
	height: 220px;
}
</style>
</head>
<body>


	
	<div id="detailForm"></div>


	<script>
		$(document).ready(
						function() {
							const qnaNo = "${qnaNo}";

							$.ajax({
										url : "http://localhost:9001/api/v1/admin/inquiry/"	+ qnaNo,
										method : "GET",
										dataType : "json",
										success : function(response) {
											
											let str = '';
											str += '<div class="container">';
											str += '<div class="header-text">Q&A</div>';
											str += '<table>';
											str += '    <tr>';
											str += '      <td>카테고리</td>';
											str += '      <td id="category">' + response.qnaBigCategory 	+ '</td>';
											str += '    </tr>';
											str += '    <tr>';
											str += '      <td>제목</td>';
											str += '      <td id="title">'	+ response.qnaTitle	+ '</td>';
											str += '    </tr>';
											str += '    <tr>';
											str += '      <td>작성자</td>';
											str += '      <td id="username">'+ response.member.username+ '</td>';
											str += '    </tr>';
											str += '    <tr>';
											str += '      <td>내용</td>';
											str += '      <td id="content">'+ response.qnaContent + '</td>';
											str += '    </tr>';
											str += '    <tr>';
											str += '      <td>답변</td>';
											str += '      <td ><textarea row="5" id="qnaanswer"></textarea></td>';
											str += '    </tr>';
											str += '  </table>';
											str += '  <div class="button-container">';
											str += '    <button class="btn">문의</button>';
											str += '    <button class="btn" onclick="QnaAnswer(event)">답변</button>';
											str += '  </div>';
											str += '</div>';

											$("#detailForm").html(str);

										},
										error : function(xhr, status, error) {
											console.log(error);
										}

									})
						});

		function goQnaList(event) {
			location.href = "http://localhost:8080/admin/qnaList";
		}

		function QnaAnswer(event) {
			const qnaNo = "${qnaNo}";
			const category = $("#category").text();
			console.log(category);
			const title = $("#title").text();
			const username = $("#username").text(); 
			const content = $("#content").text();
			const answer = document.getElementById("qnaanswer").value;
			console.log(title);
			console.log(username);
			console.log(content);
			console.log(answer);
			
			const dataToSend = JSON.stringify({
		        qnaCategory: category,
		        qnaTitle: title,
		        username: username,
		        qnaContent: content,
		        qnaAnswer: answer
		    });

		    console.log(dataToSend); 

						$.ajax({
							url : "http://localhost:9001/api/v1/admin/inquiryDetial",
							method : "PUT",
							contentType: "application/json",
							data : JSON.stringify({
								qnaNo : qnaNo,
								qnaBigCategory : category,
								qnaTitle : title,
								username : username,
								qnaContent : content,
								qnaAnswer : answer
							}),
							success : function(response){
								
								alert("QNA답변완료");
								window.location.href="http://localhost:8080/admin/qnaList";
							},
							error : function(xhr, status, error){
								console.log(error);
							}

						})

		}
	</script>







</body>
</html>