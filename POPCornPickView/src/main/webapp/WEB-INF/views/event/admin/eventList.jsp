<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스트</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
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

.sidebar-box2 p:nth-child(3) a{
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

#eventList .table{
	width: 100%;
}

#eventList .table .listNum{
	color: #777;
}

</style>
</head>
<%@ include file="../../layout/adminHeader.jsp"%>
<body>
	<main>
		<div class="sidebar-container">
			<%@ include file="../../layout/serviceSideBar.jsp"%>
		</div>
		<div id="container">
			<h2>전체 이벤트</h2>
			<div id="eventList">
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
						table += '<td class="eventTitle"><a href="/event/detail?eventNo='+ data[i].eventNo +'">' + data[i].eventTitle + '</a></td>';
						table += '<td class="startEvent">'+data[i].startEvent + '</td>';
						table += '<td class="endEvent">' + data[i].endEvent + '</td>';
						table += '</tr>';
					}
					document.getElementById("roomList").innerHTML = table;
					
				} else{
					document.getElementById("roomList").innerHTML = table;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		
		xhttp.open("GET", "http://localhost:9001/api/v1/event", true);
		xhttp.send();
	});
	</script>
</body>
</html>