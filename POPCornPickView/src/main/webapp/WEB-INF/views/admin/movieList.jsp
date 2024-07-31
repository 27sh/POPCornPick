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
}
#search_box{
	display: flex;
	justify-content: end;
}
#search_box button{
	padding: 0 10px; 
	border: none; 
	background: #ddd; 
	cursor:pointer;
}
input[name=keyword]{
	font-size: 1rem;
	width: 300px;
	height: 40px;
}
#menu, #menu ul{
	width: 100%;
}
#menu ul{
	display: flex;
	justify-content: space-evenly;
}
#menu ul li{
	font-size: 1.2rem;
	color: grey;
	width: 100%;
	text-align: center;
	padding: 10px;
	margin-top: 10px;
	margin-bottom: 30px;
	cursor: pointer;
}
#menu ul li:hover {
	font-size: 1.21rem;
	background: #f0f0f0;
}
#menu ul li.selected{
	font-weight: bold;
	border-bottom: 3px solid black;
	color: black;
	background: #f0f0f0;
}
#table_box{
	width: 100%;
}
#table_box table{
	width: 100%;
	margin-top: 30px;
	border-spacing: 0;
}
#table_box table tr th{
	background: grey;
	padding: 10px;
	font-size: 1.2rem;
	color: white;
}
#table_box table tr td{
	cursor: pointer;
	text-align: center;
	padding: 10px;
}
#table_box table tr td:first-child{
	width: 5%;
}
#table_box table tr td:nth-child(2){
	width: 10%;
}
#table_box table tr td:nth-child(3){
	width: 50%;
}
#table_box table tr td:nth-child(4){
	width: 15%;
}
#table_box table tr td:nth-child(5){
	width: 10%;
}
#table_box table tr td:nth-child(6){
	width: 10%;
}
</style>
</head>
<body>
<body>
<%@ include file="../layout/adminHeader.jsp"%>
	<main>
		<h1>영화 관리</h1>	
		<div id="search_box">
			<input type="search" placeholder="  검색할 영화  키워드를 입력하세요." name="keyword" id="search_keyword">
			<button id="search_button">검색</button>
		</div>
		<nav id="menu">
			<ul>
				<li class="selected" id="onmovie">상영작</li>
				<li id="abouttomovie">상영예정작</li>
			</ul>
		</nav>
		<div id="table_box">
			<table>
				<thead>
					<tr>
						<th>순위</th>
						<th>관람등급</th>
						<th>제목</th>
						<th>관객 수</th>
						<th>개봉일</th>
						<th>마감일</th>
					</tr>
				</thead>
				<tbody id="tbody_box">
				</tbody>
			</table>
		</div>
	</main>
	<footer>
	
	</footer>
	<script type="text/javascript">
		$(document).ready(function(){
			
			$.ajax({
				url : "http://localhost:9001/api/v1/admin/movie/on",
				method : "GET",
				dataType : "json",
				success : function(response){

					let str = "<tr>";
					let cnt = 1;
					
					const sortByTotalViewDesc = (movies) => {
					    return movies.sort((a, b) => b.totalView - a.totalView);
					};
					
					const sortedMovies = sortByTotalViewDesc(response);
					
					sortedMovies.forEach(movie => {
						str += '<tr onclick="moveToMovieForm(event)" id="movieDC_' + movie.movieDC + '"><td>' + cnt + '</td> ';
						if(movie.viewAge === "전체관람가"){
							str += '<td><img alt="" src="/img/grade_all.png"></td> ';
						}else if(movie.viewAge === "12세관람가" || movie.viewAge === "12세이상관람가"){
							str += '<td><img alt="" src="/img/grade_12.png"></td> ';
						}else if(movie.viewAge === "15세이상관람가"){
							str += '<td><img alt="" src="/img/grade_15.png"></td> ';
						}else if(movie.viewAge === "18세관람가" || movie.viewAge === "청소년관람불가"){
							str += '<td><img alt="" src="/img/pc_grade_19.png"></td> ';
						}
						
						str += '<td style="font-weight:bold;">' + movie.movieNm + '</td> ' +
							'<td>' + movie.totalView + '</td> ' +
							'<td>' + movie.openDt + '</td>' +
							'<td>2024.08.10</td></tr> ';
							cnt++;
					});
				
					str += "</tr>";
					
					$("#tbody_box").html(str);
					
				},
				error : function(xhr, status, error){
					console.log(error);
				}
				
			});

			// 메뉴바가 선택되었을 때 테이블이 나와야 한다.
			$("#menu").children("ul").on("click", "li", function(){
				$(this).addClass("selected");
				$(this).siblings().removeClass("selected");
			
				const selectedId = $(this).attr("id");
				
				if(selectedId === "onmovie"){
					
					$.ajax({
						url : "http://localhost:9001/api/v1/admin/movie/on",
						method : "GET",
						dataType : "json",
						success : function(response){

							let str = "<tr>";
							let cnt = 1;
							
							const sortByTotalViewDesc = (movies) => {
							    return movies.sort((a, b) => b.totalView - a.totalView);
							};
							
							const sortedMovies = sortByTotalViewDesc(response);
							
							
							sortedMovies.forEach(movie => {
								str += '<tr onclick="moveToMovieForm(event)" id="movieDC_' + movie.movieDC + '"><td>' + cnt + '</td> ';
								if(movie.viewAge === "전체관람가"){
									str += '<td><img alt="" src="/img/grade_all.png"></td> ';
								}else if(movie.viewAge === "12세관람가" || movie.viewAge === "12세이상관람가"){
									str += '<td><img alt="" src="/img/grade_12.png"></td> ';
								}else if(movie.viewAge === "15세이상관람가"){
									str += '<td><img alt="" src="/img/grade_15.png"></td> ';
								}else if(movie.viewAge === "18세관람가" || movie.viewAge === "청소년관람불가"){
									str += '<td><img alt="" src="/img/pc_grade_19.png"></td> ';
								}
								
								str += '<td style="font-weight:bold;">' + movie.movieNm + '</td> ' +
									'<td>' + movie.totalView + '</td> ' +
									'<td>' + movie.openDt + '</td>' +
									'<td>2024.08.10</td></tr> ';
									cnt++;
							});
						
							str += "</tr>";
							
							$("#tbody_box").html(str);
							
						},
						error : function(xhr, status, error){
							console.log(error);
						}
						
					});
					
				}else if(selectedId === "abouttomovie"){
					
					$.ajax({
						url : "http://localhost:9001/api/v1/admin/movie/aboutto",
						method : "GET",
						dataType : "json",
						success : function(response){

							let str = "<tr>";
							let cnt = 1;
							
							const sortByTotalViewDesc = (movies) => {
							    return movies.sort((a, b) => b.totalView - a.totalView);
							};
							
							const sortedMovies = sortByTotalViewDesc(response);
							
							sortedMovies.forEach(movie => {
								str += '<tr onclick="moveToMovieForm(event)" id="movieDC_' + movie.movieDC + '"><td>' + cnt + '</td> ';
								if(movie.viewAge === "전체관람가"){
									str += '<td><img alt="" src="/img/grade_all.png"></td> ';
								}else if(movie.viewAge === "12세관람가" || movie.viewAge === "12세이상관람가"){
									str += '<td><img alt="" src="/img/grade_12.png"></td> ';
								}else if(movie.viewAge === "15세이상관람가"){
									str += '<td><img alt="" src="/img/grade_15.png"></td> ';
								}else if(movie.viewAge === "18세관람가" || movie.viewAge === "청소년관람불가"){
									str += '<td><img alt="" src="/img/pc_grade_19.png"></td> ';
								}
								
								str += '<td style="font-weight:bold;">' + movie.movieNm + '</td> ' +
									'<td>' + movie.totalView + '</td> ' +
									'<td>' + movie.openDt + '</td>' +
									'<td>2024.08.10</td></tr> ';
									cnt++;
							});
						
							str += "</tr>";
							
							$("#tbody_box").html(str);
							
						},
						error : function(xhr, status, error){
							console.log(error);
						}
						
					});
					
					
				}else if(selectedId === "endmovie"){
					
					$("#tbody_box").empty();
					
				}
				
			});

			
			
			$("#tbody_box").on("mouseenter", "tr", function(){
				$(this).css("background", "#ddd");
			});
			
			$("#tbody_box").on("mouseleave", "tr", function(){
				$(this).css("background", "white");
			});
			
			$("#search_button").on("click", function(){
				const keyword = $("#search_keyword").val();
			
				$.ajax({
					url : "http://localhost:9001/api/v1/admin/movie/search/" + keyword,
					method : "GET",
					dataType : "json",
					success : function(response){

						let str = "<tr>";
						let cnt = 1;
						
						const sortByTotalViewDesc = (movies) => {
						    return movies.sort((a, b) => b.totalView - a.totalView);
						};
						
						const sortedMovies = sortByTotalViewDesc(response);
						
						sortedMovies.forEach(movie => {
							str += '<tr onclick="moveToMovieForm(event)" id="movieDC_' + movie.movieDC + '"><td>' + cnt + '</td> ';
							if(movie.viewAge === "전체관람가"){
								str += '<td><img alt="" src="/img/grade_all.png"></td> ';
							}else if(movie.viewAge === "12세관람가" || movie.viewAge === "12세이상관람가"){
								str += '<td><img alt="" src="/img/grade_12.png"></td> ';
							}else if(movie.viewAge === "15세이상관람가"){
								str += '<td><img alt="" src="/img/grade_15.png"></td> ';
							}else if(movie.viewAge === "18세관람가" || movie.viewAge === "청소년관람불가"){
								str += '<td><img alt="" src="/img/pc_grade_19.png"></td> ';
							}
							
							str += '<td style="font-weight:bold;">' + movie.movieNm + '</td> ' +
								'<td>' + movie.totalView + '</td> ' +
								'<td>' + movie.openDt + '</td>' +
								'<td>2024.08.10</td></tr> ';
								cnt++;
						});
					
						str += "</tr>";
						
						$("#tbody_box").html(str);
						
					},
					error : function(xhr, status, error){
						console.log(error);
					}
					
				});
				
			
			});
			
			
		});
		
		function moveToMovieForm(event){

			let row = '';
			if(event.target.tagName === "TD"){
				row = event.target.parentNode;
			}else {
				row = event.target.parentNode.parentNode;
			}
			
			const movieDC = row.getAttribute("id").substring(8, row.getAttribute("id").length);
		
			location.href="http://localhost:8080/admin/movie/" + movieDC;
			
		}
		
		// 무비 상세 가지고 오는 url
		// "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=12cc7dc453c4bb57c2342f243ea66220&movieCd=20247811"
	
		// 무비 리스트 가지고 오는 url
		// "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=12cc7dc453c4bb57c2342f243ea66220&movieNm=퍼펙트 데이즈"
				
		// 무비 포스터 가지고 오는 url
		
// 		function fetchPoster(movieNm) {
// 			const apiKey = '4b5db8493a5df33fa9def848bcdda8b1'; // 여기에 본인의 TMDb API 키를 입력하세요
// 			const baseUrl = 'https://api.themoviedb.org/3';
// 		    const searchUrl = baseUrl + '/search/movie?api_key=' + apiKey +'&query=' + encodeURIComponent(movieNm);
		
		
// 		    // XMLHttpRequest 객체 생성
// 		    const xhr = new XMLHttpRequest();
// 		    xhr.open('GET', searchUrl, false); // false는 동기적 요청을 나타냄
// 		    xhr.send();
		
// 		    // 요청이 완료되었을 때 처리
// 		    if (xhr.readyState === XMLHttpRequest.DONE) {
// 		        if (xhr.status === 200) {
// 		            const data = JSON.parse(xhr.responseText);
// 		            if (data.results && data.results.length > 0) {
// 		                const posterPath = data.results[0].poster_path;
// 		                return 'https://image.tmdb.org/t/p/w500'+ posterPath;
// 		                console.log('Poster URL:', posterUrl);
// 		                console.log('데이터데이터' + data);
// 		            } else {
// 		                return 'https://via.placeholder.com/200x300'; // 포스터를 찾을 수 없을 때 기본 포스터 이미지
// 		            }
// 		        } else {
// 		            console.error('Error fetching poster:', xhr.status, xhr.statusText);
// 		            console.log('데이터데이터' + data);
// 		            return 'https://via.placeholder.com/200x300'; // 에러 발생 시 기본 포스터 이미지
// 		        }
// 		    }
// 		    return 'https://via.placeholder.com/200x300'; // 기본 포스터 이미지 (여기까지 올 수 있는 경우)
// 		}
		
		
				
	</script>
</body>
</html>