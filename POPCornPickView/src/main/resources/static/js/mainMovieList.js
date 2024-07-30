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

function filterAndRemoveDuplicates(array) {
    const uniqueValues = new Set();
    const filteredArray = [];

    array.forEach(item => {
        if (item !== '*' && !uniqueValues.has(item)) {
            uniqueValues.add(item);
            filteredArray.push(item);
        }
    });

    return filteredArray;
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

            // smallTypes 배열을 필터링하고 중복 제거
            smallTypes = filterAndRemoveDuplicates(smallTypes);

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
            const avgReviewScore = parseFloat(details.avgReviewScore).toFixed(1); // 평점을 소수점 한 자리까지만 표시

            const movieCard = document.createElement('div');
            movieCard.className = 'movie-card';
            movieCard.innerHTML = 
                '<div class="poster">'
                + '<img src="' + details.posterUrl + '" class="poster-img" alt="포스터">'
                + '<div class="overlay">' + (start + index + 1) + '</div>'
                + (ageImage ? '<div class="age-image-overlay"><img src="/img/' + ageImage + '" class="grade-img" alt="연령 등급"></div>' : '')
                + '</div>'
                + '<div class="movie-info">'
                + '<div class="title">' + truncatedTitle + '</div>'
                + (details.dday ? '<div class="dday">' + details.dday + '</div>' : '')
                + '<div class="avgReviewScore">평점: ' + avgReviewScore + '</div>'
                + '<div class="roomtype-img">' + smallTypes.join("") + '</div>'
                + '</div>'
                + '<div class="buttons">'
                + '<button class="btn details" onclick="goToMovieDetail(\'' + details.title + '\')">상세보기</button>'
                + '<button class="btn booking" onclick="window.location.href=\'/reservation/main\'">예매하기</button>'
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

function goToMovieDetail(title) {
    $.ajax({
        url: 'http://localhost:9001/api/v1/main/movies/details/title/' + encodeURIComponent(title),
        method: 'GET',
        success: function(response) {
            if (response && response.movieDC) {
                window.location.href = '/film/movieDetail/' + response.movieDC;
            } else {
                console.error('MovieDC not found for title:', title);
            }
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
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