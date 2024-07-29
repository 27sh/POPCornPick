<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 관리 페이지</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
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

.myInfo h2 {
	margin: 20px 0;
}

.myInfo p {
	margin: 20px 0;
/* 	font-size:  */
}

.myInfo {
	margin-left: 40px;
}

table {
	margin-top: 30px;
	box-sizing: border-box;
}

th {
	width: 235px;
	background-color: #D2D2D2;
	text-align: left;
	box-sizing: border-box;
	font-size: 20px;
	padding: 30px 0 30px 30px;;
	font-weight: bold;
}

td {
	width: 715px;
	box-sizing: border-box;
	font-size: 20px;
	padding: 30px 0 30px 50px;
}

.Btns {
	text-align: center;
}

.Btns input[type='button'] {
	width: 150px;
	height: 60px;
	margin: 20px 50px;
	border: none;
	border-radius: 8px;
}

#putBtn {
	color: #fff;
	background-color: #d9534f;
}

#putBtn:hover {
	background-color: #c9302c;
}

#deleteBtn {
	color: #ffffff;
	background-color: #8C8C8C;
}

#deleteBtn:hover {
	background-color: #5D5D5D;
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
				<h2>개인정보</h2>
				<p>회원님의 소중한 정보를 안전하게 관리하세요.</p>
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
						<td id="tel"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td id="email"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td id="password"></td>
					</tr>
				</table>
				<div class="Btns">
					<input type="button" value="수정" id="putBtn" onclick="putInfo()"><input type="button" value="회원탈퇴" id="deleteBtn" onclick="deleteInfo()">
				</div>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
		document.addEventListener("DOMContentLoaded", () => {
			loadUserInfo();
		});
		
		function loadUserInfo(){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				const member = JSON.parse(this.responseText);
				console.log(member);
				console.log("username : " + member.username);
				document.querySelector("#name").innerHTML = member.name;
				document.querySelector("#id").innerHTML = member.username;
				document.querySelector("#birthDate").innerHTML = member.birthdate;
				document.querySelector("#tel").innerHTML = member.tel;
				document.querySelector("#email").innerHTML = member.email;
				document.querySelector("#password").innerHTML = "********";
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/mem/memberInfo");
			xhttp.setRequestHeader("Authorization", token);
			xhttp.send();
		}
		
		function putInfo(){
			window.location.href = "/member/editMyInfo";
		}
		
		function deleteInfo() {
			if (confirm("진짜 탈퇴하시겠습니까?")) {
				const token = localStorage.getItem("jwtToken");
				const xhttp = new XMLHttpRequest();
				
				xhttp.onload = function(){
					if (this.status === 200) {
						localStorage.removeItem("jwtToken");
						alert("회원탈퇴가 완료되었습니다.");
						// 탈퇴 후 처리할 코드 (예: 로그인 페이지로 이동)
						window.location.href = "/";
					} else {
						alert("회원탈퇴에 실패했습니다.");
					}
				}
				
				xhttp.open("DELETE", "http://localhost:9001/api/v1/mem/delete");
				xhttp.setRequestHeader("Authorization", token);
				xhttp.send();
			}
		}
	</script>
</body>
</html>