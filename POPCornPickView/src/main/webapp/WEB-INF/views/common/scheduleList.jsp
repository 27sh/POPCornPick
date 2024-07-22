<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>상영시간표</title>
        <link rel="stylesheet" href="/css/style.css">
        <link rel="stylesheet" href="/css/scheduleList.css">
        <link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    </head>


    <body>
        <jsp:include page="../layout/header.jsp"></jsp:include>

        <div id="wrap">
            <main>
                <ul id="tab_wrap">
                    <div class="schedule_title">영화관 별 상영시간표</div>
                    <li class="main_tab">
                        <div class="tab_con">
                            <div class="tab_con_1">
                                <div class="tab_tit cName">영화관 선택</div>
                                <!-- 선택한 영화관 이름 출력 -->
                                <ul class="select_wrap">
                                    <li class="select_1">
                                        <ul class="region">
                                            <li></li>
                                        </ul>
                                    </li>
                                    <!-- 지역 목록-->

                                    <li class="select_2">
                                        <ul class="cinema">
                                            <li></li>
                                        </ul>
                                    </li>
                                    <!-- 영화관 목록-->
                                </ul>
                                <!-- 선택 -->

                            </div>
                            <!--  tab_con_1 영화관 이름 선택 -->


                            <div class="tab_con_2">
                                <div class="tab_tit dateTime">날짜/시간</div>
                                <!-- 선택한 날짜 출력 -->

                                <div class="calendar">
                                    <div class="date_wrap">
                                        <ul class="date_tab" id="dateTabList"></ul>
                                    </div>
                                    <!-- 날짜 영역 -->
                                    <div class="room_wrap">
                                        <ul class="room_tab"></ul>
                                    </div>
                                    <!-- 관람관 영역 -->
                                    <div class="schedule_wrap">
                                        <div class="schedule_con">
                                            <div class="movie_info">
                                                <img src="" alt="">
                                                <p class="movie_tit"></p>
                                            </div>
                                            <div class="time_hover">
                                                <div class="tool"></div>
                                                <div class="tool_tip"></div>
                                            </div>
                                            <ul class="sche_box">
                                                <li class="sche_start"></li>
                                                <li class="sche_seats"></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- 시간표 영역 -->
                                </div>
                                <!-- calendar 전체 -->

                            </div>
                            <!-- tab_con_2 날짜 -->
                        </div> <!-- tab_con  END -->
                    </li>
                    <!-- 영화관별 상영시간표 -->
                    </ul>
            </main>
        </div>
    </body>
    <script>
        $(document).ready(function () {
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
            var $monthLi = $('<div class="month_tit" style="margin: 10px 0; font-size: 13px; font-weight: 700; text-align: center;"></div>');

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
                    $li.addClass('today selected');
                }
                $li.data('date', new Date(date.getFullYear(), date.getMonth(), date.getDate() + index));
                $dateTabList.append($li);
            });

            $(document).on('click', '.date_tab li', function () {
                $('.date_tab li').removeClass('selected');
                $(this).addClass('selected');
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



            $.ajax({
                url: "http://localhost:9001/api/v1/schedule/cinema",
                method: "GET",
                success: function (cinema) {
                    cinemas = cinema;

                    var cinemaLocation = $('.region');
                    cinemaLocation.empty();
                    var li;
                    var locations = new Set(cinemas.map(item => item.cinemaLocation));
                    locations.forEach(function (location) {
                        li = $('<li>').text(location).addClass('region-item');

                        cinemaLocation.append(li);
                    });

                    // 자동으로 첫번째 지역 선택
                    if ($('.region-item').length > 0) {
                        $('.region-item').first().click();
                    }

                },
                error: function (error) {
                    console.log("에러 :", error);
                    console.log("에러 상세 정보: ", error.responseText);
                }
            });

            $(document).on('click', '.region-item', function () {
                $('.region-item').removeClass('movieSelected');
                $(this).addClass('movieSelected');

                var selectedLocation = $(this).text();

                cinemas.forEach(function (item) {
                    if (item.cinemaLocation === selectedLocation) {
                        selectedCinemaNo = item.cinemaNo;
                    }
                });

                var cinemaName = $('.cinema');
                cinemaName.empty();

                cinemas.forEach(function (item) {
                    if (item.cinemaLocation === selectedLocation) {
                        var li = $('<li>').text(item.cinemaName).addClass('cinema-item');
                        li.addClass('movieSelected');
                        cinemaName.append(li);
                    }
                });

                // 자동으로 첫번째 극장 선택
                if ($('.cinema-item').length > 0) {
                    $('.cinema-item').first().click();
                }

            });

            $(document).on('click', '.cinema-item', function () {
                $('.cinema-item').removeClass('movieSelected');
                $(this).addClass('movieSelected');

                var selectedCinemaName = $(this).text();
                $('.cName').text(selectedCinemaName);

                $.ajax({
                    url: "http://localhost:9001/api/v1/schedule/cinema/" + selectedCinemaNo,
                    method: "GET",
                    success: function (rooms) {
                        var roomTab = $('.room_tab');
                        roomTab.empty();

                        rooms.sort((a, b) => a.roomType.roomTypeNo - b.roomType.roomTypeNo).forEach(function (room) {
                            var li = $('<li>').text(room.roomType.roomName).addClass('room-item');
                            li.data('roomNo', room.roomNo);
                            roomTab.append(li);

                            if (selectedRoomNo === 0) {
                                selectedRoomNo = room.roomNo;
                                li.addClass('selected');
                                updateSchedule();
                            }
                        });

                        // 자동으로 첫번째 관람관 선택
                        if ($('.room-item').length > 0) {
                            $('.room-item').first().click();
                        }
                    },
                    error: function (error) {
                        console.log("에러 :", error);
                        console.log("에러 상세 정보: ", error.responseText);
                    }
                });
            });

            $(document).on('click', '.room-item', function () {
                $('.room-item').removeClass('selected');
                $(this).addClass('selected');
                selectedRoomNo = $(this).data('roomNo');
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


        });

    </script>

    </html>