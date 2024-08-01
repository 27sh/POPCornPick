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
/* 	min-height: 700px; */
/* 	border:1px solid #eee; */
	text-align: center;
}

/* .member-info { */
/* 	width: 100%; */
/* 	height: 300px; */
/* 	border: 1px solid blue; */
/* 	box-sizing: border-box; */
/* 	margin-bottom: 20px; */
/* } */

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
	margin: 30px 0;
}

.tr-group { 
	border-bottom: 1px solid black; 
	height: 50px; 
} 

.page-numbers {
	margin: 0 5px;
	cursor: pointer;
}

.activer {
	font-weight: bold;
}

.flex-box {
	display: flex;
	box-sizing: border-box;
}

.sidebar {
	width: 230px;
	height: 795px;
	box-sizing: border-box;
	margin-right: 20px;
}

#pagination {
	margin-top: 20px;
}

#inquiry {
	font-size: 16px;
	position: relative;
	left: 300px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../member/mainInfo.jsp"%>
	</header>
	<main>
		<div class="member-info">
			
		</div>
		<div class="flex-box">
			<div class="sidebar">
				<%@ include file="../member/sideMenu.jsp"%>
			</div>
			<div id="table-location">
				<h1>1:1 문의내역 목록<a id="inquiry" href="/member/qnaForm">문의하기</a></h1>
				<table id="table" border="1">
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
		<div id="pagination">
			<button id="prevBtn" disabled onclick="prev()"><</button>
			<span id="page-numbers"> 1 </span>
			<button id="nextBtn" onclick="next()">></button>
		</div>
			</div>
		</div>
	</main>
	<footer>
		
	</footer>
	<script>
		let qnaList;
		
		// 페이지네이션 로직 구현
		let currentPage = 1; // 현재 페이지 [기본값(초기값) 1]
		const itemsPerPage = 10; // 페이지당 보여줄 데이터 개수[10개]
		let totalItems; // 총 데이터 개수 
		
		function loadQnaList(){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				qnaList = JSON.parse(this.responseText);
// 				document.querySelector("#table").style.display = "none";
				console.log(qnaList);
// 				let table = '<table id="table"><tr><th scope="col">번호</th><th scope="col">대분류</th><th scope="col">소분류</th><th scope="col">제목</th><th scope="col">첨부파일</th><th scope="col">작성일</th><th scope="col"></th>답변상태</tr></table>'
				totalItems = qnaList.length;
				// 현재 페이지에 해당하는 데이터만 화면에 표시
				
				displayCurrentPage();
				
				paging();
				
// 				const tbody = document.querySelector("#tbody");
// 				tbody.innerHTML = "";
// 				for(let i = 0; i < qnaList.length; i++){
// 					let row = '<tr class="tr-group" >';
// 					row += '<td>' + (i + 1) + '</td>';
// 					row += '<td>' + qnaList[i].qnaBigCategory + '</td>';
// 					row += '<td>' + qnaList[i].qnaSmallCategory + '</td>';
// 					row += '<td><a href="/member/qnaDetail?qnaNo=' +qnaList[i].qnaNo + '">' + qnaList[i].qnaTitle + '</a></td>';
// 					row += '<td>' + qnaList[i].qnaFile.split("--")[1] + '</td>';
// 					// Moment.js 객체 생성 (시간대 정보 유지)
// 					let regDate = moment.utc(qnaList[i].regdate).local();
// 					// 원하는 형식으로 문자열 변환
// 					let formattedDate = regDate.format("YYYY-MM-DD HH:mm:ss");
// 					row += '<td>' + formattedDate + '</td>';
// 					if(qnaList[i].qnaAnswer === null){
// 						row += '<td>' + '답변대기' + '</td>';
// 					}else {
// 						row += '<td>' + '답변완료' + '</td>';
// 					}
// 					row += '</tr>';
					
// 					tbody.innerHTML += row;
// 				}
									
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/memInquiry/inquiry");
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		
		function displayCurrentPage(){
			const startIdx = (currentPage - 1) * itemsPerPage;
			const endIdx = Math.min(currentPage * itemsPerPage, totalItems);  // 마지막 인덱스 조정
			const slicedData = qnaList.slice(startIdx, endIdx);  // 현재 페이지 데이터 추출
			
			displayQnaList(slicedData, startIdx); // 추출한 데이터만 화면에 표시하는 함수 호출
		}
		
		function displayQnaList(slicedData, startIdx){
			const tbody = document.querySelector("#tbody");
			tbody.innerHTML = "";
			for(let i = 0; i < slicedData.length; i++){
				let row = '<tr class="tr-group" >';
				row += '<td>' + (i + startIdx + 1) + '</td>';
				row += '<td>' + slicedData[i].qnaBigCategory + '</td>';
				row += '<td>' + slicedData[i].qnaSmallCategory + '</td>';
				row += '<td><a href="/member/qnaDetail?qnaNo=' +slicedData[i].qnaNo + '">' + slicedData[i].qnaTitle + '</a></td>';
				if(slicedData[i].qnaFile != null){
				row += '<td>' + slicedData[i].qnaFile.split("--")[1] + '</td>';
				}else {
				row += '<td>첨부 파일 없음</td>';
				}
				// Moment.js 객체 생성 (시간대 정보 유지)
				let regDate = moment.utc(qnaList[i].regdate).local();
				// 원하는 형식으로 문자열 변환
				let formattedDate = regDate.format("YYYY-MM-DD HH:mm:ss");
				row += '<td>' + formattedDate + '</td>';
				if(slicedData[i].qnaAnswer === null){
					row += '<td>' + '답변대기' + '</td>';
				}else {
					row += '<td>' + '답변완료' + '</td>';
				}
				// 위에 if else문 밑에 한줄로 처리 가능
				// row += '<td>' + (data[i].qnaAnswer === null ? '답변대기' : '답변완료') + '</td>';
				row += '</tr>';
				
				tbody.innerHTML += row;
			}
			
		}
		
		const prevBtn = document.querySelector("#prevBtn");
		const nextBtn = document.querySelector("#nextBtn");
		
		function updatePaginationButtons() {
			prevBtn.disabled = currentPage === 1;
			nextBtn.disabled = currentPage === Math.ceil(totalItems / itemsPerPage);
			paging();
		}
		
		function prev(){
			if(currentPage > 1){
				currentPage--;
				displayCurrentPage();
				updatePaginationButtons();
			}
// 			prevBtn.disabled = currentPage === 1; // 버튼 활성화/비활성화 설정
// 			nextBtn.abled = currentPage < Math.ceil(totalItems / itemsPerPage);
		}
		
		function next(){
			if(currentPage < Math.ceil(totalItems / itemsPerPage)){
				currentPage++;
				displayCurrentPage();
				updatePaginationButtons();
				console.log(currentPage + ", " + Math.ceil(totalItems / itemsPerPage));
			}
// 			nextBtn.disabled = currentPage === Math.ceil(totalItems / itemsPerPage);
// 			//prevBtn.abled = currentPage != 1;
		}
		
		function paging(){ // createPaginationButton
			const pageNumbers = document.querySelector("#page-numbers")
			pageNumbers.innerHTML = '';
			
			const totalPages = Math.ceil(totalItems / itemsPerPage);
			
			for(let i = 1; i <= totalPages; i++){
				const pageNumber = document.createElement('span');
				pageNumber.textContent = i;
				pageNumber.classList.add('page-numbers');
				
				if(i === currentPage){
					pageNumber.classList.add('activer');
				}
				
				pageNumber.addEventListener('click', () =>{
					currentPage = i;
					displayCurrentPage();
					updatePaginationButtons();
				});
				
				pageNumbers.appendChild(pageNumber);
			}
		}
		
		document.addEventListener('DOMContentLoaded', () => {
			loadQnaList();
		});
		
// 		$(document).ready(function(){
// 			loadQnaList();
			// 고도화 할 것 : 페이지네이션 <, > 버튼 클릭시 1~5 숫자가 6~10 으로 넘어가게만들기. 10개씩 한 페이지네이션에  페이지네이션 5묶음 끊어서 보이게하기.
// 		});
		
	</script>
</body>
</html>