<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}

main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
	padding: 20px;
}

.join-wrapper {
	max-width: 400px;
	margin: 0 auto;
	text-align: left;
}

.join-wrapper h2, p {
	text-align: center;
	position: relative;
}

.join-wrapper h2 {
	margin-bottom: 10px;
}

.join-wrapper p {
	margin-bottom: 30px;
}

span {
	display: inline-block;
	width: 70px;
}

.input-group {
	width: 400px;
	
}

.input {
	width: 230px;
	padding: 8px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin-bottom: 15px;
	
}

.input-group-radio {
	margin-bottom: 15px;
}

.input-button {
	width: 400px;
	position: relative;
	left: 90px;
	
}

#joinBtn, #backBtn{
	padding: 10px;
	margin-top: 10px;
	margin-right: 30px;
	border-radius: 5px;
	border: 2px ;
}

#joinBtn {
	background-color: #d9534f;
	color: #fff;
}

#backBtn {
	background-color: #ffffff;
	font-weight: bold;
}

#joinBtn:hover {
	background-color: #FF6347;
	cursor: pointer;
}

#backBtn:hover {
	background-color: #D3D3D3;
	cursor: pointer;
}

</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div class="join-wrapper">
			<h2>회원가입</h2>
			<p>회원이 되어 다양한 혜택을 누려보세요!</p>
			<div class="joinBox">
				<form name="frm" >
					<div class="input-group">
						<span>아이디 </span>
						<input type="text" class="input" id="id" name="username" placeholder="아이디를 입력하세요.">
					</div>
					<div class="input-group">
						<span>비밀번호 </span>
						<input type="password" class="input" id="password" name="password" placeholder="비밀번호를 입력하세요.">
					</div>
					<div class="input-group">
						<span>이름 </span>
						<input type="text" class="input" id="name" name="name" placeholder="이름을 입력하세요.">
					</div>
					<div class="input-group-radio">
						<span>성별 </span>
						<label><input type="radio" id="genderM" name="gender" value="남자"> 남자 </label>
						<label><input type="radio" id="genderF" name="gender" value="여자"> 여자 </label>
					</div>
					<div class="input-group">
						<span>생년월일</span>
						<input type="date" class="input" id="birthdate" name="birthdate" placeholder="생년월일을 입력하세요.">
					</div>
					<div class="input-group-radio">
						<span>통신사 </span>
						<label><input type="radio" id="telecomSKT" name="telecom" value="SKT"> SKT </label>
						<label><input type="radio" id="telecomKT" name="telecom" value="KT"> KT </label>
						<label><input type="radio" id="telecomLG" name="telecom" value="LG"> LG </label>
					</div>
					<div class="input-group">
						<span>전화번호 </span>
						<input type="tel" class="input" id="tel" name="tel" placeholder="전화번호를 입력하세요.">
					</div>
					<div class="input-group">
						<span>이메일 </span>
						<input type="email" class="input" id="email" name="email" placeholder="이메일을 입력하세요.">
					</div>
					<div class="input-button">
						<button type="button" onclick="joinProc()" id="joinBtn">회원가입</button>
						<button type="button" onclick="goBack()" id="backBtn">취소</button>
					</div>
				</form>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
		function joinProc(){
			const xhttp = new XMLHttpRequest();
			const data = {
					username: document.querySelector("#id").value,
					password: document.querySelector("#password").value,
					name: document.querySelector("#name").value,
					gender: document.querySelector("input[name='gender']:checked").value,
					birthdate: document.querySelector("#birthdate").value,
					telecom: document.querySelector("input[name='telecom']:checked").value,
					tel: document.querySelector("#tel").value,
					email: document.querySelector("#email").value,
					role: "ROLE_MEMBER"
			}
			const sendData = JSON.stringify(data);
			
			xhttp.onload = function(){
				alert(this.responseText);
				if(this.responseText == "가입 성공"){
					window.location.href = "/";
				}else {
					window.location.href = "/joinForm";
				}
			}
			
			xhttp.open("POST", "http://localhost:9001/api/v1/join");
			xhttp.setRequestHeader("Content-type", "application/json");
			xhttp.send(sendData);
		}
	</script>
</body>
</html>