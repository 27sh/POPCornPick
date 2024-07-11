<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style>
main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
}

.tab button {
	background-color: white;
	border-color: white;
	align-content: center;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div class="tab">
			<button class="tab-member" onclick="memberLogin()"><span>회원</span></button> <button class="tab-non-member" onclick="nonMemberLogin()"><span>비회원</span></button>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	
		function memberLogin(){
			console.log("member");
		}
		
		function nonMemberLogin(){
			console.log("non-member");
		}
		
	</script>
</body>
</html>