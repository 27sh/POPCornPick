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
}

.special-theater {
	text-align: center;
}

.theater-header h1 {
	font-size: 2em;
	margin: 0;
}

.theater-header .theater-image {
	background-image: url('/img/imaxImg.png');
	background-size: contain;
	background-position: center;
	background-repeat: no-repeat; /* 이미지 반복을 방지 */
	height: 300px;
	width: 100%;
	line-height: 150px;
	text-align: left; /* 텍스트를 왼쪽 정렬 */
	color: #fff;
	position: relative;
	box-shadow: inset 700px 0px 80px -20px rgba(0, 0, 0, 0.9), inset -700px
		0 80px -20px rgba(0, 0, 0, 0.9);
	padding-left: 20px; /* 텍스트와 왼쪽 이미지 경계 사이의 간격 */
}

.theater-header {
	background-color: black;
	margin: 50px 0;
}

#theater-image-title {
	color: white;
	font-size: 50px;
	font-weight: bold;
	position: absolute;
	top: 50%;
	left: 500px;
	transform: translateY(-50%);
}

#theater-image-sub-title {
	color: white;
	font-size: 40px;
	font-weight: 100;
	position: absolute;
	top: 70%;
	left: 500px;
	transform: translateY(-50%);
}

img {
	vertical-align: middle;
}

.theater-tabs {
	display: flex;
	justify-content: center;
	margin: 20px 0;
}

.theater-tabs .tab {
	background-color: #fff;
	border: 1px solid #ccc;
	padding: 10px 20px;
	margin: 0 5px;
	cursor: pointer;
	border-radius: 20px;
	height: 90px;
	width: 90px;
	font-size: 15px;
}

.theater-tabs .tab.active {
	background-color: rgb(248, 47, 98);
	color: #fff;
}

.theater-note p {
	color: #f00;
}

.schedule {
	margin-top: 20px;
}

.schedule h2 {
	font-size: 30px;
	margin-bottom: 10px;
}

.schedule-content {
	display: flex;
	justify-content: center;
	align-items: center;
}

.theater-image-slider {
	position: relative;
	width: 1100px;
	height: 500px;
	background-color: #ccc;
	text-align: center;
	line-height: 500px;
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

slider-next {
	right: 10px;
}

.theater-description {
	background-color: #f3f3f3;
	color: #fff;
	padding: 20px;
	margin-top: 20px;
	text-align: center;
	height: 500px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.mini-context-box {
	color: white;
	padding: 20px;
	border-radius: 10px;
	text-align: center;
	width: 30%;
}

.context-icon {
	background-color: white;
	width: 180px;
	height: 180px;
	border-radius: 200px;
	margin: 0 auto 10px;
	background-position: center;
	background-size: contain;
}

.branch-content {
	background-color: #f0f0f0;
	padding: 10px;
	margin-top: 10px;
}

.branch-content {
	background-color: #f0f0f0;
	padding: 10px;
	margin-top: 10px;
	display: flex;
	flex-wrap: wrap;
	gap: 10px;
	border-radius: 15px;
	border: 1px solid lightgray;
}

.branch-content-each {
	background-color: white;
	padding: 10px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;
	font-size: 20px;
}

#movies-list-text {
	font-size: 20px;
	text-align: center;
	padding-top: 15px;
}

.movies-list {
	padding: 10px;
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
}

#movies-list-container {
	background-color: #f0f0f0;
	border-radius: 10px;
	border: 1px solid lightgray;
}

.movie-item {
	text-align: center;
	padding: 10px;
	width: 30%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.movie-item .poster {
	background-color: #ccc;
	color: transparent;
	margin-bottom: 10px;
	height: 300px;
	width: 200px;
	background-position: center;
	background-size: contain;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 15px;
}

.movie-info {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.movie-info p {
	margin: 5px 0;
}

.movie-info button {
	background-color: rgb(248, 47, 98);
	color: #fff;
	border: none;
	padding: 10px;
	cursor: pointer;
	border-radius: 50px;
	width: 80px;
}

.slider-image {
	background-position: center;
}

.context-sub-title {
	font-size: large;
	font-weight: 600;
	color: #c9c9c9;
}

.context-main-title {
	font-size: 35px;
	margin-bottom: 20px;
}

.movie-info-title {
	font-weight: bold;
}

.movie-info-reivew {
	font-size: 13px;
}

#none-container {
	padidng: 10px
}

.btn_gotop {
    display: none;
    position: fixed;
    bottom: 100px;
    right: 150px;
    z-index: 999;
    outline: none;
    background-color: white;
    color: #333;
    cursor: pointer;
    width: 50px;
    height: 50px;
    border: 1px solid;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.btn_goreservation {
    display: none;
    position: fixed;
    bottom: 100px;
    right: 210px;
    z-index: 999;
    outline: none;
    background: linear-gradient(2345670deg, #ffef8a, #ee2b60);
    color: white;
    cursor: pointer;
    width: 150px;
    height: 50px;
    border-radius: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    text-align: center;
}
</style>
<script>
$(document).ready(function() {
    // Predefined descriptions for each theater type
    var descriptions = {
        'IMAX': `
        	<section class="theater-description">
	            <div class="mini-context-box" id="context-box-1">
	                <div class="context-icon" style="background-image: url('/img/imax_list0.png');"></div>
	                <div class="context-sub-title">Crystal Clear</div>
	                <div class="context-main-title">IMAGE</div>
	                <div class="context-explane">
	                    Customized Projector로<br>비교할 수 없는 밝음과 뛰어난<br>선명한 화질 제공
	                </div>
	            </div>
	            <div class="mini-context-box" id="context-box-2">
	                <div class="context-icon" style="background-image: url('/img/imax_list1.png');"></div>
	                <div class="context-sub-title">Maximized</div>
	                <div class="context-main-title">SCREEN</div>
	                <div class="context-explane">
	                    대형 스크린에 맞는<br> 맞춤형 설계로 모든 좌석에서<br> 최고의 몰입 가능
	                </div>
	            </div>
	            <div class="mini-context-box" id="context-box-2">
	                <div class="context-icon" style="background-image: url('/img/imax_list2.png');"></div>
	                <div class="context-sub-title">Powerful</div>
	                <div class="context-main-title">SOUND</div>
	                <div class="context-explane">
	                    완벽하게 조율된 소리와<br> 핀 포인트 정확도로<br> 최적의 사운드를 제공
	                </div>
	            </div>
	        </section>
        `,
        '4DX': `
        	<section class="theater-description">
	            <div class="mini-context-box" id="context-box-1">
	                <div class="context-icon" style="background-image: url('/img/4dx_list0.png');"></div>
	                <div class="context-sub-title">Environmental</div>
	                <div class="context-main-title">EFFECTS</div>
	                <div class="context-explane">
	                    영화 속 주인공이<br>된 듯한 체험과<br>극대화된 생생함을 제공
	                </div>
	            </div>
	            <div class="mini-context-box" id="context-box-2">
	                <div class="context-icon" style="background-image: url('/img/4dx_list1.png');"></div>
	                <div class="context-sub-title">Motion</div>
	                <div class="context-main-title">SEAT</div>
	                <div class="context-explane">
	                    관람석이 상하로 좌우로<br>앞뒤로 움직이며<br>현장감을 극대화합니다.
	                </div>
	            </div>
	            <div class="mini-context-box" id="context-box-2">
	                <div class="context-icon" style="background-image: url('/img/4dx_list2.png');"></div>
	                <div class="context-sub-title">FEEL IT IN</div>
	                <div class="context-main-title">4DX</div>
	                <div class="context-explane">
	                    Wind, Bubbles, Lightning,<br>Fog, Vibration, Scents,<br>Water, Motion
	                </div>
	            </div>
	        </section>
        `,
        'Private Box': `
        	<section class="theater-description">
	            <div class="mini-context-box" id="context-box-1">
	                <div class="context-icon" style="background-image: url('/img/privatebox_list0.png');"></div>
	                <div class="context-sub-title"></div>
	                <div class="context-main-title">PRIVATE</div>
	                <div class="context-explane">
	                    박스 타입의 독립된 공간에서<br>최대 2~4인까지 즐길 수 있는<br>쾌적한 영화 관람 환경을<br>선사합니다.
	                </div>
	            </div>
	            <div class="mini-context-box" id="context-box-2">
	                <div class="context-icon" style="background-image: url('/img/privatebox_list1.png');"></div>
	                <div class="context-sub-title"></div>
	                <div class="context-main-title">PREMIUM</div>
	                <div class="context-explane">
	                    전 좌석 최고급 리클라이닝<br>체어에 세련된 인테리어를<br>더해 차별화된 극장의<br>감성을 제공합니다.
	                </div>
	            </div>
	            <div class="mini-context-box" id="context-box-2">
	                <div class="context-icon" style="background-image: url('/img/privatebox_list2.png');"></div>
	                <div class="context-sub-title"></div>
	                <div class="context-main-title">EXCLUSIVE<br>SERVICE</div>
	                <div class="context-explane">
	                    웰컴 서비스로 다양한 드링크 및<br>핑거 푸드를 제공합니다.
	                </div>
	            </div>
	        </section>
        `	
    };

    // Function to handle tab click
    function handleTabClick(tabText) {
        var theaterImageHtml = '';
        var imageUrl = '';
        var sliderImageUrl = '';
        if (tabText === 'IMAX') {
            theaterImageHtml = `
                <div id="theater-image-title">IMAX</div>
                <div id="theater-image-sub-title">궁극의 몰입감</div>
            `;
            imageUrl = '/img/imaxImg.png';
            sliderImageUrl = '/img/imaxSRoomImg.jpg';
        } else if (tabText === '4DX') {
            theaterImageHtml = `
                <div id="theater-image-title">4DX</div>
                <div id="theater-image-sub-title">특별한 오감체험</div>
            `;
            imageUrl = '/img/4dxImg.jpg';
            sliderImageUrl = '/img/4dxSRoomImg.jpg';
        } else if (tabText === 'Private Box') {
            theaterImageHtml = `
                <div id="theater-image-title">PRIVATE BOX</div>
                <div id="theater-image-sub-title">박스형 프리미엄 상영관</div>
            `;
            imageUrl = '/img/privateboxImg.png';
            sliderImageUrl = '/img/privateboxSRoomImg.png';
        }

        $('.theater-image').html(theaterImageHtml);
        $('.theater-image').css('background-image', 'url(' + imageUrl + ')');
        $('.slider-image').css('background-image', 'url(' + sliderImageUrl + ')');

        $('.tab').removeClass('active');
        $('.tab').filter(function() {
            return $(this).text() === tabText;
        }).addClass('active');
        $('h2, .schedule-content, .branch-content, .imax-movies h3, .imax-movies p, .movie-info, .theater-branch h3').each(function() {
            $(this).html($(this).html().replace(/IMAX|4DX|Private Box/gi, tabText.toUpperCase()));
        });

        var value = tabText.toLowerCase();
        $.ajax({
            url: 'http://localhost:9001/api/v1/sRoom/findCinemaNames', // 기존 기능 URL
            type: 'GET',
            data: { smallType: value },
            success: function(response) {
                var items = response.split(','); // assuming response is a comma-separated list of items
                var html = '';
                for (var i = 0; i < items.length; i++) {
                    html += '<div class="branch-content-each">' + items[i].trim() + '</div>';
                }
                $('.branch-content').html(html);
            }
        });

        $.ajax({
            url: 'http://localhost:9001/api/v1/sRoom/findMoviesByRoomType', // 기존 기능 URL
            type: 'GET',
            data: { smallType: value },
            success: function(response) {
                $('.movies-list').html(response);
                updatePosters();
                attachReservationHandler();
            }
        });

        // Update the theater description
        $('.theater-description').replaceWith(descriptions[tabText]);
    }

    // Function to update posters
    function updatePosters() {
        $('.movie-item').each(function() {
            var movieTitle = $(this).find('p').first().text(); // Assuming the first <p> contains the movie title
            $.ajax({
                url: 'http://localhost:9001/api/v1/main/movies/details/' + encodeURIComponent(movieTitle),
                type: 'GET',
                success: function(response) {
                    var movieData = JSON.parse(response);
                    if (movieData.posterUrl) {
                        $(this).find('.poster').css('background-image', 'url(' + movieData.posterUrl + ')');
                    }
                }.bind(this), // Ensure the context is correct
                error: function() {
                    console.error('Error fetching movie details for: ' + movieTitle);
                }
            });
        });
    }

    // Function to attach click event for reservation buttons
    function attachReservationHandler() {
        $('.movie-info button').click(function() {
            window.location.href = '/reservation/main';
        });
    }

    // Tab click event
    $('.tab').click(function() {
        handleTabClick($(this).text());
    });

    // Simulate IMAX tab click on page load
    handleTabClick('IMAX');
});

$(window).scroll(function(){
    if ($(this).scrollTop() > 150){
        $('.btn_gotop').fadeIn(200);
        $('.btn_goreservation').fadeIn(200);
    } else{
        $('.btn_gotop').fadeOut(200);
        $('.btn_goreservation').fadeOut(200);
    }
});

$('.btn_gotop').click(function(){
    $('html, body').animate({scrollTop:0},400);
    return false;
});

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('go-to-movieList').addEventListener('click', function() {
        window.location.href = '/film/movieList';
    });
});
</script>
</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<section class="special-theater">
		<div class="theater-header">
			<div class="theater-image">
				<div id="theater-image-title">IMAX</div>
				<div id="theater-image-sub-title">궁극의 몰입감</div>
			</div>
		</div>
		<div class="theater-tabs">
			<button class="tab active">IMAX</button>
			<button class="tab">4DX</button>
			<button class="tab">Private Box</button>
		</div>
	</section>

	<main>
		<section class="schedule">
			<h2>IMAX</h2>
			<div class="schedule-content">
				<div class="theater-image-slider">
					<div class="slider-image"
						style="background-image: url('/img/imaxSRoomImg.jpg');">ㅤ</div>
				</div>
			</div>
		</section>

		<section class="theater-description">
			<div class="mini-context-box" id="context-box-1">
				<div class="context-icon"></div>
				<div class="context-sub-title">Crystal Clear</div>
				<div class="context-main-title">IMAGE</div>
				<div class="context-explane">
					Customized Projector로<br>비교할 수 없는 밝음과 뛰어난<br>선명한 화질 제공
				</div>
			</div>
			<div class="mini-context-box" id="context-box-2">
				<div class="context-icon"></div>
				<div class="context-sub-title">Maximized</div>
				<div class="context-main-title">SCREEN</div>
				<div class="context-explane">
					대형 스크린에 맞는<br> 맞춤형 설계로 모든 좌석에서<br> 최고의 몰입 가능
				</div>
			</div>
			<div class="mini-context-box" id="context-box-2">
				<div class="context-icon"></div>
				<div class="context-sub-title">Powerful</div>
				<div class="context-main-title">SOUND</div>
				<div class="context-explane">
					완벽하게 조율된 소리와<br> 핀 포인트 정확도로<br> 최적의 사운드를 제공
				</div>
			</div>
		</section>

		<section class="theater-branch">
			<h3 style="font-size: 30px; margin: 20px 0;">IMAX 극장</h3>
			<div class="branch-content">
				<div id="none-container">
					<div class="branch-content-each"></div>
				</div>
			</div>
		</section>

		<section class="imax-movies">
			<h3 style="font-size: 30px; margin: 20px 0;">IMAX 영화</h3>
			<div id="movies-list-container">
				<p id="movies-list-text">IMAX로 보면 더 좋은 영화들이에요!</p>
				<div class="movies-list">
					<div class="movie-item">
						<div class="poster"></div>
						<div class="movie-info">
							<p>영화 제목</p>
							<p>평점 9.3</p>
							<button>예매하기</button>
						</div>
					</div>
				</div>
			</div>
		</section>

		<a href="#" class="btn_gotop"> TOP </a> <a href="/reservation/main"
			class="btn_goreservation"> 예매하기 </a>
	</main>
	<footer> </footer>
</body>
</html>
