<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Faq 수정</title>
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

#qnaanswer {
	width: 560px;
	height: 220px;
}

#content {
	width: 800px;
	height: 350px;
}
</style>
</head>
<body>
	<h4>로그인기능 완료이후 수정할부분 있음 faqEdit.jsp ajax부분 주석 확인</h4>
	<div id="faqEdit"></div>


	<script>

$(document).ready(function(){
	const faqNo = "${faqNo}";
	
	$.ajax({
		url : "http://localhost:9001/api/v1/admin/Frequently/" + 1,//나중에 1대신 faqNo가 들어가야함
		method : "GET",
		dataType : "json",
		success : function(faqresponse){
			
			let str = '';
			str += '<div class="contaoner">';
			str += 	'<div class="header-text"><h1>FAQ</h1></div>'
			str +=  '<table>';
			str += 	'<tr>';
			str +=      '<td>카테고리</td>'
			str += 		'<td>';
			str +=    	'<select name="category" id="faqcategory">';
			str +=  		'<option value="카테고리" selected=:"selected">카테고리</option>';
			str +=   		'<option value="카테고리2">2번 셀렉트</option>';
			str +=   		'<option value="카테고리3">3번 셀렉트</option>';
			str += 	  	'</select>';
			str +=		'</td>';
			str +=	'</tr>';
			str +=	'<tr>';
			str +=		'<td>제목</td>';
			str +=		'<td><input type="text" id="title" value="' + faqresponse.faqTitle + '"></td>';
			str +=	'</tr>';
			str +=	'<tr>';
			str +=		'<td>내용</td>';
			str +=		'<td><textarea id="content">' + faqresponse.faqContent + '</textarea></td>';
			str += 	'</tr>';
			str += 	'</table>';
			str += 	'<div class="button-container">';
			str += 		'<button class="btn" onclick="faqedit(event)">수정</button>';
			str += 	'</div>';
			str += '</div>';
			
			$("#faqEdit").html(str);
			
		},
		error(xhr, status, error){
			console.log(error);
		}
	})
})

function faqedit(event) {
	const faqNo = "${faqNo}";
	const faqcategory = $("#faqcategory").val();
	const faqtitle = $("#title").val();
	const faqcontent = $("#content").val();
	
	const dateSend = JSON.stringify({
			faqNo : 1, //이거도 추후에 faqNo로 수정해줘야함 로그인 기능이 완료될시
			faqCategory :faqcategory,
			faqTitle :faqtitle,
			faqContent :faqcontent
	});
		console.log("데이타 센드 : " + dateSend);	
	
		$.ajax({
			url : "http://localhost:9001/api/v1/admin/FrequentlyModify",
			method : "PUT",
			contentType : "application/json",
			data : JSON.stringify({
				faqNo : 1, //이거도 추후에 faqNo로 수정해줘야함 로그인 기능이 완료될시
				faqCategory :faqcategory,
				faqTitle :faqtitle,
				faqContent :faqcontent
				}),
			success : function(faqModify){
				alert("자주찾는질문 수정했습니다.")
				window.location.href="/admin/faqList"; 
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		
		})
	
}
</script>

</body>
</html>