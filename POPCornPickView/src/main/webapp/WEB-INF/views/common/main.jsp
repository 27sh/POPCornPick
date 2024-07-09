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
    border:1px solid #eee;
}
</style>
    <script>
        function loadMovies() {
            fetch('http://localhost:9001/api/v1/main/movies')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('movie-chart').innerHTML = data;
                })
                .catch(error => console.error('Error:', error));
        }

        window.onload = loadMovies;
    </script>
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
            <div id="movie-chart">
                <h1>All Movies</h1>
                <c:if test="${not empty movies}">
                    <ul>
                        <c:forEach var="movie" items="${movies}">
                            <li>${movie}</li>
                        </c:forEach>
                    </ul>
                </c:if>
                <c:if test="${empty movies}">
                    <p>No movies found.</p>
                </c:if>
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

    </footer>
</body>
</html>
