<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
main {
	width: 1200px;
	margin: 80px auto;
	padding: 50px;
	background: #f0f0f0;
}

#movie_information_box{
	display: flex;
	margin: 0 auto;
	width: 1000px;
}
#movie_img{
	width: 300px;
	border-radius: 3px;
}
#movie_information_detail{
	margin-left: 50px;
}
#movie_title{
	font-size: 2rem;
}
#movie_small_detail{
	margin: 20px 0;
}
#movie_small_detail p span:nth-child(3){
	margin: 0 5px;
}
#movie_small_detail p span:nth-child(6){
	margin: 0 5px;
}
#movie_small_detail p span:nth-child(8){
	margin: 0 5px;
}
#movie_description p{
	width: 650px;
	overflow-y: scroll;
	height: 350px;
	overflow-x: hidden;
	background: white;
}
#button_box{
	display: flex;
	justify-content: center;
	gap: 10px;
	margin-top: 30px;
	
}
#button_box button{
	width: 100px;
	height: 50px;
	border-radius: 5px;
	cursor: pointer;
}
#button_box button:first-child{
	background: rgb(248, 47, 98);
	border: none;
	color: white;
}
#button_box button:nth-child(2){
	border: none;
	background: #ddd;
}
</style>
</head>
<body>
<%@ include file="../layout/adminHeader.jsp"%>
	<main>
		<div id="movie_information_box">
			
		</div>
		<div id="button_box">
			<button>상영종료</button>
			<button id="return_button">뒤로가기</button>
		</div>
	</main>
	<footer>
	
	</footer>

	<script type="text/javascript">
		const movieDC = "${movieDC}";
		console.log(movieDC);
		
		$(document).ready(function(){
			
			$.ajax({
				url : "http://localhost:9001/api/v1/admin/movie/detail/" + movieDC,
				method : "GET",
				dataType : "json",
				success : function(response){
					console.log("success");
					console.log(response);
					
					let str = '<img alt="' + response.movieNm + ' 사진" src="' + response.imgUrl + '" id="movie_img"> ' + 
							  '<div id="movie_information_detail"> ' +
							  '<div id="movie_title">' + response.movieNm + '</div> ' +
							  '<div id="movie_small_detail"> ' +
							  '<p> ' +
							  '<span style="font-weight: bold;">' + response.openDt + '</span><span>개봉</span> ' +
							  '<span>|</span> ' +
							  '<span style="font-weight: bold;">' + response.showTm + '</span><span>분</span> ' +
							  '<span>|</span> ' +
							  '<span>' + response.viewAge + '</span> ' +
							  '<span>|</span> ' +
							  '<span style="font-weight:bold;">204.0</span><span>만명</span> ' +
							  '</p> ' +
							  '</div> ' +
							  '<div id="movie_description"> ' +
							  '<p> ' +
							  response.description + 
							  '</p> ' +
							  '</div> ' +
							  '</div>';
					
					$("#movie_information_box").html(str);
					
				},
				error : function(xhr, status, error){
					console.log(error);
				}
			});
			
			$("#return_button").on("click", function(){
				location.href="http://localhost:8080/admin/movie/list";
			});
		});
	
	</script>
</body>
</html>