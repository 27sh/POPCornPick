<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종료된 이벤트 리스트</title>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
main {
	width: 1200px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	box-sizing:border-box;
}

.sidebar-box2 p:nth-child(3) a{
	color: #816bff !important;
}

h2{
	margin-bottom: 20px;
	font-weight: 400;
	font-size: 22px;
}

</style>
</head>
<%@ include file="../../layout/adminHeader.jsp"%>
<body>
	<main>
		<div class="sidebar-container">
			<%@ include file="../../layout/serviceSideBar.jsp"%>
		</div>
		<div id="container">
		</div>
	</main>
	<footer>
	
	</footer>
</body>
</html>