<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
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

#titleContainer{
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#bigTitle{
	margin-bottom: 20px;
	font-weight: 600;
	font-size: 22px;
}

#smallTitle a{
	margin: 0 10px;
	font-size: 16px;
	text-decoration: none;
	color: black;
	color: #666;
}

#smallTitle{
	display: flex;
	color: #CCC;
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
<body>
<%@ include file="../../layout/adminHeader.jsp"%>
	<main>
		<div class="sidebar-container">
			<%@ include file="../../layout/serviceSideBar.jsp"%>
		</div>
		<div id="container">
			<div id="titleContainer">
				<span id="bigTitle">전체 이벤트</span>
				<span id="smallTitle">
					<a href="#" id="progressEvent">진행중인 이벤트</a>&nbsp;| <a href="#" id="endEvent">종료된 이벤트</a>
				</span>
			</div>
			<div id="eventList">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th><th scope="col">제목</th><th scope="col">시작일</th><th scope="col">종료일</th>
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
		const urlParams = new URLSearchParams(window.location.search);
		let eventState = urlParams.get('eventState');
		console.log(eventState);
		
		getAllEventList();
		
		if(eventState == 0){
			getEndEvent();
		}
		$('#progressEvent').on("click", function(event){
			event.preventDefault();
			getProgressEvent();
		});
		
		$('#endEvent').on("click", function(event){
			event.preventDefault();
			getEndEvent();
		});
		
		
	});
	
	function getProgressEvent(){
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
					document.getElementById("participationList").innerHTML = table;
					document.getElementById("bigTitle").innerHTML = "진행중인 이벤트";
				} else{
					document.getElementById("participationList").innerHTML = table;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		xhttp.open("GET", "http://localhost:9001/api/v1/admin/event/progress", true);
		xhttp.send();
	}
	
	function getEndEvent(){
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
					document.getElementById("participationList").innerHTML = table;
					document.getElementById("bigTitle").innerHTML = "종료된 이벤트";
				} else{
					document.getElementById("participationList").innerHTML = table;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		xhttp.open("GET", "http://localhost:9001/api/v1/admin/event/end", true);
		xhttp.send();
	}
	
	function getAllEventList(){
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
					document.getElementById("participationList").innerHTML = table;
					
				} else{
					document.getElementById("participationList").innerHTML = table;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		xhttp.open("GET", "http://localhost:9001/api/v1/admin/event", true);
		xhttp.send();
		
	}
	
	
	
// 	$(document).ready(function(){
// 		const urlParams = new URLSearchParams(window.location.search);
// 		let eventState = urlParams.get('eventState');
// 		console.log(eventState);
		
// 		if(eventState == null){
// 			const xhttp = new XMLHttpRequest();
// 			xhttp.onload = function(){
// 				if(this.readyState == 4 && this.status == 200){
// 					const data = JSON.parse(this.responseText);
// 					console.log(data);
// 					if(data != null && data.length > 0){
// 						let table = '';
// 						for(let i = 0 ; i < data.length ; i++){
// 							table += '<tr>';
// 							table += '<td class="listNum">' + (i + 1) + '</td>';
// 							table += '<td class="eventTitle"><a href="/event/detail?eventNo='+ data[i].eventNo +'">' + data[i].eventTitle + '</a></td>';
// 							table += '<td class="startEvent">'+data[i].startEvent + '</td>';
// 							table += '<td class="endEvent">' + data[i].endEvent + '</td>';
// 							table += '</tr>';
// 						}
// 						document.getElementById("participationList").innerHTML = table;
						
// 					} else{
// 						document.getElementById("participationList").innerHTML = table;
// 					}
// 				} else if(this.readyState == 4 && this.status != 200){
// 					alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
// 				}
// 			}
// 			xhttp.open("GET", "http://localhost:9001/api/v1/admin/event", true);
// 			xhttp.send();
// 		} else if(eventState == 1){
// 			const xhttp = new XMLHttpRequest();
// 			xhttp.onload = function(){
// 				if(this.readyState == 4 && this.status == 200){
// 					const data = JSON.parse(this.responseText);
// 					console.log(data);
// 					if(data != null && data.length > 0){
// 						let table = '';
// 						for(let i = 0 ; i < data.length ; i++){
// 							table += '<tr>';
// 							table += '<td class="listNum">' + (i + 1) + '</td>';
// 							table += '<td class="eventTitle"><a href="/event/detail?eventNo='+ data[i].eventNo +'">' + data[i].eventTitle + '</a></td>';
// 							table += '<td class="startEvent">'+data[i].startEvent + '</td>';
// 							table += '<td class="endEvent">' + data[i].endEvent + '</td>';
// 							table += '</tr>';
// 						}
// 						document.getElementById("participationList").innerHTML = table;
						
// 					} else{
// 						document.getElementById("participationList").innerHTML = table;
// 					}
// 				} else if(this.readyState == 4 && this.status != 200){
// 					alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
// 				}
// 			}
// 			xhttp.open("GET", "http://localhost:9001/api/v1/admin/event/progress", true);
// 			xhttp.send();
// 		} else if(eventState == 0){
// 			const xhttp = new XMLHttpRequest();
// 			xhttp.onload = function(){
// 				if(this.readyState == 4 && this.status == 200){
// 					const data = JSON.parse(this.responseText);
// 					console.log(data);
// 					if(data != null && data.length > 0){
// 						let table = '';
// 						for(let i = 0 ; i < data.length ; i++){
// 							table += '<tr>';
// 							table += '<td class="listNum">' + (i + 1) + '</td>';
// 							table += '<td class="eventTitle"><a href="/event/detail?eventNo='+ data[i].eventNo +'">' + data[i].eventTitle + '</a></td>';
// 							table += '<td class="startEvent">'+data[i].startEvent + '</td>';
// 							table += '<td class="endEvent">' + data[i].endEvent + '</td>';
// 							table += '</tr>';
// 						}
// 						document.getElementById("participationList").innerHTML = table;
						
// 					} else{
// 						document.getElementById("participationList").innerHTML = table;
// 					}
// 				} else if(this.readyState == 4 && this.status != 200){
// 					alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
// 				}
// 			}
// 			xhttp.open("GET", "http://localhost:9001/api/v1/admin/event/end", true);
// 			xhttp.send();
// 		}
		
// 	});
	</script>
</body>
</html>