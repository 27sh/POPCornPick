<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    position: relative;
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
    padding: 10px;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
    flex-direction: column;
    width: 200px;
    height: 350px;
    box-sizing: border-box;
    position: relative; /* 순서 오버레이를 위한 설정 */
}
.movie-card .poster {
    margin-bottom: 10px;
    position: relative;
}
.movie-card .movie-info {
    flex: 1;
    text-align: center;
}
#movie-chart {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    justify-content: flex-start;
    border: 1px solid #ccc;
    padding: 10px;
    box-sizing: border-box;
    overflow: hidden; /* 컨테이너에서 벗어나는 요소를 숨김 */
    position: relative; /* 자식 요소를 절대 위치로 설정할 수 있도록 */
    height: 400px; /* 높이를 고정 설정 */
}
.movie-card .age-image-overlay {
    position: absolute;
    top: 10px;
    right: 10px;
    z-index: 3; /* z-index 설정 */
}

.movie-card .poster-img {
    width: 150px; /* 포스터 이미지 너비 조정 */
    height: 225px; /* 포스터 이미지 높이 조정 */
    border-radius: 15px; /* 포스터 이미지 모서리를 둥글게 설정 */
    position: relative;
    z-index: 1; /* 포스터 이미지의 z-index를 1로 설정 */
}
.movie-card .poster::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 150px; /* 그림자 높이 조정 */
    border-radius: 0 0 15px 15px; /* 둥근 모서리에 맞춤 */
    background: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 1) 100%); /* 진한 그림자 */
    pointer-events: none;
    z-index: 2; /* 그림자의 z-index를 2로 설정 */
}
.movie-card .overlay {
    position: absolute;
    bottom: 5px; /* 포스터 이미지 하단에 딱 붙도록 위치 조정 */
    left: 10px;
    color: #ffffff;
    font-size: 60px; /* 글자 크기 조정 */
    font-weight: lighter; /* 글자 두께 얇게 조정 */
    font-style: oblique; /* oblique 스타일 적용 */
    background: none; /* 배경 없음 */
    z-index: 3; /* overlay를 그림자보다 앞에 오게 설정 */
}

.movie-card .movie-info .title {
    font-weight: bold; /* 제목을 굵은 글씨로 설정 */
}
.movie-card .dday {
    background-color: rgba(0, 0, 0, 0.5);
    color: #ffffff;
    width: 24px;
    height: 24px;
    line-height: 30px;
    margin: 0 auto 10px;
    font-size: 14px; /* 기본 글자 크기 */
    font-weight: bold;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center; /* 글자 가운데 정렬 */
    padding: 0; /* 여백 제거 */
    position: absolute;
    top: 50px;
    right: 34px;
    z-index: 3;
    border-radius: 5px;
}
.pagination {
    display: flex;
    justify-content: space-between;
    position: absolute;
    width: 100%;
    top: 50%;
    transform: translateY(-50%);
}
.pagination button {
    background: none;
    border: none;
    cursor: pointer;
    padding: 0;
}
.pagination button img {
    width: 20px; /* 이미지 크기 조정 */
    height: 30px; /* 이미지 크기 조정 */
    background-color: rgba(255, 255, 255, 0.5); /* 배경에 동그란 흰색 원 추가 */
    border-radius: 50%;
}
.pagination button.hidden {
    visibility: hidden; /* 버튼을 숨기되 공간은 유지 */
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
        <div class="pagination">
            <button id="prev-page" class="hidden" onclick="prevPage()"><img src="/img/arrowL.png" alt="이전"></button>
            <button id="next-page" class="hidden" onclick="nextPage()"><img src="/img/arrowL.png" alt="다음" style="transform: rotate(180deg);"></button>
        </div>
    </main>

    <footer>
        <!-- 푸터 내용 -->
    </footer>

    <script>
    let currentPage = 1;
    const moviesPerPage = 5;
    let movieData = [];

    function loadMovies() {
        // AJAX 요청으로 영화 목록 가져오기
        $.ajax({
            url: 'http://localhost:9001/api/v1/main/movies/details',
            method: 'GET',
            dataType: 'json',
            success: function(movies) {
                movieData = movies;
                renderMovies();
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
            }
        });
    }

    function renderMovies() {
        const movieChart = document.getElementById('movie-chart');
        movieChart.innerHTML = ''; // 기존 내용을 초기화합니다.
        
        const start = (currentPage - 1) * moviesPerPage;
        const end = start + moviesPerPage;
        const paginatedMovies = movieData.slice(start, end);

        if (paginatedMovies.length > 0) {
            paginatedMovies.forEach((details, index) => {
                if (typeof details === 'string') {
                    details = JSON.parse(details);
                }
                
                // smallTypes가 배열인지 확인하고 변환
                const smallTypes = typeof details.smallTypes === 'string' ? JSON.parse(details.smallTypes) : details.smallTypes;

                // viewAge에 따른 이미지 경로 설정
                let ageImage = '';
                switch(details.viewAge) {
                    case '청소년 관람불가':
                        ageImage = 'pc_grade_19.png';
                        break;
                    case '12세 이상 관람가':
                        ageImage = 'grade_12.png';
                        break;
                    case '15세 이상 관람가':
                        ageImage = 'grade_15.png';
                        break;
                    case '전체 관람가':
                        ageImage = 'grade_all.png';
                        break;
                    default:
                        ageImage = ''; // 기본값 설정
                }

                const movieCard = document.createElement('div');
                movieCard.className = 'movie-card';
                movieCard.innerHTML = 
                    '<div class="poster">'
                    + '<img style="width:150px; height:225px;" src="' + details.posterUrl + '" class="poster-img" alt="포스터">'
                    + '<div class="overlay">' + (start + index + 1) + '</div>'
                    + (ageImage ? '<div class="age-image-overlay"><img src="/img/' + ageImage + '" class="grade-img" alt="연령 등급"></div>' : '')
                    + '</div>'
                    + '<div class="movie-info">'
                    + '<div class="title">' + details.title + '</div>'
                    + (details.dday ? '<div class="dday">' + details.dday + '</div>' : '')
                    + '<div>평점: ' + details.avgReviewScore + '</div>'
                    + '<div>' + smallTypes.join(", ") + '</div>'
                    + '<button class="btn">상세보기</button>'
                    + '<button class="btn">예매하기</button>'
                    + '</div>';
                movieChart.appendChild(movieCard);
            });

            // D-day 숫자의 길이에 따라 폰트 크기 조정
            document.querySelectorAll('.dday').forEach(function(ddayElement) {
                if (ddayElement.textContent.length > 2) {
                    ddayElement.style.fontSize = '10px'; // 글자 크기 줄이기
                } else {
                    ddayElement.style.fontSize = '14px'; // 기본 글자 크기
                }
            });
        } else {
            movieChart.innerHTML = '<p>No movies found.</p>';
        }

        const prevButton = document.getElementById('prev-page');
        const nextButton = document.getElementById('next-page');

        if (currentPage === 1) {
            prevButton.classList.add('hidden');
        } else {
            prevButton.classList.remove('hidden');
        }

        if (end >= movieData.length) {
            nextButton.classList.add('hidden');
        } else {
            nextButton.classList.remove('hidden');
        }
    }

    function prevPage() {
        if (currentPage > 1) {
            currentPage--;
            renderMovies();
        }
    }

    function nextPage() {
        if ((currentPage * moviesPerPage) < movieData.length) {
            currentPage++;
            renderMovies();
        }
    }

    $(document).ready(function() {
        loadMovies();
    });
    </script>

</body>
</html>
