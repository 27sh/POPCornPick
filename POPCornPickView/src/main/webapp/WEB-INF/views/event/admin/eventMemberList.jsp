<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 참여 리스트</title>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
main {
	width: 1200px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	box-sizing:border-box;
}

.sidebar-box2 p:nth-child(4) a{
	color: #816bff !important;
}

h2{
	margin-bottom: 20px;
	font-weight: 400;
	font-size: 22px;
}

table, tr, th, td{
	border-collapse:collapse;
	border:1px solid #eee;
	border-right:0;
	border-left:0;
	padding:20px;
	text-align:center;
}

#participationListBox .table{
	width: 100%;
}

</style>
</head>
<body>
<%@ include file="../../layout/adminHeader.jsp"%>
	<main>
		<div class="sidebar-container">
			<%@ include file="../../layout/serviceSideBar.jsp"%>
		</div>
		<div id="container">
			<h2>이벤트 참여 리스트</h2>
			<div id="participationListBox">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th><th scope="col">이벤트 제목</th><th scope="col">참여 아이디</th><th scope="col">참여 결과</th>
						</tr>
					</thead>
					<tbody id="participationList">
					
					</tbody>					
				</table>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			if(this.readyState == 4 && this.status == 200){
				const data = JSON.parse(this.responseText);
				console.log(data);
				if(data != null && data.length > 0){
					let table = '';
					for(let i = 0 ; i < data.length ; i++){
						table += '<tr>';
						table += '<td class="listNum">' + (i + 1) + '</td>';
						table += '<td class="eventTitle"><a href="/event/detail?eventNo='+ data[i].eventNo +'">' + data[i].event.eventTitle + '</a></td>';
						table += '<td class="startEvent">'+data[i].member.username + '</td>';
						table += '<td class="endEvent">' + data[i].participationResult + '</td>';
						table += '</tr>';
					}
					document.getElementById("participationList").innerHTML = table;
					
				} else{
					document.getElementById("participationList").innerHTML = table;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		
		xhttp.open("GET", "http://localhost:9001/api/v1/admin/event/participationList", true);
		xhttp.send();
	});
	
	</script>
</body>
</html>