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
	height: 60px;
	padding: 20px;
	border-bottom: 1px solid #eee;
	box-sizing: border-box;
}
#sidebar .sidebar-box:last-child{
	border-bottom:0;
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

.sidebar-box2 p:nth-child(2) a{
	color: #816bff !important;
}

#sidebar .sidebar-box2,
#sidebar .sidebar-box5{
	height:203px;
	padding-top:30px;
}
#sidebar .sidebar-box4, #sidebar .sidebar-box3{
	height: 90px;
}

#sidebar .sidebar-box6{
	height:110px;
	padding-top:30px;
}
</style>
</head>
<body>

	<div id="sidebar">
	<div class="sidebar-box sidebar-box1">
			<h3>회원</h3>
			<p><a href="/resume/resumeManage" class="resumeManage">회원</a></p>
			<p><a href="/resume/resumeWrite">공지사항 목록</a></p>
		</div>
		<div class="sidebar-box sidebar-box2">
			<h3>극장</h3>
			<p><a href="/resume/resumeManage" class="resumeManage">극장</a></p>
			<p><a href="/resume/resumeWrite">이력서 등록</a></p>
		</div>
		<div class="sidebar-box sidebar-box3">
			<h3>영화</h3>
			<p><a href="/member/applyList">영화관</a></p>
		</div>
		<div class="sidebar-box sidebar-box4">
			<h3>신고</h3>
			<p><a href="/qna">문의 내역</a></p>
		</div>
		<div class="sidebar-box sidebar-box5">
			<h3>고객서비스</h3>
			<p><a href="/subscrap/scrap">스크랩한 공고</a></p>
			<p><a href="/subscrap/subscribe">관심 기업</a></p>
		</div>
		<div class="sidebar-box sidebar-box6">
			<h3>고객서비스</h3>
			<p><a href="/member/info">회원정보 수정</a></p>
		</div>
	</div>
	<div id="sidebar">
		<div class="sidebar-box sidebar-box2">
			<h3>이벤트</h3>
			<p><a href="/cinema/list" class="resumeManage">이벤트 목록</a></p>
			<p><a href="/cinema/regist">이벤트 등록</a></p>
			<p><a href="/resume/resumeWrite">이벤트 종료목록</a></p>
			<p><a href="/resume/resumeWrite">이벤트 참여목록</a></p>
		</div>
	</div>

</body>
</html>