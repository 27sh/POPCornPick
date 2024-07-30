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

#eventTotalContent{
/* 	background: #f7f8fc; */
	height: 560px;
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


 --------- 모달창 --------- 
.modal{
 	display: none; 
   	position: fixed;
	z-index: 1;
	left: 0;
	top: top;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0,0,0,0);
	opacity: 1;
}

.modal-box{
	background-color: #fefefe;
	border: 1px solid #888;
	width: 60%;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 2;
}

.modal-content{
	padding: 20px;
}

.top-box{
	width: 100%;
	height: 40px;
	background-color: #f82f62;
}

.modal-content{
	text-align: center;
}
.modal-title{
	font-size: 25px;
    font-weight: 400;
    margin: 20px;
}

#mbtiResult{
	font-size: 50px;
    font-weight: 800;
    margin: 20px;
}

#mbtiInfo-box{
	font-size: 20px;
    font-weight: 500;
    margin: 20px;
}

#mbtiInfo{
	font-size: 30px;
    font-weight: 500;
}

.close{
	color: #fff;
	float: right;
	font-size: 28px;
	font-weight: bold;
	padding-right: 10px;
}

.close:hover,
.close:focus{
	color: black;
	text-decoration: none;
}

#myEvent {
	width: 200px;
 	padding: 15px 0;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background: #f82f62;
	border: 1px solid #f82f62;
	color:#fff;
	margin: 20px;
}

#home {
	width: 200px;
 	padding: 15px 0; 
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background: #f2f2f2;
	border: 1px solid #f2f2f2;
	color:#333;
	margin: 20px;
}

.no-scroll{
	overflow: hidden;
}

#background{  
  	width: 100%;  
  	height: 100%;  
   	background:rgb(0, 0, 0, 0.4);  
  	position: fixed;  
  	top: 0;  
  	left: 0;  
  	z-index: 999;  
  	/* backdrop-filter: blur(5px); */
  	display: none;
  	align-items: center;
  	justify-content: center;
  }  

---- 룰렛 ----
canvas {
	margin-top: 100px;
	transition: 2s;
}

.roulette-container {
	width: 600px;
	display: flex;
	align-items: center;
	margin-top: 100px;
	flex-direction: column;
	position: absolute;
	top: 50%;
	left: 50%;
/* 	height-min: 1000px; */
/* 	overflow: hidden; */
 	transform: translate(-50%, -50%);
 	
}

.roulette-container::before {
	content: "";
	position: absolute;
	width: 10px;
	height: 50px;
	border-radius: 5px;
	background: #000;
	top: -20px;
	left: 50%;
	transform: translateX(-50%);
	z-index: 22;
}

#spinRoulette{
	padding: 15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background: #f82f62;
	border: 1px solid #f82f62;
	color:#fff;
}


</style>
<script src="/js/rouletteEvent.js"></script>
</head>


<body>
	<%@ include file="../../layout/header.jsp"%>
		<main>
		<div class="event-header">
		<div class="event-info">
			<div class="event-state"><b id="eventState"></b></div>
			<div id="eventTitle" class="event-title"></div>
		</div>
		<div id="eventPeriod" class="event-period"></div>
		</div>
		<div id="eventTotalContent">
		
		</div>
			
		<div id="eventSubmitButton"></div>
		<hr>
		<!-- a -->
		<div id="buttonBox"></div>
		
		<div id="background">
		<!-- modal -->
		<div id="eventModal" class="modal">
<!-- 		<div class="modal-box" id="modalBox"> -->
<!-- 			<div class="top-box"> -->
<!-- 				<span class="close"><a href="" onclick="closeMbtiModal()">&times;</a></span> -->
<!-- 			</div> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-title"></div> -->
<!-- 				<div id="mbtiResult"></div> -->
<!-- 				<div id="mbtiInfo-box"><span>당신은 <span id="mbtiInfo">분위기를 고조시키는 우호적인 사람</span>이군요?!</span></div> -->
<!-- 				<div>※ 500포인트가 지급되었어요</div> -->
<!-- 				<button type="button" id="myEvent" onclick="">이벤트 참여 내역</button><button type="button" id="home" onclick="moveHome()">메인으로</button> -->
<!-- 			</div> -->
<!-- 		</div> -->
		</div>
		
	</div>
	</main>
	<footer>
	
	</footer>
	
	<script>
	$(document).ready(function(){
		const urlParams = new URLSearchParams(window.location.search);
		let eventNo = urlParams.get('eventNo');
		console.log("eventNo: ",eventNo);
		
		let eventState = urlParams.get('eventState');
		console.log(eventState);
		
		if(eventNo === null || eventState === null){
			alert("올바르지 않은 경로입니다.");
		} 
		
		//진행중인 이벤트며 이벤트 번호에 따른 버튼 구성
		if(eventState == 1){
			const buttonStr2 = '<button type="button" id="backButton" onclick="backButton1()">이전</button>';
			document.getElementById("buttonBox").innerHTML = buttonStr2;
			document.getElementById('eventState').innerText = "진행중인 이벤트";
			document.querySelector('#eventState').style.color = '#2275a4';
			if(eventNo == 6){
				const buttonStr1 = '<input type="button" id="submitEvent" value="참여하기" onclick="submitMbtiEvent(event)">';
				document.getElementById("eventSubmitButton").innerHTML = buttonStr1;
			} else if(eventNo == 15){
				const buttonStr1 = '<input type="button" id="spinRoulette" value="룰렛 돌리기" onclick="rotate()">';
				document.getElementById("eventSubmitButton").innerHTML = buttonStr1;
			} else if(eventNo == 17){
				const buttonStr1 = '<input type="button" id="submitEvent" value="참여하기" onclick="submitTicketEvent(event)">';
				document.getElementById("eventSubmitButton").innerHTML = buttonStr1;
			}
		} else if(eventState == 0){
			document.getElementById('eventState').innerText = "종료된 이벤트";
			document.querySelector('#eventState').style.color = '#2275a4';
			const buttonStr2 = '<button type="button" id="backButton" onclick="backButton0()">이전</button>';
			document.getElementById("buttonBox").innerHTML = buttonStr2;
		}
		//mbti이벤트
		if(eventNo == 6){
			let eventNo6 = '';
			eventNo6 += '<div id="eventContent"></div>';
			eventNo6 += '<div id="eventSubmitButton"></div>';
			eventNo6 += '<hr>';
			eventNo6 += '<div id="buttonBox"></div>';
			eventNo6 += '<div id="background">';
			eventNo6 += '<div id="eventModal" class="modal">';
			eventNo6 += '<div class="modal-box" id="modalBox">';
			eventNo6 += '<div class="top-box">';
			eventNo6 += '<span class="close"><a href="" onclick="closeModal()">&times;</a></span></div>';
			eventNo6 += '<div class="modal-content">';
			eventNo6 += '<div class="modal-title">당신의 mbti는</div>';
			eventNo6 += '<div id="mbtiResult"></div>';
			eventNo6 += '<div id="mbtiInfo-box"><span>당신은 <span id="mbtiInfo"></span>이군요?!</span></div>';
			eventNo6 += '<div>※ 500포인트가 지급되었어요</div>';
			eventNo6 += '<button type="button" id="myEvent" onclick="">이벤트 참여 내역</button><button type="button" id="home" onclick="moveHome()">메인으로</button>';
			eventNo6 += '</div></div></div>';
			document.getElementById("eventTotalContent").innerHTML = eventNo6;
		}
		//룰렛이벤트
		if(eventNo == 15){
			const eventTotalContent = document.getElementById("eventTotalContent");
			let eventNo15 = '';
			eventNo15 += '<div class="roulette-container">';
			eventNo15 += '<canvas id="roulette" width="500" height="500"></canvas>';
			eventNo15 += '</div>';
			eventTotalContent.innerHTML = eventNo15;
			roulette();
		};
		
		if(eventNo == 17){
// 			const eventTotalContent = document.getElementById("eventTotalContent");
// 			let eventNo17 = '';
// 			eventNo17 += '<div class=""><li><ul>진행일정 : 7/22~7/31</ul><ul>당첨 발표 : 8/1</ul><ul>참여 방법 : 하단에 참여하기 버튼을 클릭 후 티켓 인증 사진 업로드!!</ul><ul>증정 경품 : 10,000포인트</ul></li></div>';
// 			eventNo17 += '<input type="file" name="ticket">';
// 			eventTotalContent.innerHTML = eventNo17;
			
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
					//DB에 데이터 넣을 시 알맞게 수정
					if(eventNo == 6){
						document.getElementById("eventContent").innerHTML = data.eventContent;
					} else if(eventNo == 17){
						document.getElementById("eventTotalContent").innerHTML= data.eventContent;
					}
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
	
	function submitMbtiEvent(event){
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
				document.getElementById("mbtiResult").innerText = mbtiResult;
				document.getElementById("mbtiInfo").innerText = this.responseText;
				//alert(this.responseText);
				openMbtiModal();
				
			} else {
				alert(this.responseText);
			}
		};
		xhttp.open("POST", "http://localhost:9001/api/v1/event/member/form");
		xhttp.setRequestHeader("Content-type", "application/json");
		
		const token = localStorage.getItem("jwtToken");
		xhttp.setRequestHeader("token", token);
		console.log(token);
		xhttp.send(sendData);
	}
	
	function submitTicketEvent(event){
		const ticketImg = getElementById("ticketImg");
		console.log(ticketImg);
		
	}
	
	function backButton0(){
		window.location.href="/event/commonList?eventState=0";
	}
	
	function backButton1(){
		window.location.href="/event/commonList?eventState=1";
	}
	
	function moveHome(){
		window.location.href="/";
	}
	
	function openMbtiModal(){
		const modal = document.getElementById("eventModal");
		modal.style.display = "block";
		
		const background = document.getElementById("background");
		document.body.classList.add('no-scroll');
		document.body.style.backgroundColor = "rgba(0, 0, 0, 0.5) !important";
		background.style.display = "flex";
	}
	
	function closeMbtiModal(){
		const modal = document.getElementById("eventModal");
		modal.style.display = "none";
	}
	
	</script>
</body>
</html>