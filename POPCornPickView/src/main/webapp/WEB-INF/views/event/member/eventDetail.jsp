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

#question{
	font-size: 18px;
	font-weight: 400;
	margin-top: 40px;
	margin-bottom: 10px;
}

input[type="radio"]{
	margin-left: 10px;
}

#eventContentBox{
	text-align: center;
}


</style>
</head>
<%@ include file="../layout/adminHeader.jsp"%>
<body>
	<main>
		<div id="container">
			<h2>이벤트 상세</h2>
			<div id="eventDetail">
				<table class="table">
					<tbody id="roomList">
					
					</tbody>					
				</table>
				<div id="eventContent"></div>
				<div id="eventSubmitButton"></div>
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
					const buttonStr1 = '<input type="button" id="submitEvent" value="제출하기" onclick="submitEvent(event)">';
					document.getElementById("eventSubmitButton").innerHTML = buttonStr1;
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
	
	function submitEvent(event){
		const q1 = document.getElementsByName('q1');
		const q2 = document.getElementsByName('q2');
		const q3 = document.getElementsByName('q3');
		const q4 = document.getElementsByName('q4');
		console.log(q1);
		let selectedValue1 = null;
		let selectedValue2 = null;
		let selectedValue3 = null;
		let selectedValue4 = null;
		for(const radio of q1){
			if(radio.checked){
				selectedValue1 = radio.value;
				break;
			}
		}
		
		for(const radio of q2){
			if(radio.checked){
				selectedValue2 = radio.value;
				break;
			}
		}
		
		for(const radio of q3){
			if(radio.checked){
				selectedValue3 = radio.value;
				break;
			}
		}
		
		for(const radio of q4){
			if(radio.checked){
				selectedValue4 = radio.value;
				break;
			}
		}
		
		console.log(selectedValue1);
		console.log(selectedValue2);
		console.log(selectedValue3);
		console.log(selectedValue4);
		
		const urlParams = new URLSearchParams(window.location.search);
		let eventNo = urlParams.get('eventNo');
		console.log("eventNo22 : ", eventNo);
		
		const participation = {
			eventNo : eventNo
		}
		console.log("participation", participation);

		const sendData = JSON.stringify(participation);
		console.log("sendData: " + sendData);

		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			if (this.status === 200) {
				alert(this.responseText);
				window.location.href = "http://localhost:8080/event/commonList"
			} else {
				alert("다시 입력해주세요.");
			}
		};
		xhttp.open("POST", "http://localhost:9001/api/v1/event/member/form");
		xhttp.setRequestHeader("Content-type", "application/json");
		xhttp.send(sendData);
	}
	
	
	</script>
</body>
</html>