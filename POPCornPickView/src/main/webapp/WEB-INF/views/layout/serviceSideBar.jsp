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
* {
	margin: 0;
	padding: 0;
}

body {
	color: #333;
	font-family: "Pretendard Variable", Pretendard;
}

a {
	text-decoration: none;
	color: #333;
}

ul {
	list-style: none;
}

#sidebar {
	position:relative;
	top:0px;
	left:0;
	width: 180px;
	height: auto;
	border: 1px solid #eee;
	border-radius: 5px;
}

#sidebar .sidebar-box {
	height: 130px;
	padding: 20px;
	border-bottom: 1px solid #eee;
	box-sizing: border-box;
}
#sidebar .sidebar-box:last-child{
	border-bottom:0;
}


#sidebar .sidebar-box h2 {
	font-size: 18px;
	padding-bottom:15px;
}

#sidebar .sidebar-box h3 {
	font-size: 15px;
	padding-bottom:15px;
}

#sidebar .sidebar-box p a{
	display:inline-block;
	padding-bottom:10px;
	padding-left:12px;
	font-size:13px;
	color:#666;
}

#sidebar .sidebar-box2{
	height:200px;
	padding-top:30px;
}


#sidebar .sidebar-box5{
	height: 80px;
	padding-top:30px;
	font-size: 20px;
}

</style>
</head>
<body>
	<div id="sidebar">
		<div class="sidebar-box sidebar-box5">
			<h2>고객서비스</h2>
		</div>
		<div class="sidebar-box sidebar-box1">
			<h3>공지사항</h3>
			<p><a href="" class="resumeManage">공지사항 작성</a></p>
			<p><a href="">공지사항 목록</a></p>
		</div>
		<div class="sidebar-box sidebar-box2">
			<h3>이벤트</h3>
			<p><a href="/event/regist">이벤트 등록</a></p>
			<p><a href="/event/allList">이벤트 목록</a></p>
			<p><a href="">이벤트 종료목록</a></p>
			<p><a href="">이벤트 참여목록</a></p>
		</div>
		<div class="sidebar-box sidebar-box3">
			<h3>Q&A</h3>
			<p><a href="">Q&A 작성</a></p>
			<p><a href="">Q&A 목록</a></p>
		</div>
		<div class="sidebar-box sidebar-box4">
			<h3>자주찾는 질문</h3>
			<p><a href="">자주찾는 질문 등록</a></p>
			<p><a href="">자주찾는 질문 목록</a></p>
		</div>
	</div>
</body>
</html>