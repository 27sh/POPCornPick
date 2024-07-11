<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Movies</title>
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>

.main-header {
	background-color: white;
}

main {
    width: 1200px;
    margin: 80px auto;
    min-height: 700px;
    border: 1px solid #eee;
    position: relative;
    margin-top: 0px;
    background-color: white;
}

body {
	background-color: white;
}

.base-section {
    width: 100%;
    background-color: rgb(251, 251, 251); /* 배경색 설정 */	
}

#main-box1 {
    width: 1100px;
    margin: 0 auto;
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
    margin-bottom: 10px; /* 카드 사이사이 여백 줄이기 */
    display: flex;
    align-items: center;
    flex-direction: column;
    width: 180px;
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

.movie-chart-container {
	width: 1100px;
}

#movie-chart {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    justify-content: flex-start; /* movie-card들이 왼쪽에 위치하도록 설정 */
    padding: 10px;
    padding-left: 80px; /* 왼쪽 여백을 80px 만큼 설정 */
    box-sizing: border-box;
    overflow: hidden; /* 컨테이너에서 벗어나는 요소를 숨김 */
    position: relative; /* 자식 요소를 절대 위치로 설정할 수 있도록 */
    height: 330px; /* 높이를 고정 설정 */
    width: 1100px;
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
    transition: background 0.3s ease; /* 부드러운 배경 전환 효과 추가 */
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
.movie-card:hover .overlay {
    display: none; /* hover 시 인덱스 숫자 숨기기 */
}

.movie-card .movie-info .title {
	font-size: 18px;
    font-weight: bold; /* 제목을 굵은 글씨로 설정 */
}
.movie-card .dday {
    background-color: rgba(0, 0, 0, 0.5);
    color: #ffffff;
    width: 24px;
    height: 24px;
    line-height: 24px;
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
    right: 24px;
    z-index: 3;
    border-radius: 5px;
}

.movie-card .roomtype-img {
    position: absolute;
    top: 210px;
    right: 24px;
    z-index: 3;
}

.movie-card .roomtype-img-detail {
    border: 1px solid #ffffff; /* 흰색 테두리 색상 */
    border-radius: 2px;
    width: 30px;
    height: 6px;
}

	.pagination {
	    display: flex;
	    justify-content: space-between;
	    position: absolute;
	    width: 1100px;
	    top: 310px; /* 버튼을 위로 올림 */
	    transform: translateY(-50%);
	}
	
	#prev-page {
	    margin-left: 20px; /* 왼쪽 여백 추가 */
	}
	
	#next-page {
	    margin-right: 20px; /* 오른쪽 여백 추가 */
	}
	
	.pagination button {
	    background: none; /* 배경색 제거 */
	    border: none; /* 테두리 제거 */
	    cursor: pointer;
	    padding: 0;
	}
	
	.pagination button img {
	    width: 20px; /* 이미지 크기 조정 */
	    height: 30px; /* 이미지 크기 조정 */
	}
	
	.pagination button.hidden {
	    visibility: hidden; /* 버튼을 숨기되 공간은 유지 */
	}


/* 추가된 스타일 */
.movie-card .buttons {
    display: none; /* 초기 상태에서는 숨김 */
    position: absolute;
    top: 80px; /* 버튼을 포스터 이미지 위로 올림 */
    left: 50%;
    transform: translateX(-50%);
    z-index: 4; /* z-index를 높게 설정하여 버튼이 사라지지 않게 함 */
    background: none;
}
.movie-card:hover .buttons {
    display: block; /* movie-card에 hover 시 나타남 */
}
.buttons .btn {
    display: block;
    margin: 5px 0;
    color: #fff;
    padding: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    width: 100px;
}
.buttons .btn.details {
    background-color: #ffffff; /* 상세보기 버튼 배경색 흰색 */
    color: #000000; /* 상세보기 버튼 텍스트 색상 검정 */
}
.buttons .btn.booking {
    background-color: rgb(248, 47, 98); /* 예매하기 버튼 배경색 */
    color: #ffffff; /* 예매하기 버튼 텍스트 색상 흰색 */
}


/* hover 시 숨길 요소들 */
.movie-card .movie-info div:not(.title):not(.avgReviewScore) {
    display: block;
}
.movie-card:hover .movie-info div:not(.title):not(.avgReviewScore) {
    display: none;
}
.movie-card .age-image-overlay,
.movie-card .dday,
.movie-card .roomtype-img {
    display: block;
}
.movie-card:hover .age-image-overlay,
.movie-card:hover .dday,
.movie-card:hover .roomtype-img {
    display: none;
}

/* 포스터 이미지와 동일한 모양의 도형 추가 */
.movie-card .poster::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: 150px; /* 포스터 이미지 너비와 동일 */
    height: 225px; /* 포스터 이미지 높이와 동일 */
    background-color: rgba(0, 0, 0, 0.5); /* 반투명 검정색 */
    border-radius: 15px; /* 포스터 이미지 모서리와 동일 */
    z-index: 2; /* 포스터 이미지 위에 위치 */
    display: none; /* 초기 상태에서는 숨김 */
}
.movie-card:hover .poster::before {
    display: block; /* hover 시 나타남 */
}

/* 무비차트와 상영예정작 버튼 스타일 추가 */
#movie-chart-btn, #to-be-screened-btn {
    font-size: 24px;
    font-weight: bold;
    background: none;
    border: none;
    cursor: pointer;
    padding: 10px;
    color: gray; /* 기본 글자 색상 회색 */
    margin-top: 10px; /* 아래로 조금 내림 */
}

#movie-chart-btn {
	margin-left: 80px; /* 왼쪽 여백을 80px 만큼 설정 */
	color: black;
}
#button-divider {
    width: 2px;
    height: 25px;
    background-color: #cccccc;
    display: inline-block;
    vertical-align: middle;
    margin: 0 10px;
}
.active {
    color: black; /* 활성화된 버튼의 글자 색상 검은색 */
}

#go-to-movieList {
    font-size: 13px;
    font-weight: normal; /* 글씨를 얇게 설정 */
    background: none;
    border: 2px solid gray; /* 테두리를 추가하고 색상을 설정 */
    border-radius: 50px; /* 둥근 모서리 설정 */
    cursor: pointer;
    padding: 10px;
    color: gray;
    position: relative;
    left: 580px; /* 오른쪽에 약간의 여백을 추가합니다. */
    top: 10px; /* 아래로 조금 내림 */
}

</style>
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
   
<body>
<%@ include file="../layout/header.jsp" %>

<div id="base-section">
	    <div id="main-box1">
	        <button id="movie-chart-btn" class="active">무비차트</button>
	        <div id="button-divider"></div>
	        <button id="to-be-screened-btn">상영예정작</button>
	        <button id="go-to-movieList">전체보기 ></button>
	        <div id="movie-chart-container">
	            <div id="movie-chart">
	                <!-- 영화 목록이 여기에 추가됩니다. -->
	            </div>
	            <div class="pagination">
	                <button id="prev-page" class="hidden" onclick="prevPage()"><img src="/img/arrowL.png" alt="이전"></button>
	                <button id="next-page" class="hidden" onclick="nextPage()"><img src="/img/arrowL.png" alt="다음" style="transform: rotate(180deg);"></button>
	            </div>
	        </div>
	    </div>
</div>
	<main>
	</main>


<footer>
    <!-- 푸터 내용 -->
</footer>

<script>
let currentPage = 1;
const moviesPerPage = 5;
let movieData = [];
let filteredMovies = [];

function loadMovies() {
    // AJAX 요청으로 영화 목록 가져오기
    $.ajax({
        url: 'http://localhost:9001/api/v1/main/movies/details',
        method: 'GET',
        dataType: 'json',
        success: function(movies) {
            movieData = movies.map(movie => JSON.parse(movie)); // 문자열을 객체로 변환
            filteredMovies = [...movieData];
            console.log('Loaded movies:', movieData); // 영화 데이터 로깅
            renderMovies();
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
}

function getByteLength(str) {
    return new Blob([str]).size;
}

function truncateTitle(title, maxBytes) {
    let truncated = '';
    let byteLength = 0;

    for (let char of title) {
        byteLength += getByteLength(char);
        if (byteLength > maxBytes) break;
        truncated += char;
    }

    if (byteLength > maxBytes) {
        truncated += '...';
    }

    return truncated;
}

function renderMovies() {
    const movieChart = document.getElementById('movie-chart');
    movieChart.innerHTML = ''; // 기존 내용을 초기화합니다.

    const start = (currentPage - 1) * moviesPerPage;
    const end = start + moviesPerPage;
    const paginatedMovies = filteredMovies.slice(start, end);

    if (paginatedMovies.length > 0) {
        paginatedMovies.forEach((details, index) => {
            // smallTypes가 배열인지 확인하고 변환
            let smallTypes = typeof details.smallTypes === 'string' ? JSON.parse(details.smallTypes) : details.smallTypes;

            // smallTypes 배열을 탐색하며 특정 문자열을 이미지 태그로 대체
            smallTypes = smallTypes.map(type => {
                switch(type) {
                    case 'IMAX':
                        return '<img src="/img/imax_white.png" class="roomtype-img-detail" alt="IMAX">';
                    case '4DX':
                        return '<img src="/img/4dx_white.png" class="roomtype-img-detail" alt="4DX">';
                    case 'PRIVATE BOX':
                        return '<img src="/img/privatebox_white.png" class="roomtype-img-detail" alt="PRIVATE BOX">';
                    default:
                        return type;
                }
            });

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

            const truncatedTitle = truncateTitle(details.title, 25);

            const movieCard = document.createElement('div');
            movieCard.className = 'movie-card';
            movieCard.innerHTML = 
                '<div class="poster">'
                + '<img style="width:150px; height:225px;" src="' + details.posterUrl + '" class="poster-img" alt="포스터">'
                + '<div class="overlay">' + (start + index + 1) + '</div>'
                + (ageImage ? '<div class="age-image-overlay"><img src="/img/' + ageImage + '" class="grade-img" alt="연령 등급"></div>' : '')
                + '</div>'
                + '<div class="movie-info">'
                + '<div class="title">' + truncatedTitle + '</div>'
                + (details.dday ? '<div class="dday">' + details.dday + '</div>' : '')
                + '<div class="avgReviewScore">평점: ' + details.avgReviewScore + '</div>'
                + '<div class="roomtype-img">' + smallTypes.join(", ") + '</div>'
                + '</div>'
                + '<div class="buttons">'
                + '<button class="btn details">상세보기</button>'
                + '<button class="btn booking">예매하기</button>'
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

    if (end >= filteredMovies.length) {
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
    if ((currentPage * moviesPerPage) < filteredMovies.length) {
        currentPage++;
        renderMovies();
    }
}

function showAllMovies() {
    filteredMovies = [...movieData]; // 전체 영화 데이터로 필터링 초기화
    currentPage = 1;
    renderMovies();
    updateButtonStyles('#movie-chart-btn');
}

function showUpcomingMovies() {
    filteredMovies = movieData.filter(movie => {
        return movie.dday && movie.dday.startsWith('D-'); // dday가 "D-"로 시작하는지 확인
    });

    console.log('Upcoming movies:', filteredMovies); // 필터링된 영화 데이터 로깅
    currentPage = 1;
    renderMovies();
    updateButtonStyles('#to-be-screened-btn');
}

function updateButtonStyles(activeButtonId) {
    $('#movie-chart-btn').removeClass('active').css('color', 'gray');
    $('#to-be-screened-btn').removeClass('active').css('color', 'gray');
    $(activeButtonId).addClass('active').css('color', 'black');
}

$(document).ready(function() {
    $('#movie-chart-btn').click(showAllMovies);
    $('#to-be-screened-btn').click(showUpcomingMovies);
    loadMovies();
});
</script>

</body>
</html>
