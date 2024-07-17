<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 등록</title>
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

.sidebar-box2 p:nth-child(2) a{
	color: #816bff !important;
}

h2 {
	margin-bottom: 20px;
	font-weight: 600;
	font-size: 22px;
}

label b{
	display: inline-block;
	width: 160px;
	font-weight: 500;
}

label b span{
	color: red;
	font-weight: 400;
	padding-left: 8px;
	font-size: 14px;
}

input[type="text"]{
	width: 460px;
	height: 50px;
	border: 1px solid #dadada;
	border-radius: 0;
	box-sizing: border-box;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	margin-bottom: 20px;
}

input[type="date"]{
	width: 200px;
	height: 50px;
	border: 1px solid #dadada;
	border-radius: 0;
	box-sizing: border-box;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	margin-bottom: 20px;
}

textarea {
	width: 460px;
	height: 50px;
	border: 1px solid #dadada;
	border-radius: 0;
	box-sizing: border-box;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	margin-bottom: 20px;
    vertical-align: top;
}

#submitWrite {
	padding: 15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background: #816bff;
	border: 1px solid #816bff;
	color:#fff;
	margin-left: 300px;
}

#submitModify {
	padding: 15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background: #816bff;
	border: 1px solid #816bff;
	color:#fff;
	margin-left: 300px;
}

textarea{
	width: 500px;
	height: 500px;
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
			<h2>이벤트 등록</h2>
			<form name="eventFrm">
				<input type="hidden" name="eventNo" id="eventNo">
				<label for="startEvent" id="startEvent"><b>시작일<span>*</span></b></label>
				<input type="date" name="startEvent" id="startEvent"><br>
				<label for="endEvent"><b>종료일<span>*</span></b></label>
				<input type="date" name="endEvent" id="endEvent"><br>
				<label for="eventTitle"><b>제목<span>*</span></b></label>
				<input type="text" name="eventTitle" id="eventTitle"><br>
				<label for="eventContent"><b>내용<span>*</span></b></label>
				<textarea name="eventContent" id="eventContent">
	
				</textarea><br>
				<label for="eventFile"><b>파일등록<span>*</span></b></label>
				<input type="file" name="eventFile" id="eventFile"><br>
				<input type="button" id="submitWrite" value="등록하기" onclick="submitEvent(event)">
				<input type="button" id="submitModify" value="수정하기" onclick="submitEventModify(event)">
			</form>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const xhttp = new XMLHttpRequest();
		const urlParams = new URLSearchParams(window.location.search);
		let eventNo = urlParams.get('eventNo');
		
		var writeForm = $('#submitWrite');
		var modifyForm = $('#submitModify');
		
		if(eventNo){
			writeForm.hide();
			modifyForm.show();
			eventModify(eventNo);
		} else{
			writeForm.show();
			modifyForm.hide();
		}
	});
	
	
	function submitEvent(event){
		event.preventDefault();
		
		var form = document.forms['eventFrm'];
		var formData = new FormData(form);
		
		formData.forEach((value, key) => {
			console.log(key + " : " + value);
		});
		
		const jwtToken = localStorage.getItem("jwtToken");
		console.log("jwtToken", jwtToken);
		
		$.ajax({
			type : "POST",
			enctype : 'multipart/form-data',
			url : "http://localhost:9001/api/v1/event",
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			cache : false,
			headers: {
				"Authorization" : "Bearer " + jwtToken
			},
			success : function(data){
				alert("이벤트 등록이 완료되었습니다.");
				window.location.href="/event/allList";
			},
			error : function(e){
				console.log("error : ",e );
			}
		});
	}
	
	function submitEventModify(event){
		event.preventDefault();
		
		var form = document.forms['eventFrm'];
		var formData = new FormData(form);
		
		formData.forEach((value, key) => {
			console.log(key + " : " + value);
		});
		
		$.ajax({
			type : "PUT",
			enctype : 'multipart/form-data',
			url : "http://localhost:9001/api/v1/event",
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			cache : false,
			success : function(data){
				alert(data);
				window.location.href="/event/allList";
				//alert("지점 정보 수정이 완료되었습니다.");
			},
			error : function(e){
				console.log("error : ", e);
			}
		});
	}
	
	function eventModify(eventNo){
		console.log('modify');
		$.ajax({
			url : "http://localhost:9001/api/v1/event/detail",
			type : "GET",
			data : {
				eventNo : eventNo
			},
			success : function(data){
				console.log(data);
				console.log(data.startEvent);
				$('#eventNo').val(data.eventNo);
				$('#startEvent').val(data.startEvent);
				$('#endEvent').val(data.endEvent);
				$('#eventTitle').val(data.eventTitle);
				$('#eventContent').val(data.eventContent);
				$('#eventFile').val(data.eventOriginName);
			},
			error : function(error){
				alert("정보를 불러오는데 실패했습니다. 다시 시도해 주세요.");
				window.location.href="/event/detail?eventNo="+eventNo;
			}
		});
	}
	</script>
</body>
</html>
