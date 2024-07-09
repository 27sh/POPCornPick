<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록</title>

<%@ include file="layout/header.jsp"%>
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
		<button onclick="getJson()">GO</button>
	</div>
	<div class="container" id="movie-list">
		<!-- 영화 카드가 여기에 삽입됩니다 -->
	</div>

	<script type="text/javascript">
  //영화목록 불러오기
	function getJson() {
            const xhr = new XMLHttpRequest();
            xhr.onload = function () {
            	
                const response = JSON.parse(this.responseText);
                const movieList = response.movieListResult.movieList;
                displayMovies(movieList);
            };
            xhr.open("GET", "http://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieList.json?key=12cc7dc453c4bb57c2342f243ea66220&itemPerPage=50", true);
            
            xhr.send();
        }

//일별 박스오피스 불러오기
/*
function getJson() {
    const xhr = new XMLHttpRequest();
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            try {
                const response = JSON.parse(xhr.responseText);
                console.log('리스폰스 확인용' + response); // 확인용
                
                if (response.boxOfficeResult && response.boxOfficeResult.dailyBoxOfficeList) {
                    const movieList = response.boxOfficeResult.dailyBoxOfficeList;
                    displayMovies(movieList);
                    console.log(movieList);
                    console.log("무비엔엠" + movieList[0].movieNm);
                   
                } else {
                    console.error('Movie list not found in API response');
                    console.log('상태확인' + xhr.status);
                }
            } catch (error) {
                console.error('Error parsing JSON response:', error);
            }
        } else {
            console.error('Request failed with status:', xhr.status);
        }
    };
    
    xhr.onerror = function () {
        console.error('Request failed');
    };
    
    
    xhr.open("GET", "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=12cc7dc453c4bb57c2342f243ea66220&targetDt=20240701", true);
    xhr.send();
}
*/


/*
function displayMovies(movies) {
    const movieListContainer = document.getElementById('movie-list');
    let str = '';
    
    movies.forEach((movie, index) => {
        // 포스터 이미지 URL
        const posterUrl = 'https://via.placeholder.com/200x300'; // 임시 포스터 이미지 URL
        str += '<div class="movie-card">'
            +   '<div>No.' + (index + 1) + '</div>'
            +   '<div class="poster"><img src="' + posterUrl + '" alt="포스터"></div>'
            +   '<div class="movie-info">'
            +       '<div>영화 제목: ' + movie.movieNm + '</div>'
            +       '<div class="sales">예매율: ' + movie.salesAcc + '</div>'
            +       '<div class="rating">평점: 9.3</div>'
            +       '<div>개봉일: ' + movie.openDt + '</div>'
            +       '<button class="btn">예매하기</button>'
            +   '</div>'
            + '</div>';
    });
    
    movieListContainer.innerHTML = str;
}
ㅏ
*/
function fetchPoster(movieNm) {
	const apiKey = '4b5db8493a5df33fa9def848bcdda8b1'; // 여기에 본인의 TMDb API 키를 입력하세요
	const baseUrl = 'https://api.themoviedb.org/3';
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
                console.log('Poster URL:', posterUrl);
                console.log('데이터데이터' + data);
            } else {
                return 'https://via.placeholder.com/200x300'; // 포스터를 찾을 수 없을 때 기본 포스터 이미지
            }
        } else {
            console.error('Error fetching poster:', xhr.status, xhr.statusText);
            console.log('데이터데이터' + data);
            return 'https://via.placeholder.com/200x300'; // 에러 발생 시 기본 포스터 이미지
        }
    }
    return 'https://via.placeholder.com/200x300'; // 기본 포스터 이미지 (여기까지 올 수 있는 경우)
}

async function displayMovies(movie) {
    const movieListContainer = document.getElementById('movie-list');
    let str = '';
    console.log(movie);
    for (let i = 0; i < movie.length; i++) {
        const posterUrl = fetchPoster(movie[i].movieNm); // 동기적으로 포스터 URL 가져오기
        
        str += '<div class="movie-card">'
            +   '<div>No.' + (i + 1) + '</div>'
            +   '<div class="poster"><img style="width="200" height="300" src="' + posterUrl + '" alt="포스터"></div>'
            +   '<div class="movie-info">'
            +       '<div>영화 제목: ' + movie[i].movieNm + '</div>'
            +       '<div class="sales">예매율: ' + movie[i].salesAcc + '</div>'
            +       '<div class="rating">평점: 9.3</div>'
            +       '<div>개봉일: ' + movie[i].openDt + '</div>'
            +       '<button class="btn">예매하기</button>'
            +   '</div>'
            + '</div>';
            
            console.log(movie);
            console.log(movie[i].movieNm);
            console.log(posterUrl);
    }

    movieListContainer.innerHTML = str;
}


//displayMovies(movies);



        document.getElementById('current-movies').addEventListener('change', function() {
            if (this.checked) {
                document.getElementById('upcoming-movies').checked = false;
            }
        });

        document.getElementById('upcoming-movies').addEventListener('change', function() {
            if (this.checked) {
                document.getElementById('current-movies').checked = false;
            }
        });
        
    </script>



</body>
</html>