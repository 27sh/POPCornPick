<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Movies</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
main {
    width: 1100px;
    margin: 80px auto;
    min-height: 700px;
    border: 1px solid #eee;
}
.movie-item {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}
.movie-item img {
    margin-right: 20px;
}
.movie-card {
    border: 1px solid #ddd;
    padding: 15px;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}
.movie-card .poster {
    margin-right: 20px;
}
.movie-card .movie-info {
    flex: 1;
}
</style>
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <header>
        <%@ include file="../layout/header.jsp" %>
    </header>

    <main>
        <div id="movie-chart">
            <!-- 영화 목록이 여기에 추가됩니다. -->
        </div>
    </main>

    <footer>
        <!-- 푸터 내용 -->
    </footer>

    <script>
        function loadMovies() {
            // AJAX 요청으로 영화 목록 가져오기
            $.ajax({
                url: 'http://localhost:9001/api/v1/main/movies',
                method: 'GET',
                dataType: 'json',
                success: function(movies) {
                    console.log('Movies:', movies);
                    const movieChart = document.getElementById('movie-chart');
                    movieChart.innerHTML = ''; // 기존 내용을 초기화합니다.
                    if (movies.length > 0) {
                        movies.forEach(movie => {
                            // 각 영화에 대한 상세 정보 가져오기
                            
                            $.ajax({
                                url: 'http://localhost:9001/api/v1/main/movies/details/' + encodeURIComponent(movie),
                                method: 'GET',
                                dataType: 'json',
                                success: function(details) {
                                    console.log('Details:', details);
                                    console.log('Poster URL:', details.posterUrl); // 포스터 URL 콘솔 출력
                                    if (details.error) {
                                        console.error('Error fetching movie details:', details.error);
                                        return;
                                    }
                                    let str = '';
                                    const movieCard = document.createElement('div');
                                    movieCard.className = 'movie-card';
                                    movieCard.innerHTML = 
                                    	
                                    	

                                    str += '<div class="poster">'
                                        + '<img style="width:200px; height:300px;" src="' + details.posterUrl + '" alt="포스터">'
                                        + '</div>'
                                        + '<div class="movie-info">'
                                        + '<div>영화 제목: ' + details.title + '</div>'
                                        + '<div>개봉일: ' + details.openStartDt + '</div>'
                                        + '<button class="btn">예매하기</button>'
                                        + '</div>';

                                   	
                                    	
                                    	/*`<div class="poster">
                                            <img style="width:200px; height:300px;" src="${details.posterUrl}" alt="포스터">
                                        </div>
                                        <div class="movie-info">
                                            <div>영화 제목: ${details.title}</div>
                                            <div>개봉일: ${details.openStartDt}</div>
                                            <button class="btn">예매하기</button>
                                        </div>`;*/
                                    movieChart.appendChild(movieCard);
                                },
                                error: function(xhr, status, error) {
                                    console.error('Error:', error);
                                }
                            });
                        });
                    } else {
                        movieChart.innerHTML = '<p>No movies found.</p>';
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error:', error);
                }
            });
        }

        $(document).ready(function() {
            loadMovies();
        });
    </script>

</body>
</html>
