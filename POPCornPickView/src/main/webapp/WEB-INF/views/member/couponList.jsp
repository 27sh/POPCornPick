<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람권/할인쿠폰 관리</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
main {
	width: 1100px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	width:900px;
	min-height:700px;
	border: 1px solid #ccc;
	box-sizing:border-box;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/header.jsp" %>
	</header>
	<main>
		<%@ include file="./mainInfo.jsp" %>
		<div class="sidebar-container">
			<%@ include file="./sideMenu.jsp" %>
		</div>
		<div id="container">
		    <h1>관람권/할인쿠폰 관리</h1>
		</div>
	</main>
	<footer>
		<!-- -->
	</footer>
</body>
</html>