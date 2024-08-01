<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 본 영화</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
main {
	width: 1200px;
	margin: 80px auto;
/* 	min-height: 700px; */
/* 	border:1px solid #eee; */
}

.flex-box {
	display: flex;
	box-sizing: border-box;
}

.myWatchedList h2 {
	margin: 20px 0;
}

.myWatchedList p {
	margin: 20px 0;
/* 	font-size:  */
}

.myWatchedList {
	margin-left: 40px;
}

.active {
	background-color: #FF0558 !important; /* 활성화된 링크 배경 색 변경 */
	color: #fff; /* 활성화된 링크 텍스트 색 변경 */
}



</style>
</head>
<body>
	<header>
		<%@ include file="../member/mainInfo.jsp"%>
	</header>
	<main>
		<div class="flex-box">
			<div class="sidebar">
				<%@ include file="../member/sideMenu.jsp"%>
			</div>
			<div class="myWatchedList">
				<h2>내가 본 영화<span id="watchedCount"></span></h2>
				<div id="movie-list">
					
				</div>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
		document.addEventListener("DOMContentLoaded", () => {
			
		});
		
		function displayMovies(movieList) {
            const movieListContainer = document.getElementById('movie-list');
            let str = '';

            for (let i = 0; i < movieList.length; i++) {
               // const posterUrl = fetchPoster(movieList[i].movieNm); // 동기적으로 포스터 URL 가져오기
				//console.log(movieList[0] );
                str += '<div class="movie-card">'
                    +   '<div>No.' + (i + 1) + '</div>'
                    +   '<div class="poster"><a href="/film/movieDetail/' + movieList[i].movieDC + '"><img style="width="200" height="300" src="' + movieList[i].imgUrl + '" alt="포스터"></a></div>'
                    +   '<div class="movie-info">'
                    +       '<div>영화 제목: ' + movieList[i].movieNm + '</div>'
                    
                    +       '<div class="rating">평점: <span id="ratingmovie"></span></div>'
                    +       '<div>개봉일: ' + movieList[i].openDt + '</div><br>'
                    +       '<button class="btn"><a class="rever" href="/reservation/main">예매하기</a></button>'
                    +   '</div>'
                    + '</div>';
                //console.log(posterUrl);
            }

            movieListContainer.innerHTML = str;
        }
		
	</script>
</body>
</html>