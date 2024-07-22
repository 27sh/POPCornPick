<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
}

.event-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    border-top: 1px solid #b8b6aa;
    border-bottom: 1px solid #b8b6aa;
    margin-bottom: 20px;
    background-color: #f8f8f8;
}

.event-info{
	display: flex;
	align-items: center;
}

.event-state{
	font-size: 14px;
    font-weight: 400;
}
.event-title {
    font-size: 16px;
    font-weight: 400;
    margin-left: 20px;
}

.event-period {
    font-size: 14px;
    color: #666;
}

#eventContent {
    margin-top: 20px;
    margin-left: 400px;
	text-align: left;
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

#eventSubmitButton{
	text-align: center;
	margin-top: 20px;
}
#submitEvent {
	padding: 15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background: #f82f62;
	border: 1px solid #f82f62;
	color:#fff;
}

hr{
	margin-top: 20px;
	color: #b8b6aa;
}
#buttonBox{
	text-align: right;
}
#backButton{
	padding: 10px 15px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 10px;
	cursor: pointer;
	margin: 10px 0;
	border: 1px solid #b8b6aa;
	background: white;
}


</style>
</head>
<%@ include file="../../layout/header.jsp"%>
<body>
	<main>
		<div class="event-header">
		<div class="event-info">
			<div class="event-state"><b id="eventState"></b></div>
			<div id="eventTitle" class="event-title"></div>
		</div>
		<div id="eventPeriod" class="event-period"></div>
		</div>
		<div id="eventContent"></div>
		<div id="eventSubmitButton"></div>
		<hr>
		<div id="buttonBox"></div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const urlParams = new URLSearchParams(window.location.search);
		let eventNo = urlParams.get('eventNo');
		console.log(eventNo);
		
		let eventState = urlParams.get('eventState');
		console.log(eventState);
		
		if(eventNo === null || eventState === null){
			alert("올바르지 않은 경로입니다.");
		} 
		
		if(eventState == 1){
			document.getElementById('eventState').innerText = "진행중인 이벤트";
			document.querySelector('#eventState').style.color = '#2275a4';
			const buttonStr1 = '<input type="button" id="submitEvent" value="참여하기" onclick="submitEvent(event)">';
			document.getElementById("eventSubmitButton").innerHTML = buttonStr1;
			
			const buttonStr2 = '<button type="button" id="backButton" onclick="backButton1()">이전</button>';
			document.getElementById("buttonBox").innerHTML = buttonStr2;
		} else if(eventState == 0){
			document.getElementById('eventState').innerText = "종료된 이벤트";
			document.querySelector('#eventState').style.color = '#2275a4';
			const buttonStr2 = '<button type="button" id="backButton" onclick="backButton0()">이전</button>';
			document.getElementById("buttonBox").innerHTML = buttonStr2;
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
					document.getElementById("eventTitle").innerText = data.eventTitle;
					document.getElementById("eventPeriod").innerText = "기간: "+ data.startEvent + ' ~ ' + data.endEvent;
					document.getElementById("eventContent").innerHTML = data.eventContent;
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
		const mbtiResult = selectedValue1+selectedValue2+selectedValue3+selectedValue4;
		console.log(mbtiResult);
		console.log(selectedValue1, selectedValue2, selectedValue3, selectedValue4);
		
		const urlParams = new URLSearchParams(window.location.search);
		let eventNo = urlParams.get('eventNo');
		console.log("eventNo22 : ", eventNo);
		
		const eventTable = {
			eventNo : eventNo,
			contentsResult : mbtiResult
		}
		console.log("event", eventTable);

		const sendData = JSON.stringify(eventTable);
		console.log("sendData: " + sendData);

		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			if (this.status === 200) {
				alert(this.responseText);
				window.location.href = "http://localhost:8080/event/commonList?eventState=1"
			} else {
				alert("다시 입력해주세요.");
			}
		};
		xhttp.open("POST", "http://localhost:9001/api/v1/event/member/form");
		xhttp.setRequestHeader("Content-type", "application/json");
		
		const token = localStorage.getItem("jwtToken");
		xhttp.setRequestHeader("token", token);
		console.log(token);
		xhttp.send(sendData);
	}
	
	function backButton0(){
		window.location.href="/event/commonList?eventState=0";
	}
	
	function backButton1(){
		window.location.href="/event/commonList?eventState=1";
	}
	
	
	</script>
</body>
</html>