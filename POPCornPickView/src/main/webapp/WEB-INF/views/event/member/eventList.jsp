<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
}

#container{
	width: 1100px;
	margin: 0 auto;
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

hr{
	color: #CCC;
}

#eventContainer{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	margin: 20px;
}

.eventItem {
    border: 1px solid #ccc;
    width: 314px;
    margin-bottom: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: left;
    padding-bottom: 15px;
}

.eventItem img {
	width: 314px;
	height: 170px;
}

.eventTitle {
	padding: 18px 11px 0 11px;
    margin-bottom: 10px;
	font-weight: 500;
	font-size: 18px;
}

.eventDate {
    font-size: 13px;
    margin-bottom: 5px;
    color: #6a6f77;
    padding: 18px 11px 0 11px;
}

</style>
</head>
<%@ include file="../../layout/header.jsp"%>
<body>
	<main>
		<div id="container">
			<div id="titleContainer">
				<span id="bigTitle">진행중인 이벤트</span>
				<span id="smallTitle">
					<a href="/event/commonList?eventState=1">진행중인 이벤트</a>&nbsp;| <a href="#">응모 내역</a>&nbsp;| <a href="/event/commonList?eventState=0">종료된 이벤트</a>
				</span>
			</div>
			<hr>
			<div id="eventContainer">
			
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
		
		if(eventState == null ){
			alert("올바르지 않은 경로입니다.");
			window.location.href="/";
		} else if(eventState == 1){
			getProgressEvent();
		} else if(eventState == 0){
			getEndEvent();
		} else{
			alert("올바르지 않은 경로입니다.");
			window.location.href="/";
		}
	});
	
	function getProgressEvent(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			if(this.readyState == 4 && this.status == 200){
				const data = JSON.parse(this.responseText);
				console.log(data);
				if(data != null && data.length > 0){
					let list = '';
					for(let i = 0 ; i < data.length ; i++){
						list += '<a href="/event/commonDetail?eventState=1&eventNo='+ data[i].eventNo +'">';
						list += '<div class="eventItem">';
						list += '<img src="/img/'+ data[i].eventImgOriginName +'" alt="'+ data[i].eventTitle +'">';
						list += '<div class="eventTitle">'+ data[i].eventTitle +'</div>';
						list += '<div class="eventDate">'+ data[i].startEvent + ' ~ ' + data[i].endEvent +'</div>';
						list += '</div></a>';
					}
					document.getElementById("eventContainer").innerHTML = list;
					
				} else{
					document.getElementById("eventContainer").innerHTML = list;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		xhttp.open("GET", "http://localhost:9001/api/v1/event/progress", true);
		xhttp.send();
		
		document.querySelector('#smallTitle a:nth-child(1)').style.color = '#f82f62';
	}
	
	function getEndEvent(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			if(this.readyState == 4 && this.status == 200){
				const data = JSON.parse(this.responseText);
				console.log(data);
				if(data != null && data.length > 0){
					let list = '';
					for(let i = 0 ; i < data.length ; i++){
						list += '<a href="/event/commonDetail?eventState=0&eventNo='+ data[i].eventNo +'">';
						list += '<div class="eventItem">';
						list += '<img src="/img/'+ data[i].eventImgOriginName +'" alt="'+ data[i].eventTitle +'">';
						list += '<div class="eventTitle">'+ data[i].eventTitle +'</div>';
						list += '<div class="eventDate">'+ data[i].startEvent + ' ~ ' + data[i].endEvent +'</div>';
						list += '</div></a>';
					}
					document.getElementById("eventContainer").innerHTML = list;
					
				} else{
					document.getElementById("eventContainer").innerHTML = list;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("지점 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		xhttp.open("GET", "http://localhost:9001/api/v1/event/end", true);
		xhttp.send();
		document.getElementById('bigTitle').innerHTML = "종료된 이벤트";
		document.querySelector('#smallTitle a:nth-child(3)').style.color = '#f82f62';
	}
	
	
	
	</script>
</body>
</html>