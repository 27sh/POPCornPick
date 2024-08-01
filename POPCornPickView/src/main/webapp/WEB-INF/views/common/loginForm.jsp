<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
body {
	font-family: 'Noto Sans KR', sans-serif; /* 롯데시네마 페이지에서 사용하는 폰트 */
	text-align: center;
}

main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
/* 	border:1px solid #eee; */
	padding: 20px;
}

.tab {
    display: flex;
    justify-content: center;
    margin-bottom: 30px;
    
}

/* 탭 버튼 스타일 */
.tab button {
	background-color: #fff; /* 흰색 배경 */
	/* border: 1px solid #d9534f; /* 붉은색 테두리 */
	border: none;
	color: #333; /* 검정색 글꼴 */
	font-size: 16px; /* 글꼴 크기 조절 */
	padding: 10px 20px; /* 여백 추가 */
	border-radius: 5px; /* 모서리 둥글게 처리 */
	cursor: pointer; /* 마우스 포인터 변경 */
	transition: background-color 0.3s ease, color 0.3s ease, border-bottom 0.3s ease; /* 마우스 오버 효과 */
	border-bottom: 3px solid transparent;
}

.tab button:hover { /* 마우스 오버 시 배경색 변경 */
  color: #d9534f;
  border-bottom: 3px solid #d9534f;
  background-color: #f5f5f5;
}

.tab-member, .tab-non-member {
	width: 300px;
}



/* 활성화된 탭 버튼 스타일 */
.tab button.active {
	background-color: #d9534f; /* 붉은색 배경 */
	color: #fff; /* 흰색 글꼴 */
}

.login-wrapper {
    max-width: 600px;
    margin: 0 auto;
    text-align: left;
}

.loginBox {
	width: 600px;
	position: left 20px;
}

.input-group {
    margin-bottom: 15px;
}

/* 입력란 스타일 */
input[type="text"],
input[type="password"] {
  width: 400px; /* 입력란 너비 100% */
  padding: 10px; /* 여백 추가 */
  border: 1px solid #ddd; /* 회색 테두리 */
  border-radius: 5px; /* 모서리 둥글게 처리 */
  box-sizing: border-box; /* 여백 계산 방식 */
  margin-bottom: 15px; /* 입력란 아래 여백 추가 */
  display: inline-block; /* 가로 방향으로 나열 */
  margin-right: 2%; /* 입력란 사이 여백 설정 */
}

/* 로그인 버튼 스타일 */
#loginButton {
	width: 150px;
	height: 100px;
	position: absolute;
	top: 0;
	right: 35px;
  background-color: #d9534f; /* 붉은색 배경 */
  color: #fff; /* 흰색 글꼴 */
  padding: 10px 20px; /* 여백 추가 */
  border-radius: 5px; /* 모서리 둥글게 처리 */
  border: none; /* 테두리 제거 */
  cursor: pointer; /* 마우스 포인터 변경 */
  transition: background-color 0.3s ease; /* 마우스 오버 효과 */
}

#loginButton:hover { /* 마우스 오버 시 배경색 변경 */
  background-color: #c9302c;
}

.a-links {
/*   color: #d9534f; /* 롯데시네마 페이지 링크 색상 */ */
  text-decoration: none;
  margin-left: 15px;
  position: relative;
  left: 295px;
}

span {
	text-align: right;
	margin-right: 15px;
	display: inline-block;
	width: 150px;
}

#joinButton {
	background-color: #fff;
}

#non-member-loginButton {
	background-color: black;
	color: #ffffff;
}

#joinButton, #non-member-loginButton {
	width: 25%;
	height: 50px;
	border: 2px solid;
	border-radius: 5px;
	margin: 20px;
}

#joinButton:hover {
	cursor: pointer;
	background-color: #E6E6E6;
}

#non-member-loginButton:hover {
	cursor: pointer;
	background-color: #585858;
}

.non-member-btn {
	text-align: center;
}

.space {
	height: 30px;
}

.space2 {
	display: inline-block;
	width: 150px;
	margin-right: 15px; 
}

#id, #password {
	margin-bottom: 25px;
}

.input-box {
	position: relative;
}

.txt {
	font-size: 13px;
}

#confirmPassword2 {
	height: 20px;
	margin-bottom: 20px;
	text-align: right;
	position: relative;
	right: 35px;
}

.correct {
	color: green;
}

.incorrect {
	color: red;
}

.confirm-password2 {
	position: relative;
}

</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div class="tab">
			<button class="tab-member" onclick="memberLogin()">회원</button> 
			<button class="tab-non-member" onclick="tabNonMemberLogin()">비회원</button> 
		</div>
		<div class="login-wrapper">
			<div class="loginBox">
<!-- 				<h1>로그인 폼 페이지</h1> -->
				<div class="space"></div>
				<form id="member-frm">
					<div class="input-group input-box">
						<input type="text" id="id" name="username" placeholder="아이디를 입력하세요">
						<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
						<button type="button" id="loginButton" onclick="login()">로그인</button> 
					</div>
					<div class="input-group">
					</div>
					<div class="links">
<!-- 	                    <button type="button" onclick="tokenExpiredCheck2()">Test</button> -->
	                    <a class="a-links" href="/joinForm">회원가입</a>
	                    <a class="a-links" href="#">아이디 찾기</a>
	                    <a class="a-links" href="#">비밀번호 찾기</a>
                	</div>
				</form>
				<form id="non-member-frm" style="display: none;">
					<div class="input-group">
						<span>이름</span>
						<input type="text" id="non-username" placeholder="이름을 입력해주세요.">
					</div>
					<div class="input-group">
						<span>휴대폰 번호</span>
						<input type="text" id="tel" placeholder="휴대폰 번호를 입력해주세요.">
					</div>
					<div class="input-group input-date">
						<span>생년월일</span>
						<input type="date" id="birthdate">
					</div>
					<div class="input-group">
						<span>예매 비밀번호</span>
						<input type="password" id="ticketingPw" maxlength="4" placeholder="예매 비밀번호 (4자리)를 입력해 주세요.">
					</div>
					<div class="input-group">
						<span>예매 비밀번호 확인</span>
						<input type="password" id="ticketingPwCheck" maxlength="4" placeholder="예매 비밀번호 (4자리)를 재입력해 주세요." onkeyup="password2Check()">
					</div>
					<div class="confirm-password2">
						<p id="confirmPassword2"></p>
					</div>
					<div class="input-group txt">
						비회원 로그인 시 예매 및 예매확인/취소 메뉴만 이용 가능하며 관람권, 할인권을 포함한 기타 결제, 할인수단은 정회원 로그인 시 사용 가능 합니다.
					</div>
					<div class="input-group txt">
						무분별한 서비스 이용 방지를 위하여 티켓 구매 제한 기준을 두고 있습니다. 회사가 정한 기준을 초과하는 경우 구매가 제한될 수 있습니다. 티켓 구매 제한 기준은 공지사항 참고 바랍니다.
					</div>
					<div class="non-member-btn">
						<button type="button" id="joinButton" onclick="goJoinForm()">회원가입</button>
						<button type="button" id="non-member-loginButton" onclick="nonMemberLogin()">비회원 로그인</button>
					</div>
				</form>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
		memberLogin();
		function memberLogin(){
			console.log("member");
			document.querySelector('.tab-member').classList.add('active');
            document.querySelector('.tab-non-member').classList.remove('active');
            
            const memberFrm = document.querySelector("#member-frm");
            const nonMemberFrm = document.querySelector("#non-member-frm");
            
            memberFrm.style.display = "block";
            nonMemberFrm.style.display = "none";
		}
		
		function tabNonMemberLogin(){
			console.log("non-member");
			document.querySelector('.tab-member').classList.remove('active');
            document.querySelector('.tab-non-member').classList.add('active');
            const memberFrm = document.querySelector("#member-frm");
            const nonMemberFrm = document.querySelector("#non-member-frm");
            
            memberFrm.style.display = "none";
            nonMemberFrm.style.display = "block";
		}
		
		function login(){
// 			const tokenCheck = localStorage.getItem('jwtToken');
// 			if(tokenExpiredCheck() == false){
				
// 			}else {
// 				alert('이미 로그인 되어있습니다.');
// 			}
				const xhttp = new XMLHttpRequest();
				const username = document.querySelector("input[name='username']").value;
				const password = document.querySelector("input[name='password']").value;
				
				xhttp.onload = function(){
					if (xhttp.readyState === XMLHttpRequest.DONE) {
		                if (xhttp.status === 200) {
		                    const token = xhttp.getResponseHeader('Authorization').split(' ')[1];
		                    // JWT 토큰을 로컬 스토리지에 저장
		                    localStorage.setItem('jwtToken', token);
		                    alert('로그인 성공!');
		                    //alert('Login successful! Token stored in local storage.');
		                    window.location.href = "/";
		                } else {
		                    alert('로그인 실패 아이디나 비밀번호가 일치하지 않습니다.')
		                	//alert('Login failed. Please check your credentials.');
		                }
		            }
					
				}
				
				xhttp.open("POST", "http://localhost:9001/api/v1/common/login");
				xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
				xhttp.send("username=" + username + "&password=" + password);
			
		}
		
		function nonMemberLogin(){
			const xhttp = new XMLHttpRequest();
			const name = document.querySelector("#non-username").value;
			const tel = document.querySelector("#tel").value;
			const birthdate = document.querySelector("#birthdate").value;
			const password2 = document.querySelector("#ticketingPw").value;
			
			xhttp.onload = function(){
				if(this.responseText == "nonMemberLogin Success"){
					alert(this.responseText);
					const token = xhttp.getResponseHeader('Authorization').split(" ")[1];
					localStorage.setItem('jwtToken', token);
					window.location.href = "/";
				}else {
					alert("nonMemberLogin Faile");
				}
			}
			
			xhttp.open("POST", "http://localhost:9001/api/v1/common/nonMemberLogin");
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("name=" + name + "&tel=" + tel + "&birthdate=" + birthdate + "&password2=" + password2);
		}
		
		function tokenExpiredCheck(){
			const xhttp = new XMLHttpRequest();
			const token = localStorage.getItem('jwtToken');
			console.log(token);
			xhttp.onload = function(){
				let result;
				if(this.responseText == "유효한 토큰입니다."){
					console.log(this.responseText);
					result = true;
					alert(result + ", 유효한 토큰");
				}else {
					console.log(this.responseText);
					result = false;
					alert(result + ", 만료된 토큰");
				}
				return result;
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/common/tokenExpired");
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		
		function tokenExpiredCheck2(){
			const xhttp = new XMLHttpRequest();
			const token = localStorage.getItem('jwtToken');
			console.log(token);
			xhttp.onload = function(){
				let result;
				if(this.responseText == "유효한 토큰입니다."){
					console.log(this.responseText);
					result = true;
					alert(result + ", 유효한 토큰");
				}else {
					console.log(this.responseText);
					result = false;
					alert(result + ", 만료된 토큰");
				}
				return result;
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/common/tokenExpired2");
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		
		function goJoinForm(){
			window.location.href = "/joinForm";
		}
		
		function goBack(){
			window.location.href = "/";
		}
		
		function password2Check(){
			const password2 = document.querySelector("#ticketingPw").value;
			const confirmPassword2 = document.querySelector("#ticketingPwCheck").value;
			const text = document.querySelector("#confirmPassword2");
			
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
		
	</script>
</body>
</html>