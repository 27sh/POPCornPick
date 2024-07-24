$(document).ready(function() {
    var cinemas = [];
    var selectedCinemaNo = 0;
    var selectedDate = new Date();
    var selectedRoomNo = 0;

    function toKST(date) {
        return new Date(date).toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' });
    }

    var arDays = ["일", "월", "화", "수", "목", "금", "토"];
    var date = new Date();
    var arWeek = [];

    for (var i = 0; i < 14; i++) {
        var nextDate = new Date(date);
        nextDate.setDate(date.getDate() + i);

        var day = nextDate.getDay();
        var dateNum = nextDate.getDate();
        var monthNum = nextDate.getMonth() + 1;

        arWeek.push({
            day: arDays[day],
            date: dateNum,
            month: monthNum
        });
    }

    var $dateTabList = $('#dateTabList');
    var $monthLi = $('<div class="month_tit" style="margin: 10px 0; font-size: 15px; font-weight: 700; text-align: center;"></div>');

    $monthLi.text(selectedDate.getMonth() + 1 + '월');
    $dateTabList.append($monthLi);

    $.each(arWeek, function (index, item) {
        var $li = $('<li></li>');
        var displayText = (index === 0) ? '오늘' : item.day;

        var colorStyle = '';
        if (item.day === '토') {
            colorStyle = 'style="color: #233ca3;"';
        } else if (item.day === '일') {
            colorStyle = 'style="color: #f24a6a;"';
        }

        $li.html('<p class="dateInfo" ' + colorStyle + '>' + item.date + '</p><p class="dayInfo" ' + colorStyle + '>' + displayText + '</p>');

        if (index === 0) {
            $li.addClass('today selected2');
        }
        $li.data('date', new Date(date.getFullYear(), date.getMonth(), date.getDate() + index));
        $dateTabList.append($li);
    });

    $(document).on('click', '.date_tab li', function () {
        $('.date_tab li').removeClass('selected2');
        $(this).addClass('selected2');
        selectedDate = $(this).data('date');

        $monthLi.text((selectedDate.getMonth() + 1) + '월');

        var formattedDate;
        if (selectedDate.toDateString() === new Date().toDateString()) {
            formattedDate = selectedDate.getFullYear() + '-' + ('0' + (selectedDate.getMonth() + 1)).slice(-2) + '-' + ('0' + selectedDate.getDate()).slice(-2) + "(오늘)";
        } else {
            var dayOfWeek = ['일', '월', '화', '수', '목', '금', '토'][selectedDate.getDay()];
            formattedDate = selectedDate.getFullYear() + '-' + ('0' + (selectedDate.getMonth() + 1)).slice(-2) + '-' + ('0' + selectedDate.getDate()).slice(-2) + '(' + dayOfWeek + ')';
        }
        $('.dateTime').text(formattedDate);
        updateSchedule();
    });

    function updateSchedule() {
        $.ajax({
            url: "http://localhost:9001/api/v1/schedule/" + selectedRoomNo,
            method: "GET",
            success: function (schedule) {
                var scheduleCon = $('.schedule_con');
                scheduleCon.empty();

                var movieSchedules = {};
                var now = new Date();

                schedule.forEach(function (item) {
                    var viewAge = item.movieShowDetail.movie.viewAge;

                    var viewAgeImg;
                    if (viewAge === "전체 관람가") {
                        viewAgeImg = $('<img src="/img/grade_all.png">').addClass('grade');
                    } else if (viewAge === "12세 이상 관람가") {
                        viewAgeImg = $('<img src="/img/grade_12.png">').addClass('grade');
                    } else if (viewAge === "15세 이상 관람가") {
                        viewAgeImg = $('<img src="/img/grade_15.png">').addClass('grade');
                    } else if (viewAge === "청소년 관람불가") {
                        viewAgeImg = $('<img src="/img/pc_grade_19.png">').addClass('grade');
                    }

                    var start = new Date(item.start);
                    var end = new Date(item.end);
                    var startDateOnly = new Date(start.getFullYear(), start.getMonth(), start.getDate());

                    if (selectedDate.toDateString() === startDateOnly.toDateString() && start > now) {
                        var title = item.movieShowDetail.movie.title;
                        if (!movieSchedules[title]) {
                            movieSchedules[title] = {
                                viewAgeImg: viewAgeImg,
                                schedules: []
                            };
                        }
                        movieSchedules[title].schedules.push({
                            time: start.toLocaleTimeString("en-US", { hour: "2-digit", minute: "2-digit", hour12: false }),
                            end: end.toLocaleTimeString("en-US", { hour: "2-digit", minute: "2-digit", hour12: false }),
                            seats: item.room.seats
                        });
                    }
                });

                Object.keys(movieSchedules).forEach(function (title) {
                    var movieInfo = $('<div>').addClass('movie_info');
                    var movieTitle = $('<span>').text(title).addClass('movie_tit');

                    movieInfo.append(movieSchedules[title].viewAgeImg);
                    movieInfo.append(movieTitle);
                    scheduleCon.append(movieInfo);

                    movieSchedules[title].schedules.forEach(function (scheduleItem) {
                        var scheBox = $('<ul>').addClass('sche_box');
                        var scheStart = $('<li>').text(scheduleItem.time).addClass('sche_start');
                        var scheSeats = $('<li>').text(scheduleItem.seats).addClass('sche_seats');
                        var timeHover = $('<div>').addClass('time_hover')
                            .append($('<div>').addClass('tool').text('종료 ' + scheduleItem.end))
                            .append($('<div>').addClass('tool_tip'));

                        scheBox.append(scheStart);
                        scheBox.append(scheSeats);
                        scheBox.append(timeHover);
                        scheduleCon.append(scheBox);
                    });
                });

                $(document).on('mouseenter', '.sche_box', function () {
                    $(this).find('.time_hover').show();
                }).on('mouseleave', '.sche_box', function () {
                    $(this).find('.time_hover').hide();
                });
            },
            error: function (error) {
                console.log("에러 :", error);
                console.log("에러 상세 정보: ", error.responseText);
            }
        });
    }

    var locationMap = {
        "서울": "서울",
        "경기/인천": "경기/인천",
        "충청/대전": "충청/대전",
        "경북/대구": "경북/대구",
        "경남/부산/울산": "경남/부산/울산",
        "전라/광주": "전라/광주",
        "제주": "제주"
    };

    var reverseLocationMap = {
        "서울": "서울",
        "경기/인천": "경기/인천",
        "충청/대전": "충청/대전",
        "경북/대구": "경북/대구",
        "경남/부산/울산": "경남/부산/울산",
        "전라/광주": "전라/광주",
        "제주": "제주"
    };

    function loadFavoriteCinemas() {
        $.ajax({
            url: 'http://localhost:9001/api/v1/memberCinema/favoriteCinemas',
            method: 'GET',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('jwtToken')
            },
            success: function(data) {
                console.log("Favorite cinemas loaded:", data); // 콘솔 로그 추가
                $('.inner-select-cinema').empty();
                $('.modal-box-cinema-name').empty();
                data.forEach(function(cinema, index) {
                    var cinemaName = cinema.cinemaName;
                    $('#inner-select-' + (index + 1)).text(cinemaName);
                    $('#inner-select-' + (index + 1)).data('cinema-name', cinemaName);
                    $('#inner-select-' + (index + 1)).data('cinema-location', cinema.cinemaLocation);

                    $('#box-cinema-name' + (index + 1)).text(cinemaName);
                    $('#box-cinema-name' + (index + 1)).data('cinema-name', cinemaName);
                    $('#box-cinema-name' + (index + 1)).data('cinema-location', cinema.cinemaLocation);
                });
                // 로드가 완료된 후 inner-select-1 클릭 이벤트 호출
                if ($('#inner-select-1').data('cinema-name')) {
                    $('#inner-select-1').trigger('click');
                }
            },
            error: function(error) {
                console.log("Error loading favorite cinemas:", error);
                console.log("Error details:", error.responseText);
            }
        });
    }

function loadCinemas(location) {
    var mappedLocation = location.substring(0, 2); // 앞의 두 글자만 사용
    console.log("Requesting data for location:", mappedLocation); // 콘솔 로그 추가
    var token = localStorage.getItem('jwtToken');
    console.log("Using token:", token); // JWT 토큰 로그 추가

    $.ajax({
        url: 'http://localhost:9001/api/v1/memberCinema/cinemaLocation/' + mappedLocation,
        method: 'GET',
        headers: {
            'Authorization': 'Bearer ' + token
        },
        success: function(data) {
            console.log("Data received:", data); // 콘솔 로그 추가
            $('#row-container').empty();
            data.forEach(function(cinema, index) {
                var cinemaItem = '<div class="cinema-item" data-cinema-name="' + cinema.cinemaName + '" data-cinema-no="' + cinema.cinemaNo + '">' +
                    '<div id="cine-item-title"> 팝콘픽 ' + cinema.cinemaName + '</div>' +
                    '</div>';
                $('#row-container').append(cinemaItem);

                if (index === 0) {
                    $('#row-container .cinema-item:first #cine-item-title').addClass('selected');
                    showCinemaInfo(cinema);
                    loadRooms(cinema.cinemaNo);
                    loadRoomCount(cinema.cinemaNo);
                }
            });

            $('.cinema-item').click(function() {
                $('.cinema-item #cine-item-title').removeClass('selected');
                $(this).find('#cine-item-title').addClass('selected');
                var cinemaName = $(this).data('cinema-name');
                var cinemaNo = $(this).data('cinema-no');
                
                console.log("Cinema selected:", cinemaNo); // 콘솔 로그 추가
                var selectedCinemaNo = cinemaNo;
                
                var selectedCinema = data.find(c => c.cinemaName === cinemaName);
                if (selectedCinema) {
                    showCinemaInfo(selectedCinema);
                    loadRooms(cinemaNo);
                    loadRoomCount(cinemaNo);
                }
                $('#cinema-info-between').show();
                
                console.log("Loading schedule for cinema:", selectedCinemaNo); // 콘솔 로그 추가
                $.ajax({
                    url: "http://localhost:9001/api/v1/schedule/cinema/" + selectedCinemaNo,
                    method: "GET",
                    success: function (rooms) {
                        console.log("Rooms data received:", rooms); // 콘솔 로그 추가
                        var roomTab = $('.room_tab');
                        roomTab.empty();

                        rooms.sort((a, b) => a.roomType.roomTypeNo - b.roomType.roomTypeNo).forEach(function (room) {
                            var li = $('<li>').text(room.roomType.roomName).addClass('room-item');
                            li.data('roomNo', room.roomNo);
                            roomTab.append(li);

                            if (selectedRoomNo === 0) {
                                selectedRoomNo = room.roomNo;
                                li.addClass('selected2');
                                updateSchedule();
                            }
                        });

                        // 자동으로 첫번째 관람관 선택
                        if ($('.room-item').length > 0) {
                            $('.room-item').first().click();
                        }
                    },
                    error: function (error) {
                        console.error("Error loading rooms:", error); // 콘솔 에러 로그 추가
                        console.error("Error details:", error.responseText); // 콘솔 에러 로그 추가
                    }
                });

            });

            // inner-select-cinema 클릭 이벤트 추가
            $('.inner-select-cinema').click(function() {
                var cinemaName = $(this).data('cinema-name');
                var cinemaLocation = $(this).data('cinema-location');
                if (!cinemaName) {
                    showModal();
                } else {
                    var locationText = reverseLocationMap[cinemaLocation];
                    var locationLi = $('#nav-container ul li').filter(function() {
                        return $(this).text() === locationText;
                    });

                    if (locationLi.length) {
                        locationLi.click();
                        setTimeout(function() {
                            var cinemaItem = $('.cinema-item').filter(function() {
                                return $(this).data('cinema-name') === cinemaName;
                            });

                            if (cinemaItem.length) {
                                cinemaItem.click();
                            }
                        }, 1000); // 1초 지연 후 실행 (적절한 지연 시간을 설정하세요)
                    }
                }
            });

            // modal-box-cinema 클릭 이벤트 추가
            $('.modal-box-cinema-name').click(function() {
                var cinemaName = $(this).data('cinema-name');
                var cinemaLocation = $(this).data('cinema-location');
                if (!cinemaName) {
                    showModal();
                } else {
                    var locationText = reverseLocationMap[cinemaLocation];
                    var locationLi = $('#nav-container ul li').filter(function() {
                        return $(this).text() === locationText;
                    });

                    if (locationLi.length) {
                        locationLi.click();
                        setTimeout(function() {
                            var cinemaItem = $('.cinema-item').filter(function() {
                                return $(this).data('cinema-name') === cinemaName;
                            });

                            if (cinemaItem.length) {
                                cinemaItem.click();
                            }
                        }, 1000); // 1초 지연 후 실행 (적절한 지연 시간을 설정하세요)
                    }
                }
            });
        },
        error: function(error) {
            console.error("Error loading cinemas:", error); // 콘솔 에러 로그 추가
            console.error("Error details:", error.responseText); // 콘솔 에러 로그 추가
        }
    });
}


    function showModal() {
        var modal = document.getElementById("myModal");
        var span = document.getElementsByClassName("close")[0];
        modal.style.display = "block";
        span.onclick = function() {
            modal.style.display = "none";
            location.reload();
        };
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
                location.reload();
            }
        };
    }

    $('#save-changes-btn').click(function() {
        var selectedCinemas = [];
        $('.modal-box-cinema-name').each(function() {
            var cinemaName = $(this).text();
            if (cinemaName) {
                selectedCinemas.push(cinemaName);
            }
        });

        console.log("Selected cinemas:", selectedCinemas); // 콘솔 로그 추가
        $.ajax({
            url: 'http://localhost:9001/api/v1/memberCinema/saveFavoriteCinemas',
            method: 'PUT',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('jwtToken'),
                'Content-Type': 'application/json'
            },
            data: JSON.stringify(selectedCinemas),
            success: function() {
                alert('자주 가는 팝콘픽이 저장되었습니다.');
                location.reload();
            },
            error: function(error) {
                console.error("Error saving favorite cinemas:", error); // 콘솔 에러 로그 추가
                console.error("Error details:", error.responseText); // 콘솔 에러 로그 추가
            }
        });
    });

    function showCinemaInfo(cinema) {
        $('#cinema-info-title').text('팝콘픽 ' + cinema.cinemaName);
        $('#cinema-info-img').css('background-image', 'url(/img/' + cinema.cinemaImgNewName + ')');
        $('#cinema-info-addr').text(cinema.cinemaAddr);
        $('#cinema-info-tel').text(cinema.cinemaTel);
        $('#cinema-info-notice-inner-text').text(cinema.cinemaIntro);
        checkFavoriteCinema(cinema.cinemaName); // 추가된 부분
        $('#cinema-info').show();
    }

    function checkFavoriteCinema() {
        var cinemaTitle = $('#cinema-info-title').text().replace('팝콘픽 ', '').trim();
        var favorite = false;
        $('.inner-select-cinema').each(function() {
            if ($(this).text().trim() === cinemaTitle) {
                favorite = true;
                return false; // break the loop
            }
        });
        if (favorite) {
            $('#star-img').html('<img src="/img/like_star.png" alt="Favorite">');
        } else {
            $('#star-img').empty();
        }
    }

    function loadRooms(cinemaNo) {
        $.ajax({
            url: 'http://localhost:9001/api/v1/memberCinema/cinemaRooms/' + cinemaNo,
            method: 'GET',
            success: function(data) {
                console.log("Rooms loaded:", data); // 콘솔 로그 추가
                $('#cinema-info-sRoom').empty();
                data.forEach(function(room) {
                    if (room.roomType && room.roomType.smallType) {
                        var roomInfo;
                        if (room.roomType.smallType === "IMAX") {
                            roomInfo = '<img src="/img/cinemaPage_IMAX.png" alt="IMAX" id="roomType-img">';
                        } else if (room.roomType.smallType === "4DX") {
                            roomInfo = '<img src="/img/cinemaPage_4DX.png" alt="4DX">';
                        } else if (room.roomType.smallType === "PRIVATE BOX") {
                            roomInfo = '<img src="/img/cinemaPage_PrivateBox.png" alt="PRIVATE BOX">';
                        } else {
                            roomInfo = '<div id="cinema-info-sRoom-list">' + room.roomType.smallType + '</div>';
                        }
                        $('#cinema-info-sRoom').append(roomInfo);
                    }
                });
            },
            error: function(error) {
                console.error("Error loading rooms:", error); // 콘솔 에러 로그 추가
                console.error("Error details:", error.responseText); // 콘솔 에러 로그 추가
            }
        });
    }

    function loadRoomCount(cinemaNo) {
        $.ajax({
            url: 'http://localhost:9001/api/v1/memberCinema/cinemaRoomCount/' + cinemaNo,
            method: 'GET',
            success: function(data) {
                console.log("Room count loaded:", data); // 콘솔 로그 추가
                var count = data.roomCount;
                var seatSum = data.seatSum;
                $('#cinema-info-room').text(count + '관 / ' + seatSum + '석');
            },
            error: function(error) {
                console.error("Error loading room count:", error); // 콘솔 에러 로그 추가
                console.error("Error details:", error.responseText); // 콘솔 에러 로그 추가
            }
        });
    }

    function isLoggedIn() {
        var token = localStorage.getItem('jwtToken');
        return !!token;
    }

    function checkLoginAndProceed(callback, element) {
        if (isLoggedIn()) {
            callback(element);
        } else {
            if (confirm('로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠습니까?')) {
                window.location.href = '/loginForm';
            }
        }
    }

	function loadCinemasForLocation(location) {
	    var mappedLocation = location.substring(0, 2); // 앞의 두 글자만 사용
	    console.log("Requesting data for location:", mappedLocation); // 콘솔 로그 추가
	    
	    $.ajax({
	        url: 'http://localhost:9001/api/v1/memberCinema/cinemaLocation/' + mappedLocation,
	        method: 'GET',
	        success: function(data) {
	            console.log("Cinemas for location loaded:", data); // 콘솔 로그 추가
	            $('#select-cinema-cinemaName').empty();
	            data.forEach(function(cinema) {
	                $('#select-cinema-cinemaName').append('<option value="' + cinema.cinemaName + '">' + cinema.cinemaName + '</option>');
	            });
	        },
	        error: function(error) {
	            console.error("Error loading cinemas for location:", error); // 콘솔 에러 로그 추가
	            console.error("Error details:", error.responseText); // 콘솔 에러 로그 추가
	        }
	    });
	}


    $('#select-cinema-location').change(function() {
        var selectedLocation = $(this).val();
        loadCinemasForLocation(selectedLocation);
    });

    $('.inner-select-cinema, #plus-like-cinema-btn').click(function() {
        var element = $(this);
        checkLoginAndProceed(function(element) {
            if (!element.data('cinema-name')) {
                showModal();
            } else {
                console.log('로그인된 사용자입니다.');
            }
        }, element);
    });

    $('#plus-like-cinema-btn-temporary').click(function() {
        var selectedCinema = $('#select-cinema-cinemaName').val();
        var isAlreadySelected = $('.modal-box-cinema-name').filter(function() {
            return $(this).text() === selectedCinema;
        }).length > 0;
        
        if (isAlreadySelected) {
            alert('이미 선택된 영화관입니다.');
        } else {
            var emptyBox = $('.modal-box-cinema-name').filter(function() {
                return $(this).text() === '';
            }).first();
            if (emptyBox.length) {
                emptyBox.text(selectedCinema);
            } else {
                alert('이미 3개의 자주 가는 팝콘픽이 등록되어 있습니다.');
            }
        }
    });

    $('.modal-box-cinema-x').click(function() {
        $(this).siblings('.modal-box-cinema-name').text('');
    });

    $('#modal-close-btn').click(function() {
        $('#myModal').hide();
        location.reload();
    });

    $('#nav-container ul li').click(function() {
        var location = $(this).text();
        loadCinemas(location);
        $('#nav-container ul li').removeClass('selected');
        $(this).addClass('selected');
        $('#cinema-info-between').show();
    });

    // 페이지 로드 시 초기 seoul 값으로 cinemaName 로드
    loadCinemasForLocation('서울');
    $('#select-cinema-location').val('서울');

    // 로그인 여부에 따라 자주 가는 팝콘픽 로드
    if (isLoggedIn()) {
        loadFavoriteCinemas();
    }

    loadCinemas("서울");
    $('#nav-container ul li').first().addClass('selected');
    checkFavoriteCinema(); // 페이지 로드 시 실행

    $('#cinema-snotice-btn').click(function() {
        $('#cinema-info-between').hide();
    });

    function getUsernameFromToken() {
        var token = localStorage.getItem('jwtToken');
        if (token) {
            var payload = JSON.parse(atob(token.split('.')[1]));
            return payload.username; // 'username' 필드가 토큰의 페이로드에 포함되어 있다고 가정합니다.
        }
        return null;
    }

    function toggleSaveButton() {
        var isAgreed = $('input[name="chkY"][value="동의함"]').is(':checked');
        $('#save-changes-btn').prop('disabled', !isAgreed);
    }

    var username = getUsernameFromToken();
    if (username) {
        $('#modal-ex-title').text(username + '님이 자주 가는 팝콘픽');
    }

    // 페이지 로드 시 초기 상태 설정
    toggleSaveButton();

    // 라디오 버튼 클릭 시 상태 변경
    $('input[name="chkY"]').change(function() {
        toggleSaveButton();
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
});
