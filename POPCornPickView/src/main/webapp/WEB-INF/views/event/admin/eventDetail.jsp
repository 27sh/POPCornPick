<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 이벤트 상세조회</title>
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

h2{
	margin-bottom: 20px;
	font-weight: 400;
	font-size: 22px;
}


#eventDetail .table{
	width: 100%;
}

#submitDelete {
	padding: 15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size: 15px;
	cursor: pointer;
	margin: 0 10px;
	background:#f1f1f1;
	border:1px solid #ccc;
	color:#333;
	margin-top: 30px;
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
	margin-left: 200px;
}

label b{
	display: inline-block;
	width: 160px;
	font-weight: 500;
	margin-top: 40px;
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
<body>
<%@ include file="../../layout/adminHeader.jsp"%>
	<main>
		<div class="sidebar-container">
			<%@ include file="../../layout/serviceSideBar.jsp"%>
		</div>
		<div id="container">
			<h2>이벤트 상세</h2>
			<div id="eventDetail">
				
				
			</div>
			<div><img src='' id="myImage"></div>
			<div><span id="modifyButton"></span><span id="deleteButton"></span></div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const urlParams = new URLSearchParams(window.location.search);
		let eventNo = urlParams.get('eventNo');
// 		console.log(eventNo);
		
		if(eventNo === null){
			alert("올바르지 않은 경로입니다.");
		}
		
		$.ajax({
			url : "http://localhost:9001/api/v1/admin/event/detail",
			type : "GET",
			data : {
				eventNo : eventNo
			},
			success : function(data) {
// 				console.log(data);
				if(data != null){
					var image = document.getElementById('myImage');
					const filename = data.eventImgNewName;
// 					console.log("newName",filename);
// 					console.log("startDate : ", data.startEvent);
	
					let detail = '';
					detail += '<label for="eventNo" id="eventNo"><b>이벤트 번호</b></label>';
					detail += '<span id="result">'+ data.eventNo +'</span><br>';
					detail += '<label for="eventTitle" id="eventTitle"><b>이벤트 제목</b></label>';
					detail += '<span id="result">'+ data.eventTitle +'</span><br>';
					detail += '<label for="startEvent" id="startEvent"><b>이벤트 시작일</b></label>';
					detail += '<span id="result">'+ data.startEvent +'</span><br>';
					detail += '<label for="endEvent" id="endEvent"><b>이벤트 종료일</b></label>';
					detail += '<span id="result">'+ data.endEvent +'</span><br>';
					detail += '<label for="eventContent" id="eventContent"><b>이벤트 내용</b></label><br><br>';
					detail += '<span id="result">'+ data.eventContent +'</span><br>';
					detail += '<label for="eventImg" id="eventImg"><b>이벤트 대표 이미지</b></label>';
					document.getElementById("eventDetail").innerHTML = detail;
					
					image.src = '/img/' + data.eventImgOriginName;
					const buttonStr1 = '<input type="button" id="submitModify" value="수정하기" onclick="submitCinemaModify('+ data.eventNo +')">';
					const buttonStr2 = '<input type="button" id="submitDelete" value="삭제하기" onclick="submitCinemaDelete('+ data.eventNo +')">';
					document.getElementById("modifyButton").innerHTML = buttonStr1;
					document.getElementById("deleteButton").innerHTML = buttonStr2;
				} else {
					alert("불러오는데 실패했습니다. 다시 시도해주세요.");
				}
			},
			error : function(error) {
				alert("불러오는데 실패했습니다. 다시 시도해주세요.", error);
			}
		});
		
	});
	
	function submitCinemaModify(eventNo){
		window.location.href="/event/regist?eventNo=" + eventNo;
	}
	
	function submitCinemaDelete(eventNo){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			if (this.status === 200) {
				alert(this.responseText);
				window.location.href = "/event/allList";
			} else {
				alert(this.responseText);
			}
		};
		xhttp.open("DELETE", "http://localhost:9001/api/v1/admin/event?eventNo=" + eventNo);
		xhttp.send();
	}
	
	
	
	</script>
</body>
</html>