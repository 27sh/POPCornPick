<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif; /* 롯데시네마 페이지에서 사용하는 폰트 */
	text-align: center;
}

main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
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
    max-width: 400px;
    margin: 0 auto;
    text-align: left;
}

.input-group {
    margin-bottom: 15px;
}

/* 입력란 스타일 */
input[type="text"],
input[type="password"] {
  width: 100%; /* 입력란 너비 100% */
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
	width: 25%;
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

a {
  color: #d9534f; /* 롯데시네마 페이지 링크 색상 */
  text-decoration: none;
  margin-left: 10px;
}

</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div class="tab">
			<button class="tab-member" onclick="memberLogin()">회원</button> <button class="tab-non-member" onclick="nonMemberLogin()">비회원</button> 
		</div>
		<div class="login-wrapper">
			<div class="loginBox">
				<h1>로그인 폼 페이지</h1>
				<form id="frm">
					<div class="input-group">
						<input type="text" id="id" name="username" placeholder="아이디를 입력하세요">
					</div>
					<div class="input-group">
						<input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요">
					</div>
					<button type="button" id="loginButton" onclick="login()">로그인</button>
					<div class="links">
	                    <a href="#">회원가입</a>
	                    <a href="#">아이디 찾기</a>
	                    <a href="#">비밀번호 찾기</a>
                	</div>
				</form>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	
		function memberLogin(){
			console.log("member");
			document.querySelector('.tab-member').classList.add('active');
            document.querySelector('.tab-non-member').classList.remove('active');
		}
		
		function nonMemberLogin(){
			console.log("non-member");
			document.querySelector('.tab-member').classList.remove('active');
            document.querySelector('.tab-non-member').classList.add('active');
		}
		
		function login(){
			const xhttp = new XMLHttpRequest();
			const username = document.querySelector("input[name='username']").value;
			const password = document.querySelector("input[name='password']").value;
			
			xhttp.onload = function(){
				if (xhttp.readyState === XMLHttpRequest.DONE) {
	                if (xhttp.status === 200) {
	                    const token = xhttp.getResponseHeader('Authorization').split(' ')[1];
	                    // JWT 토큰을 로컬 스토리지에 저장
	                    localStorage.setItem('jwtToken', token);
	                    alert('Login successful! Token stored in local storage.');
	                } else {
	                    alert('Login failed. Please check your credentials.');
	                }
	            }
				
			}
			
			xhttp.open("POST", "http://localhost:9001/api/v1/login");
			xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			xhttp.send("username=" + username + "&password=" + password);
		}
		
		
	</script>
</body>
</html>