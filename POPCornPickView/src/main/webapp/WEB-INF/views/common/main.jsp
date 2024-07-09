<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL Core --%>
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
</style>
</head>
<body>
    <header>
        <%@ include file="../layout/header.jsp" %>
    </header>

    <main>
        <div id="video-container">
            <!-- 영상이 들어갈 공간 -->
        </div>
        <div id="movie-container">
            <div id="movie-details">
                <h1>All Movies</h1>
                <p>Loading movies...</p>
            </div>
            <div id="films-scheduled">
                <!-- 상영 예정작 -->
            </div>
        </div>
        <div id="event-container">
            <!-- 이벤트 리스트 -->
        </div>
        <div id="special-room">
            <!-- 특별관 -->
        </div>
        <div id="package">
        
        </div>
    </main>

    <footer>
        <!-- 푸터 내용 -->
    </footer>

    <script>
        function loadMovies() {
            fetch('http://localhost:9001/api/v1/main/movies')
                .then(response => response.json())
                .then(movies => {
                    console.log('Movies:', movies); // 로그 추가
                    const movieDetails = document.getElementById('movie-details');
                    movieDetails.innerHTML = '<h1>All Movies</h1>'; // 기존 내용을 초기화합니다.
                    if (movies.length > 0) {
                        movies.forEach(movieTitle => {
                            const encodedTitle = encodeURIComponent(movieTitle);
                            fetch('http://localhost:9001/api/v1/main/movies/details/' + encodedTitle)
                                .then(response => response.json())
                                .then(details => {
                                    console.log('Details:', details); // JSON 응답 로그 추가
                                    if (details.error) {
                                        console.error('Error fetching movie details:', details.error);
                                        return;
                                    }
                                    // movie-item 요소 생성 및 추가
                                    const movieItem = document.createElement('div');
                                    movieItem.className = 'movie-item';
                                    movieItem.innerHTML = `
                                        <img src="${details.posterUrl}" alt="${details.title}" width="100" height="150">
                                        <div>
                                            <h2>${details.title}</h2>
                                            <p>Release Date: ${details.openStartDt}</p>
                                        </div>
                                    `;
                                    movieDetails.appendChild(movieItem);
                                })
                                .catch(error => console.error('Error:', error));
                        });
                    } else {
                        movieDetails.innerHTML = '<p>No movies found.</p>';
                    }
                })
                .catch(error => console.error('Error:', error));
        }

        window.onload = loadMovies;
    </script>
</body>
</html>
