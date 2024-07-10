<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 상세</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<style>
main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
}
</style>
</head>
<body>
	<header>
		<%@ include file="../layout/adminHeader.jsp"%>
	</header>
	<main>
	<h1>지점 관리</h1>
	<div id="cinemaContent"></div>
	
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
			window.location.href="/cinema/list";
		}
		
		$.ajax({
			url : "http://localhost:9001/api/v1/cinema/detail",
			type : "GET",
			data : {
				cinemaNo : cinemaNo
			},
			success : function(data) {
				if(data != null){
					let detail = '<div>지역 명</div>';
					detail += '<div class="cinemaLocation">' + data.cinemaLocation +'</div>';
					detail += '<div>지점 명</div>';
					detail += '<div class="cinemaName">' + data.cinemaName +'</div>';
					detail += '<div>지점 주소</div>';
					detail += '<div class="cinemaAddr">' + data.cinemaAddr +'</div>';
					detail += '<div>지점 대표 번호</div>';
					detail += '<div class="cinemaTel">' + data.cinemaTel +'</div>';
					detail += '<div>지점 대표 이미지</div>';
					detail += '<div class="cinemaImg">' + data.cinemaImg +'</div>';
					detail += '<div>중요 공지</div>';
					detail += '<div class="cinemaIntro">' + data.cinemaIntro +'</div>';
					detail += '<input type="button" value="수정하기" onclick="cinemaModify('+cinemaNo+')">';
					$('#cinemaContent').html(detail);
				} else {
					alert("불러오는데 실패했습니다. 다시 시도해주세요.");
					window.location.href="/cinema/list";
				}
			},
			error : function(error) {
				alert("불러오는데 실패했습니다. 다시 시도해주세요.", error);
				window.location.href="/cinema/list";
			}
		});
		
		
	});
	
	function cinemaModify(cinemaNo){
		window.location.href="/cinema/registForm?cinemaNo="+cinemaNo;
	}
	
	
	
	</script>
</body>
</html>