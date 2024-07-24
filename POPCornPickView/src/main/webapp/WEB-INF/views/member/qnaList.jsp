<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<style>

main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
	text-align: center;
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
	margin-bottom: 10px;
}

tr {
	margin-bottom: 30px;
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
		<div id="table-location">
			
		</div>
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
			<tbody id="tbody">
<%-- 				<c:forEach var="qna" items="${qnaList }" varStatus="status"> --%>
<!-- 					<tr class="tr-group"> -->
<%-- 						<td>${status.count }</td> --%>
<%-- 						<td>${qna.qnaBigCategory }</td> --%>
<%-- 						<td>${qna.qnaSmallCategory }</td> --%>
<%-- 						<td>${qna.qnaTitle }</td> --%>
<%-- 						<td>${qna.qnaFile }</td> --%>
<%-- 						<td>${qna.regdate }</td> --%>
<%-- 						<td>${qna.qnaAnswer }</td> --%>
<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
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
				qnaList = JSON.parse(this.responseText);
// 				document.querySelector("#table").style.display = "none";
				console.log(qnaList);
// 				let table = '<table id="table"><tr><th scope="col">번호</th><th scope="col">대분류</th><th scope="col">소분류</th><th scope="col">제목</th><th scope="col">첨부파일</th><th scope="col">작성일</th><th scope="col"></th>답변상태</tr></table>'
				const tbody = document.querySelector("#tbody");
				tbody.innerHTML = "";
				for(let i = 0; i < qnaList.length; i++){
					let row = '<tr class="tr-group">';
					row += '<td>' + (i + 1) + '</td>';
					row += '<td>' + qnaList[i].qnaBigCategory + '</td>';
					row += '<td>' + qnaList[i].qnaSmallCategory + '</td>';
					row += '<td><a href="/member/qnaDetail?qnaNo=' +qnaList[i].qnaNo + '">' + qnaList[i].qnaTitle + '</a></td>';
					row += '<td>' + qnaList[i].qnaFile.split("--")[1] + '</td>';
					// Moment.js 객체 생성 (시간대 정보 유지)
					let regDate = moment.utc(qnaList[i].regdate).local();
					// 원하는 형식으로 문자열 변환
					let formattedDate = regDate.format("YYYY-MM-DD HH:mm:ss");
					row += '<td>' + formattedDate + '</td>';
					if(qnaList[i].qnaAnswer === null){
						row += '<td>' + '답변대기' + '</td>';
					}else {
						row += '<td>' + '답변완료' + '</td>';
					}
					row += '</tr>';
					
					tbody.innerHTML += row;
				}
									
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/memInquiry/inquiry");
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		loadQnaList();
	</script>
</body>
</html>