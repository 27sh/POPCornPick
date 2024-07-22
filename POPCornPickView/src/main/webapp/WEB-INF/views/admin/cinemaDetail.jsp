<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 상세</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

.sidebar-box1 p:nth-child(3) a{
	color: #816bff !important;
}

h2{
	margin-bottom: 20px;
	font-weight: 600;
	font-size: 22px;
}

label b{
	display: inline-block;
	width: 160px;
	font-weight: 500;
	margin-top: 40px;
}

button {
	padding:15px 50px;
	font-family: "Pretendard Variable", Pretendard;
	font-size:15px;
	cursor:pointer;
	margin:50px 10px 10px 10px;
	
}
#cinemaModify{
	background:#816bff;
	border:1px solid #816bff;
	color:#fff;
	margin-right: 100px;
}

#cinemaList{
	background:#f1f1f1;
	border:1px solid #ccc;
	color:#333;
}

#buttonArea{
	text-align: center;
}
</style>
</head>
<body>
<%@ include file="../layout/adminHeader.jsp"%>
	<main>
		<div class="sidebar-container">
			<%@ include file="../layout/cinemaSideBar.jsp"%>
		</div>
		<div id="container">
			<h2>지점 관리</h2>
			<div id="cinemaContent"></div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const urlParams = new URLSearchParams(window.location.search);
		let cinemaNo = urlParams.get('cinemaNo');
		console.log(cinemaNo);
		
		if(cinemaNo == null){
			alert("올바르지 않은 경로입니다.");
			//window.location.href="/cinema/list";
		}
		
		$.ajax({
			url : "http://localhost:9001/api/v1/admin/cinema/detail",
			type : "GET",
			data : {
				cinemaNo : cinemaNo
			},
			success : function(data) {
				if(data != null){
					let detail = '<label for="cinemaLocation" id="cinemaLocation"><b>지역명</b></label>';
					detail += '<span id="result">' + data.cinemaLocation + '</span><br>';
					detail += '<label for="cinemaName" id="cinemaName"><b>지점명</b></label>';
					detail += '<span id="result">' + data.cinemaName + '</span><br>';
					detail += '<label for="cinemaAddr" id="cinemaAddr"><b>지점 주소</b></label>';
					detail += '<span id="result">' + data.cinemaAddr + '</span><br>';
					detail += '<label for="cinemaTel" id="cinemaTel"><b>지점 전화번호</b></label>';
					detail += '<span id="result">' + data.cinemaTel + '</span><br>';
					detail += '<label for="cinemaImg" id="cinemaImg"><b>지점 대표 이미지</b></label>';
					detail += '<span id="result">' + data.cinemaImg + '</span><br>';
					detail += '<label for="cinemaIntro" id="cinemaIntro"><b>지점 중요공지</b></label>';
					detail += '<span id="result">' + data.cinemaIntro + '</span><br>';
					detail += '<div id="buttonArea">';
					detail += '<button type="button" id="cinemaList" onclick="cinemaList()">뒤로가기</button>';
					detail += '<button type="button" id="cinemaModify" onclick="cinemaModify('+cinemaNo+')">수정하기</button>';
					detail += '</div>';
					$('#cinemaContent').html(detail);
				} else {
					alert("불러오는데 실패했습니다. 다시 시도해주세요.");
					//window.location.href="/cinema/list";
				}
			},
			error : function(error) {
				alert("불러오는데 실패했습니다. 다시 시도해주세요.", error);
				//window.location.href="/cinema/list";
			}
		});
		
		
	});
	
	function cinemaModify(cinemaNo){
		window.location.href="/cinema/registForm?cinemaNo="+cinemaNo;
	}
	
	function cinemaList(){
		window.location.href="/cinema/list";
	}
	
	
	
	</script>
</body>
</html>