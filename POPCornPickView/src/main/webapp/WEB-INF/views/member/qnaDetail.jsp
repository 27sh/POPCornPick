<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />

<style>

main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
}

.myInfo {
	width: 100%;
	height: 400px;
	border: 2px solid red;
	box-sizing: border-box;
	margin-bottom: 30px;
}

.flex-box {
	display: flex;
	box-sizing: border-box;
}

.sidebar {
	width: 300px;
	height: 795px;
	box-sizing: border-box;
	border: 2px solid blue;
	margin-right: 20px;
}

h2, p{
	margin: 15px 0;
}

.qnaContent {
	border: 1px solid;
	width: 860px;
	height: 700px;
}

.샤싣
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp"%>
	</header>
	<main>
		<div class="myInfo">
			
		</div>
		<div class="flex-box">
			<div class="sidebar">
				
			</div>
			<div class="">
				<h2>나의 문의내역</h2>
				<p>1:1 문의</p>
				<div class="qnaContent">
					<div class="title">
						Title
					</div>
					<div class="content">
						Content
					</div>
					<div class="file">
						사진이면 미리보기
					</div>
					
				</div>
			</div>
		</div>
		
	</main>
	<footer>
		
	</footer>
</body>
</html>