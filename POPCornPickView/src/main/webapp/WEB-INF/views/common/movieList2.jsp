<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="../layout/header.jsp"%>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	display: flex;
	flex-wrap: wrap;
}

.movie-card {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 10px;
	margin: 10px;
	width: 200px;
	text-align: center;
}

.poster {
	width: 100%;
	height: 300px;
	background-color: #eee;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #aaa;
}

.movie-info {
	margin-top: 10px;
}

.rating, .sales {
	margin-top: 5px;
}

.btn {
	background-color: #ff6b6b;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}
.rever{
	color: white;
}
</style>
</head>
<body>
	<div>
		<input type="checkbox" id="current-movies" checked> 현재 상영작 보기
		<input type="checkbox" id="upcoming-movies"> 상영 예정작 보기
	</div>
	<div>
		<select id="sort-option">
			<option value="sales">예매율순</option>
			<option value="rating">평점순</option>
			<option value="popularity">관람객순</option>
		</select>
	</div>
	<div class="container" id="movie-list">
		<!-- 영화 카드가 여기에 삽입됩니다 -->
	</div>


	<script>
// 			$(document).ready(function(){
// 				 const movieListContainer = document.getElementById('movie-list');
// 				$.ajax({
// 					url:"http://localhost:9001/api/v1/film/MovieList",
// 					method:"GET",
// 					success: function(movie){
// 						console.log(movie);
// 						let str = '';
// 						 str += '<div class="movie-card">'
// 					            +   '<div>No.' + (1) + '</div>'
// 					            +   '<div class="poster"><img style="width="200" height="300" src="' + movie.posterUrl + '" alt="포스터"></div>'
// 					            +   '<div class="movie-info">'
// 					            +       '<div>영화 제목: ' + movie.movieNm + '</div>'
// 					            +       '<div class="sales">예매율: ' + movie.salesAcc + '</div>'
// 					            +       '<div class="rating">평점: 9.3</div>'
// 					            +       '<div>개봉일: ' + movie.openDt + '</div>'
// 					            +       '<button class="btn">예매하기</button>'
// 					            +   '</div>'
// 					            + '</div>';
// 						 movieListContainer.innerHTML = str;
// 					},
// 					error: function(error){
// 						console.log("에러 : ",error);
// 						console.log("에러상세 : ", error.responseText);
// 					}

// 				});

// 			})



   $(document).ready(function(){
            const movieListContainer = document.getElementById('movie-list');

            $.ajax({
                url: "http://localhost:9001/api/v1/film/MovieList",
                method: "GET",
                success: function(movieList) {
                    console.log(movieList);
                	displayMovies(movieList);
                },
                error: function(error) {
                    console.log("에러 : ", error);
                    console.log("에러상세 : ", error.responseText);
                }
            });
        });
	/*
        // TMDb API를 사용하여 영화 포스터를 가져오는 함수
        function fetchPoster(movieNm) {
            const apiKey = '4b5db8493a5df33fa9def848bcdda8b1';
            const baseUrl = "https://api.themoviedb.org/3";
            const searchUrl = baseUrl + '/search/movie?api_key=' + apiKey +'&query=' + encodeURIComponent(movieNm);

            // XMLHttpRequest 객체 생성
            const xhr = new XMLHttpRequest();
            xhr.open('GET', searchUrl, false); // false는 동기적 요청을 나타냄
            xhr.send();

            // 요청이 완료되었을 때 처리
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    const data = JSON.parse(xhr.responseText);
                    if (data.results && data.results.length > 0) {
                        const posterPath = data.results[0].poster_path;
                        return 'https://image.tmdb.org/t/p/w500'+ posterPath;
                    } else {
                        return 'https://via.placeholder.com/200x300'; // 포스터를 찾을 수 없을 때 기본 포스터 이미지
                    }
                } else {
                    console.error('Error fetching poster:', xhr.status, xhr.statusText);
                    return 'https://via.placeholder.com/200x300'; // 에러 발생 시 기본 포스터 이미지
                }
            }
            return 'https://via.placeholder.com/200x300'; // 기본 포스터 이미지 (여기까지 올 수 있는 경우)
        }
	*/
        async function displayMovies(movieList) {
            const movieListContainer = document.getElementById('movie-list');
            let str = '';

            for (let i = 0; i < movieList.length; i++) {
               // const posterUrl = fetchPoster(movieList[i].movieNm); // 동기적으로 포스터 URL 가져오기
				console.log(movieList[0] );
                str += '<div class="movie-card">'
                    +   '<div>No.' + (i + 1) + '</div>'
                    +   '<div class="poster"><a href="/film/movieDetail/' + movieList[i].movieDC + '"><img style="width="200" height="300" src="' + movieList[i].imgUrl + '" alt="포스터"></a></div>'
                    +   '<div class="movie-info">'
                    +       '<div>영화 제목: ' + movieList[i].movieNm + '</div>'
                    +       '<div class="sales">예매율: ' + movieList[i].salesAcc + '</div>'
                    +       '<div class="rating">평점: 9.3</div>'
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