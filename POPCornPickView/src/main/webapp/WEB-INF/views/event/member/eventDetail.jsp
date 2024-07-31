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
	height: 560px;
	height: auto;
	overflow: visible;
	margin-left: 400px;
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

#submitEvent, #spinRoulette{
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
  	display: none;
  	align-items: center;
  	justify-content: center;
  }  

---- 룰렛 ----
canvas {
	width: 500px;
	height: 500px;
	transition: 2s;
}
.roulette-container {
 	position: relative; 
	width: 500px;
	height: 500px;
	margin: 50px auto;
	z-index: 1;
}

 .pointer{  
 	position: absolute;  
 	top: 0;  
 	left: 50%;  
 	width: 20px;  
 	height: 40px;  
 	background: red;  
 	transform: translateX(-50%) rotate(180deg);
 	
 	clip-path: polygon(50% 0%, 0% 100%, 100% 100%);  
 	z-index: 3;
 	rotate: 
 	  
 }  

#rouletteCanvas{
	width: 100%;
	height: 100%;	
 	position: absolute;  
 	top: 0;
 	left: 0;
 	z-index: 2;
 	transform-origin: center;
}


</style>
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
			if(eventNo == 2){
				const buttonStr1 = '<input type="button" id="submitEvent" value="참여하기" onclick="submitMbtiEvent(event)">';
				document.getElementById("eventSubmitButton").innerHTML = buttonStr1;
			} else if(eventNo == 1){
				const buttonStr1 = '<input type="button" id="spinRoulette" value="룰렛 돌리기" onclick="spinButton('+eventNo+')">';
				document.getElementById("eventSubmitButton").innerHTML = buttonStr1;
			} 
		} else if(eventState == 0){
			document.getElementById('eventState').innerText = "종료된 이벤트";
			document.querySelector('#eventState').style.color = '#2275a4';
			const buttonStr2 = '<button type="button" id="backButton" onclick="backButton0()">이전</button>';
			document.getElementById("buttonBox").innerHTML = buttonStr2;
		}
		//mbti이벤트
		if(eventNo == 2){
			let mbti = '';
			mbti += '<div id="eventContent"></div>';
			mbti += '<div id="eventSubmitButton"></div>';
			mbti += '<div id="buttonBox"></div>';
			mbti += '<div id="background">';
			mbti += '<div id="eventModal" class="modal">';
			mbti += '<div class="modal-box" id="modalBox">';
			mbti += '<div class="top-box">';
			mbti += '<span class="close"><a href="" onclick="closeModal()">&times;</a></span></div>';
			mbti += '<div class="modal-content">';
			mbti += '<div class="modal-title">당신의 mbti는</div>';
			mbti += '<div id="mbtiResult"></div>';
			mbti += '<div id="mbtiInfo-box"><span>당신은 <span id="mbtiInfo"></span>이군요?!</span></div>';
			mbti += '<div>※ 500포인트가 지급되었어요</div>';
			mbti += '<button type="button" id="myEvent" onclick="myPage()">이벤트 참여 내역</button><button type="button" id="home" onclick="moveHome()">메인으로</button>';
			mbti += '</div></div></div>';
			document.getElementById("eventTotalContent").innerHTML = mbti;
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
					if(eventNo == 3){
						document.getElementById("eventContent").innerHTML = data.eventContent;
					} else if(eventNo == 2){
						document.getElementById("eventTotalContent").innerHTML= data.eventContent;
					} else if(eventNo == 1){
						let canvas = '<div class="roulette-container">';
						canvas += '<div class="pointer"></div>';
						canvas += '<canvas id="roulettecanvas" width="500" height="500"></canvas></div>';
						document.getElementById("eventTotalContent").innerHTML = canvas;
						drawRoulette();
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
	
	const items = [
		{name : "10 포인트", color : "#FF6384"},
		{name : "500 포인트", color : "#36A2EB"},
		{name : "할인쿠폰 1000원", color : "#FFCE56"},
		{name : "할인쿠폰 5000원", color : "#4BC0C0"}
	];
	
	const weightedItems = [
		...Array(50).fill(0),
		...Array(25).fill(1),
		...Array(15).fill(2),
		...Array(10).fill(3)
		
	];
	
	function drawRoulette(){
		const canvas = document.getElementById("roulettecanvas");
		
		const ctx = canvas.getContext('2d');
		
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		
		const totalItems = items.length;
		const arc = Math.PI * 2 / totalItems;
		const startAngle = -Math.PI / 2;
		
		for(let i = 0 ; i < totalItems ; i++){
			ctx.beginPath();
			ctx.fillStyle = items[i].color;
			ctx.moveTo(250, 250);
			ctx.arc(250, 250, 200, startAngle + i * arc, startAngle + (i + 1) * arc);
			ctx.lineTo(250, 250);
			ctx.fill();
			
			ctx.save();
			ctx.translate(250, 250);
			ctx.rotate(startAngle + i * arc + arc / 2);
			ctx.textAlign = "right";
			ctx.fillStyle = "#fff";
			ctx.font = "bold 16px Arial";
			ctx.fillText(items[i].name, 180, 0);
			ctx.restore();
		}
		console.log("룰렛 그리기 끝");
	}
	
	function spinButton(eventNo){
		console.log("spinButton함수 실행..");
		const canvas = document.getElementById('roulettecanvas');
// 		const items = ["할인쿠폰 5000원","10 포인트","할인쿠폰 1000원","500포인트"];
		
		const randomIndex = weightedItems[Math.floor(Math.random() * weightedItems.length)];
		const seletedItem = items[randomIndex].name;
		
		console.log("randomIndex" + randomIndex, "seletedItem: " + seletedItem);
		
		const segmentAngle = 360 / items.length;
		let targetAngle = '';
		if(randomIndex == 0){
			targetAngle = 315;
		} else if(randomIndex == 1){
			targetAngle = 225;
		} else if(randomIndex == 2){
			targetAngle = 135;
		} else if(randomIndex == 3){
			targetAngle = 45;
		}
		
		const totalRotation = 360 * 4 + targetAngle;
		
		console.log("segmentAngle : " + segmentAngle + " targetAngle : " + targetAngle + " totalRotation : " + totalRotation);
		canvas.style.transition = 'transform 5s cubic-bezier(0.25, 0.1, 0.25, 1)';
		canvas.style.transform = 'rotate('+ totalRotation +'deg)';
		
		setTimeout(function(){
			sendResultToServer(seletedItem, eventNo);
		}, 5000);
	}
	
	function sendResultToServer(seletedItem, eventNo){
		console.log(seletedItem);
		console.log(eventNo);
		const jwtToken = localStorage.getItem("jwtToken");
		
		if(!jwtToken){
			alert("로그인을 해주세요.");
			return ;
		}
		$.ajax({
			url : "http://localhost:9001/api/v1/event/roulette",
			type : "POST",
			data : {
				eventNo : eventNo,
				participationResult : seletedItem
			},
			headers: {
				"Authorization" : "Bearer " + jwtToken
			},
			success : function(data) {
				if(data != null){
					alert(data);
				}
			},
			error : function(jqXHR, textStatus, errorThrown) {
				if(jqXHR.status === 400){
					var errorMessage = jqXHR.responseText;
					alert(errorMessage);
				} else{
					alert("불러오는데 실패했습니다. 다시 시도해주세요.");
				}
			}
		});
		
		
	}
	
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
		const ticketImg = document.getElementById("ticketImg").value;
		console.log(ticketImg);
		const urlParams = new URLSearchParams(window.location.search);
		let eventNo = urlParams.get('eventNo');
		console.log("eventNo22 : ", eventNo);
		
		var formData = new FormData();
		formData.append("file", ticketImg);
		formData.append("eventNo", eventNo);
		
		console.log("formData : ", formData);
		
		$.ajax({
			type : "POST",
			enctype : 'multipart/form-data',
			url : "http://localhost:9001/api/v1/event/ticketEvent",
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			cache : false,
			headers: {
				"Authorization" : "Bearer " + jwtToken
			},
			success : function(data){
				alert("참여되었습니다.^^");
			},
			error : function(e){
				console.log("error : ",e );
			}
		});
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
	
	function myPage(){
		window.location.href="/myPage/pointList";
	}
	</script>
</body>
</html>