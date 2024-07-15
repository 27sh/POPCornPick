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
	height: 60px;
	padding-top:30px;
	border-bottom: 0;
	font-size: 20px;
}

</style>
</head>
<body>
	<div id="sidebar">
		<div class="sidebar-box sidebar-box5">
			<h2>극장</h2>
		</div>
		<div class="sidebar-box sidebar-box1">
			<h3>지점</h3>
			<p><a href="/cinema/registForm">지점 등록</a></p>
			<p><a href="/cinema/list">지점 정보 관리</a></p>
		</div>
		<div class="sidebar-box sidebar-box2">
			<h3>관람관</h3>
			<p><a href="/room/registForm">관람관 등록</a></p>
			<p><a href="/cinema/roomList">지점별 관람관 관리</a></p>
		</div>
	</div>
</body>
</html>