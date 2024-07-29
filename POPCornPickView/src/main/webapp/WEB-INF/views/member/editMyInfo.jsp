<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 수정페이지</title>
<style>

main {
	width: 1200px;
	margin: 80px auto;
/* 	min-height: 700px; */
	border:1px solid #eee;
}

.flex-box {
	display: flex;
	box-sizing: border-box;
}

.myInfo {
	margin-left: 30px;
}

.myInfo h2 {
	margin: 30px 0;
}

table {
	margin-top: 30px;
	box-sizing: border-box;
}

th {
	width: 235px;
	background-color: #C6C6C6;
	text-align: left;
	box-sizing: border-box;
	font-size: 20px;
	padding: 20px 0 20px 30px;;
	font-weight: bold;
}

td {
	width: 725px;
	box-sizing: border-box;
	font-size: 20px;
	padding: 20px 0 20px 35px;
}

input {
	width: 450px;
	height: 30px;
	padding: 0 10px;
}

.Btns {
	text-align: center;
	margin-top: 30px;
}

input[type='button'] {
	width: 150px;
	height: 40px;
	margin: 10px 50px;
	border: none;
	border-radius: 8px;
}

#editBtn {
	color: #fff;
	background-color: #d9534f;
}

#cancerBtn {
	color: #ffffff;
	background-color: #8C8C8C;
}

#editBtn:hover {
	background-color: #c9302c;
}

#cancerBtn:hover {
	background-color: #5D5D5D;
}

#confirm-text {
	margin: 0 20px;
	font-size: 14px;
}

.correct {
	color: green;
}

.incorrect {
	color: red;
}



</style>
</head>
<body>
	<header>
		<%@ include file="../member/mainInfo.jsp"%>
	</header>
	<main>
		<div class="flex-box">
			<div class="sidebar">
				<%@ include file="../member/sideMenu.jsp"%>
			</div>
			<div class="myInfo">
				<h2>개인정보 수정</h2>
				<form id="frm">
				<table border="1">
					<tr>
						<th>이름</th>
						<td id="name"></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td id="id"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td id="birthDate"></td>
					</tr>
					<tr>
						<th>휴대전화번호</th>
						<td ><input id="tel" type="tel" placeholder="전화번호를 입력해주세요."></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td ><input id="email" type="email" placeholder="email을 입력해주세요."></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" placeholder="비밀번호를 입력해주세요." id="password" onkeyup="passwordCheck()"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" placeholder="한번 더 비밀번호를 입력해주세요." id="passwordConfirm" onkeyup="passwordCheck()"><span id="confirm-text"></span></td>
					</tr>
				</table>
				<div class="Btns">
					<input type="button" value="수정" id="editBtn" onclick="editMyInfo()"><input type="button" value="취소" id="cancerBtn" onclick="cancer()">
				</div>
				</form>
			</div>
		</div>
	</main>
	<footer>
		
	</footer>
	<script>
			
		document.addEventListener("DOMContentLoaded", () =>{
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				const member = JSON.parse(this.responseText);
				document.querySelector("#name").innerHTML = member.name;
				document.querySelector("#id").innerHTML = member.username;
				document.querySelector("#birthDate").innerHTML = member.birthdate;
				document.querySelector("#tel").value = member.tel;
				document.querySelector("#email").value = member.email;
				console.log(document.querySelector("#id").textContent);
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/mem/memberInfo");
			xhttp.setRequestHeader("Authorization", token);
			xhttp.send();
		});
		
		function passwordCheck(){
			const password2 = document.querySelector("#password").value;
			const confirmPassword2 = document.querySelector("#passwordConfirm").value;
			const text = document.querySelector("#confirm-text");
			
			if(password2 === confirmPassword2){
				text.textContent = "비밀번호가 일치합니다.";
				text.classList.add('correct');
				text.classList.remove('incorrect');
			}else {
				text.textContent = "비밀번호가 일치하지 않습니다.";
				text.classList.add('incorrect');
				text.classList.remove('correct');
			}
			
		}
		
		function editMyInfo(){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			const data = {
					name: document.querySelector("#name").textContent,
					username: document.querySelector("#id").textContent,
					birthdate: document.querySelector("#birthDate").textContent,
					tel: document.querySelector("#tel").value,
					email: document.querySelector("#email").value,
					password: document.querySelector("#password").value
			}
			const sendData = JSON.stringify(data);
			
			xhttp.onload = function(){
				console.log(this.responseText);
				if(xhttp.status === 200){
					alert(this.responseText);
					window.location.href = "/member/myInfo";
				}else {
					alert(this.responseText);
				}
				
			}
			
			xhttp.open("PUT", "http://localhost:9001/api/v1/mem/editMyInfo");
			xhttp.setRequestHeader("Authorization", token);
			xhttp.setRequestHeader("Content-Type", "application/json");
			xhttp.send(sendData);
		}
		
		function cancer(){
			window.location.href = "/member/myInfo";
		}
	</script>

</body>
</html>