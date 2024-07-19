<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 작성 페이지</title>
<style>

main {
	display: flex;
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
	box-sizing: border-box;
}

.sidebar {
	border: 1px solid #08088A;
	width: 275px;
	box-sizing: border-box;
	height: 800px;
}

.content {
	flex: 1;
	margin-left: 20px;
}

.tab {
	display: flex;
	box-sizing: border-box;
	width: 880px;
	height: 70px;
	border-bottom: 2px solid #A4A4A4;
	border-top: 2px solid #A4A4A4;
	text-align: center;
}

.tab a {
	flex: 1;
	text-align: center;
	justify-content: center;
	align-items: center;
	display: flex;
	width: 220px;
	height: 60px;
}

.tab a:hover {
	background-color: #E6E6E6;
}

.FAQ {
	width: 880px;
	height: 200px;
	border: 1px solid #08088A;
	margin-top: 20px;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div class="sidebar">
			사이드바 자리
		</div>
		<div class="content">
			<div class="tab">
				<a href="#1">FAQ</a><a href="#2">공지사항</a><a href="#3">1:1 문의</a><a href="#4">단체관람/대관문의</a>
			</div>
			<div class="FAQ">
				FAQ 들어갈 자리
			</div>
			<div class="text">
				<p>고객님의 문의에 답변하는 직원은 고객 여러분의 가족 중 한 사람</p>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
</body>
</html>