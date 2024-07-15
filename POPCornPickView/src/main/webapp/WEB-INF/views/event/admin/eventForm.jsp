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
	font-weight: 400;
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

textarea{
	width: 500px;
	height: 500px;
}

</style>
</head>
<body>
	<header>
		<%@ include file="../../layout/adminHeader.jsp"%>
	</header>
	<main>
	<div class="sidebar-container">
			<%@ include file="../../layout/serviceSideBar.jsp"%>
		</div>
		<div id="container">
			<h2>이벤트 등록</h2>
			<form name="eventFrm">
				<label for="startEvent" id="startEvent"><b>시작일<span>*</span></b></label>
				<input type="date" name="startEvent"><br>
				<label for="endEvent"><b>종료일<span>*</span></b></label>
				<input type="date" name="endEvent"><br>
				<label for="eventTitle"><b>제목<span>*</span></b></label>
				<input type="text" name="eventTitle"><br>
				<label for="eventContent"><b>내용<span>*</span></b></label>
				<textarea name="eventContent">
	<div>
		<p>1. 친구들을 만나고 집으로 돌아갈 때 당신은?</p>
		<input type="radio" id="q1a1" name="q1" value="E">
		<label for="q1a1">아~ 잘놀았다! 충전완료~!</label>
		<input type="radio" id="q1a2" name="q1" value="I">
		<label for="q1a2">아~ 잘놀았다! 이제 집에 가서 쉬어야지...</label>
	</div>
	<div>
		<p>2. 말이 술집에 들어가서 하는 말은?</p>
		<input type="radio" id="q2a1" name="q2" value="N">
		<label for="q2a1">우유랑 당근 주문요~</label>
		<input type="radio" id="q2a2" name="q2" value="S">
		<label for="q2a2">말이 술집에 왜 들어가..?</label>
	</div>
	<div>
		<p>3. 달을 봤는데 너 생각이 나서 전화했어!</p>
		<input type="radio" id="q3a1" name="q3" value="F">
		<label for="q3a1">(헐 감동이야ㅠㅜ)</label>
		<input type="radio" id="q3a2" name="q3" value="T">
		<label for="q3a2">(왜..?)</label>
	</div>
	<div>
		<p>4. 약속이 잡혔다면?</p>
		<input type="radio" id="q4a1" name="q4" value="J">
		<label for="q4a1">약속에 늦지 않게 미리 나간다.</label>
		<input type="radio" id="q4a2" name="q4" value="P">
		<label for="q4a2">약속에 맞춰서 나가야지!</label>
	</div>
				</textarea><br>
				<label for="eventFile"><b>파일등록<span>*</span></b></label>
				<input type="file" name="eventFile"><br>
				<input type="button" id="submitWrite" value="등록하기" onclick="submitMbti(event)">
				<input type="hidden" id="eventModifySubmit" value="수정하기" onclick="">
			</form>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	function submitMbti(event){
		event.preventDefault();
		
		var form = document.forms['eventFrm'];
		var formData = new FormData(form);
		
		formData.forEach((value, key) => {
			console.log(key + " : " + value);
		});
		
		$.ajax({
			type : "POST",
			enctype : 'multipart/form-data',
			url : "http://localhost:9001/api/v1/event",
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			cache : false,
			success : function(data){
				alert("이벤트 등록이 완료되었습니다.");
				//window.location.href="/cinema/list";
			},
			error : function(e){
				console.log("error : ",e );
			}
		});
			
	}
	</script>
</body>
</html>
