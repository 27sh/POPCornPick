<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세조회</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<style>
main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
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

#eventDetail .table{
	width: 100%;
}




</style>
</head>
<body>
	<header>
		<%@ include file="../../layout/header.jsp"%>
	</header>
	<main>
		<div id="container">
			<h2>이벤트 상세</h2>
			<div id="eventDetail">
				<table class="table">
					<tbody id="roomList">
					
					</tbody>					
				</table>
				<div id="eventContent"></div>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const urlParams = new URLSearchParams(window.location.search);
		let eventNo = urlParams.get('eventNo');
		console.log(eventNo);
		
		if(eventNo === null){
			alert("올바르지 않은 경로입니다.");
		}
		
		$.ajax({
			url : "http://localhost:9001/api/v1/event/detail",
			type : "GET",
			data : {
				eventNo : eventNo
			},
			success : function(data) {
				console.log(data);
				if(data != null){
					let table = '';
					table += '<tr><td>' + data.eventNo + '</td>';
					table += '<td>' + data.eventTitle + '</td>';
					table += '<td>' + data.startEvent + ' ~ ' + data.endEvent + '</td></tr>';
					
					document.getElementById("eventContent").innerHTML = data.eventContent;
					document.getElementById("roomList").innerHTML = table;
				} else {
					alert("불러오는데 실패했습니다. 다시 시도해주세요.");
					//window.location.href="/cinema/list";
				}
			},
			error : function(error) {
				alert("불러오는데 실패했습니다. 다시 시도해주세요.", error);
				//window.location.href="/cinema/list";
			}
		});
		
	});
	</script>
</body>
</html>