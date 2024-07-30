<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.net.*, java.util.*, com.fasterxml.jackson.databind.*, com.fasterxml.jackson.core.type.TypeReference" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
    main {
        width: 1200px;
        margin: 30px auto;
        min-height: 700px;
    }
    .search-message {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 20px;
    }
    .search-keyword {
        color: #f82f62;
    }
    .movie-info-container {
        display: flex;
        align-items: flex-start;
        border-bottom: 1px solid #ccc;
        padding: 20px 0;
        padding-bottom: 40px;
    }
    .movie-info-poster img {
        width: 260px;
        height: 371px;
        border-radius: 10px;
    }
    .mid-container {
        margin-left: 20px;
        display: flex;
        flex-direction: column;
    }
    .movie-info-high {
        display: flex;
        align-items: center;
        font-size: 18px;
        font-weight: bold;
    }
    .movie-info-title {
        font-size: 27px;
        font-weight: 400;
        margin-right: 10px;
        padding: 10px 0;
    }
    .movie-info-age img {
        width: 24px;
        height: 24px;
    }
    .movie-info-description {
        margin: 10px;
        line-height: 30px;
        font-size: 15px;
    }
    .reserve-info-btn-container {
        margin-top: 10px;
    }
    .reserve-info-btn-container button {
        margin-right: 10px;
        padding: 5px 10px;
        cursor: pointer;
        width: 120px;
        height: 40px;
        border-radius: 5px;
    }
    
    .go-to-detail-page {
        background-color: white;
        color: black;
        border: 1px solid lightgrey;
    }
    
    .go-to-reserve-page{
        background-color: #f82f62;
        color: white;
        border: none;
    }
    
    .movie-info-start-date {
        margin-bottom: 40px;
    }
    
    hr {
        background: lightgray;
        height: 1px;
        border: none;
    }
</style>
<script>
    function goToReserve() {
        window.location.href = "/reservation/main";
    }

    function goToDetail(movieDC) {
        window.location.href = "/film/movieDetail/" + movieDC;
    }
</script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<main>
    <div id="search-result-container">
        <%
            String keyword = request.getParameter("keyword");
            if (keyword != null && !keyword.isEmpty()) {
        %>
                <div class="search-message"><span class="search-keyword"><%= keyword %></span>(으)로 검색한 결과입니다.</div>
        <%
                String apiUrl = "http://localhost:9001/api/v1/search?keyword=" + URLEncoder.encode(keyword, "UTF-8");
                HttpURLConnection connection = null;
                BufferedReader reader = null;
                try {
                    URL url = new URL(apiUrl);
                    connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("GET");
                    connection.setRequestProperty("Accept", "application/json");

                    if (connection.getResponseCode() == 200) {
                        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                        StringBuilder responseBuilder = new StringBuilder();
                        String line;
                        while ((line = reader.readLine()) != null) {
                            responseBuilder.append(line);
                        }

                        ObjectMapper mapper = new ObjectMapper();
                        List<Map<String, Object>> movies = mapper.readValue(responseBuilder.toString(), new TypeReference<List<Map<String, Object>>>(){});

                        for (Map<String, Object> movie : movies) {
                            String movieDC = (String) movie.get("movieDC");
                            String movieNm = (String) movie.get("movieNm");
                            String imgUrl = (String) movie.get("imgUrl");
                            String viewAge = (String) movie.get("viewAge");
                            String openDt = (String) movie.get("openDt");
                            String description = (String) movie.get("description");

                            String ageImgUrl = "";
                            if ("12세관람가".equals(viewAge) || "12세이상관람가".equals(viewAge)) {
                                ageImgUrl = "/img/grade_12.png";
                            } else if ("청소년관람불가".equals(viewAge) || "18세관람가".equals(viewAge)) {
                                ageImgUrl = "/img/pc_grade_19.png";
                            } else if ("15세이상관람가".equals(viewAge)) {
                                ageImgUrl = "/img/grade_15.png";
                            } else if ("전체관람가".equals(viewAge)) {
                                ageImgUrl = "/img/grade_all.png";
                            }
        %>
                            <div class="movie-info-container">
                                <div class="movie-info-poster"><img src="<%= imgUrl %>" alt="포스터 이미지" /></div>
                                <div class="mid-container">
                                    <div class="movie-info-high">
                                        <div class="movie-info-title"><%= movieNm %></div>
                                        <div class="movie-info-age"><img src="<%= ageImgUrl %>" alt="<%= viewAge %>" /></div>
                                    </div>
                                    <div class="movie-info-row">
                                        <div class="movie-info-start-date"><%= openDt %> 개봉</div>
                                    </div>
                                    <hr>
                                    <div class="movie-info-description"><%= description %></div>
                                    <div class="reserve-info-btn-container">
                                        <button class="go-to-detail-page" onclick="goToDetail('<%= movieDC %>')">상세보기</button>
                                        <button class="go-to-reserve-page" onclick="goToReserve()">예매하기</button>
                                    </div>
                                </div>
                            </div>
        <%
                        }
                    } else {
                        out.println("검색 결과를 불러오는 데 실패했습니다.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("오류가 발생했습니다: " + e.getMessage());
                } finally {
                    if (reader != null) {
                        try {
                            reader.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (connection != null) {
                        connection.disconnect();
                    }
                }
            } else {
                out.println("검색어를 입력하세요.");
            }
        %>
    </div>
</main>
</body>
</html>
