<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>특별관 소개</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
main {
	width: 1200px;
	margin: 30px auto;
	min-height: 700px;
	border:1px solid #eee;
}
body {
    font-family: Arial, sans-serif;
}

.special-theater {
    text-align: center;
}

.theater-header h1 {
    font-size: 2em;
    margin: 0;
}

.theater-header 
.theater-image {
    background-image: url('/img/imaxImg.png');
    background-size: contain;
    background-position: center;
    height: 100%;
    width: 100%;
    line-height: 200px;
    text-align: center;
    color: #fff;
    
    
}

img{
	vertical-align: middle;
}

.theater-tabs {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.theater-tabs .tab {
    background-color: #eee;
    border: 1px solid #ccc;
    padding: 10px 20px;
    margin: 0 5px;
    cursor: pointer;
}

.theater-tabs .tab.active {
    background-color: #f00;
    color: #fff;
}

.theater-note p {
    color: #f00;
}

.schedule {
    margin-top: 20px;
}

.schedule h2 {
    font-size: 1.5em;
    margin-bottom: 10px;
}

.schedule-content {
    display: flex;
    justify-content: center;
    align-items: center;
}

.theater-image-slider {
    position: relative;
    width: 100%;
    max-width: 600px;
    height: 300px;
    background-color: #ccc;
    text-align: center;
    line-height: 300px;
    color: #fff;
}

.slider-prev, .slider-next {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 2em;
    cursor: pointer;
    user-select: none;
}

.slider-prev {
    left: 10px;
}

.slider-next {
    right: 10px;
}

.theater-description {
    background-color: #444;
    color: #fff;
    padding: 20px;
    margin-top: 20px;
    text-align: center;
}

.theater-branch, .imax-movies {
    margin-top: 20px;
}

.branch-content, .movies-list {
    background-color: #f0f0f0;
    padding: 10px;
    margin-top: 10px;
}

.movies-list {
    display: flex;
    justify-content: space-between;
}

.movie-item {
    text-align: center;
    background-color: #fff;
    padding: 10px;
    width: 30%;
}

.movie-item .poster {
    background-color: #ccc;
    height: 150px;
    line-height: 150px;
    color: #fff;
    margin-bottom: 10px;
}

.movie-info p {
    margin: 5px 0;
}

.movie-info button {
    background-color: #f00;
    color: #fff;
    border: none;
    padding: 10px;
    cursor: pointer;
}
</style>
</head>
<%@ include file="../layout/adminHeader.jsp"%>
<body>
	<main>
    <section class="special-theater">
        <div class="theater-header">
            <div class="theater-image">해당 특별 상영관 대표이미지</div>
        </div>
        <div class="theater-tabs">
            <button class="tab active">IMAX</button>
            <button class="tab">4DX</button>
            <button class="tab">Private Box</button>
        </div>
        <div class="theater-note">
            <p>*탭별 박스와 선택되지 않은 박스의 디자인 차이</p>
        </div>
    </section>

    <section class="schedule">
        <h2>IMAX 상영 시간표</h2>
        <div class="schedule-content">
            <div class="theater-image-slider">
                <div class="slider-prev">&lt;</div>
                <div class="slider-image">특별 상영관 대표이미지</div>
                <div class="slider-next">&gt;</div>
            </div>
        </div>
    </section>

    <section class="theater-description">
        <div class="description-content">해당 상영관 설명</div>
    </section>

    <section class="theater-branch">
        <h3>IMAX 극장</h3>
        <div class="branch-content">해당 특별관이 존재하는 지점명 나열</div>
    </section>

    <section class="imax-movies">
        <h3>IMAX 영화</h3>
        <p>IMAX로 보면 더 좋은 영화들이에요!</p>
        <div class="movies-list">
            <div class="movie-item">
                <div class="poster">포스터</div>
                <div class="movie-info">
                    <p>영화 제목</p>
                    <p>예매율 20.5% | 평점 9.3</p>
                    <button>예매하기</button>
                </div>
            </div>
            <div class="movie-item">
                <div class="poster">포스터</div>
                <div class="movie-info">
                    <p>영화 제목</p>
                    <p>예매율 25.0% | 평점 9.3</p>
                    <button>예매하기</button>
                </div>
            </div>
            <div class="movie-item">
                <div class="poster">포스터</div>
                <div class="movie-info">
                    <p>영화 제목</p>
                    <p>예매율 25.0% | 평점 9.3</p>
                    <button>예매하기</button>
                </div>
            </div>
        </div>
    </section>
</main>
	<footer>
	
	</footer>
</body>
</html>