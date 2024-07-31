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