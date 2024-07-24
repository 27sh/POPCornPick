<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <script src='/dist/index.global.js'></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>상영시간표</title>
        <link rel="stylesheet" href="/css/style.css">
        <link rel="stylesheet" href="/css/schedulePage.css">
        <link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    </head>
    <%@ include file="../layout/adminHeader.jsp" %>

        <body>
            <main>
                <div id="cinemaList">
                    <p class="select_title">지역명</p><select id="cinemaLocation" name="cinemaLocation" required></select>
                    <p class="select_title">극장명</p><select name="cinemaName" id="cinemaName"></select>
                </div>
                <p class="main_title">일반관</p>
                <div class="calendar_wrap">
                    <div class='source-calendar'></div>
                </div>

                <p class="main_title">특별관</p>
                <div class="calendar_wrap">
                    <div class='destination-calendar'></div>
                </div>
            </main>
        </body>
        <script>
            $(document).ready(function () {
                var cinemas = [];
                var selectedCinemaNo = 0; // 전역 변수로 선언된 선택된 극장의 cinemaNo

                // 극장 목록
                $.ajax({
                    url: "http://localhost:9001/api/v1/schedule/cinema",
                    method: "GET",
                    success: function (cinema) {
                        cinemas = cinema; // 전역 변수에 저장
                        //console.log(cinemas);

                        // 극장 위치
                        var cinemaLocation = $('#cinemaLocation');
                        cinemaLocation.empty(); // 요소 비움

                        // 중복된 위치를 제거하기 위해 Set 사용
                        var locations = new Set(cinemas.map(item => item.cinemaLocation));
                        locations.forEach(function (location) {
                            var option = $('<option>').text(location).val(location);
                            cinemaLocation.append(option);
                        });

                        // 첫 번째 옵션을 기본적으로 선택
                        cinemaLocation.prop('selectedIndex', 0).trigger('change');
                    },
                    error: function (error) {
                        console.log("에러 :", error);
                        console.log("에러 상세 정보: ", error.responseText);
                    }
                });

                // 극장 위치 선택 시 이벤트 처리
                $('#cinemaLocation').change(function () {
                    var selectedLocation = $(this).val();
                  

                    // 찾은 cinemaNo 저장
                    cinemas.forEach(function (item) {
                        if (item.cinemaLocation === selectedLocation) {
                            selectedCinemaNo = item.cinemaNo; // 선택된 극장의 cinemaNo를 전역 변수에 저장
                            console.log(selectedCinemaNo);
                        }
                    });

                    // 극장 이름
                    var cinemaName = $('#cinemaName');
                    cinemaName.empty(); // 요소 비움

                    // 선택된 위치의 극장 이름 추가
                    cinemas.forEach(function (item) {
                        if (item.cinemaLocation === selectedLocation) {
                            var option = $('<option>').text(item.cinemaName).val(item.cinemaName);
                            cinemaName.append(option);
                        }
                    });

                    // 캘린더 초기화
                    $('.source-calendar').empty();
                    $('.destination-calendar').empty();

                    // 극장의 관람관 정보를 가져오는 Ajax 요청
                    $.ajax({
                        url: "http://localhost:9001/api/v1/schedule/cinema/" + selectedCinemaNo,
                        method: "GET",
                        success: function (rooms) {
                        	console.log(selectedCinemaNo);
                            console.log("선택된 극장의 관람관 정보: ", rooms);

                         // 각 관람관의 스케쥴을 가져오기 위한 반복문
                            rooms.sort((a, b) => a.roomType.roomTypeNo - b.roomType.roomTypeNo).forEach(function (room) {
                                var roomNo = room.roomNo;
                                var roomName = room.roomType.roomName;


                                // <a> 태그 생성
                                var detail = $('<a>').attr('href', '/admin/scheduleDetail?roomNo=' + roomNo).text(roomName);

                                var calendarContainer = $('<div>').addClass('calendar-container');
                                var calendarTitle = $('<p>').addClass('calendar-title').append(detail);
                                var calendarEl = $('<div>').addClass('calendar').attr('id', 'calendar-' + roomNo);

                                calendarContainer.append(calendarTitle).append(calendarEl);

                                if (room.roomType.bigType === "일반관") {
                                    $('.source-calendar').append(calendarContainer);
                                } else if (room.roomType.bigType === "특별관") {
                                    $('.destination-calendar').append(calendarContainer);
                                }


                                // 선택된 극장의 스케쥴을 가져오는 Ajax 요청
                                $.ajax({
                                    url: "http://localhost:9001/api/v1/schedule/" + roomNo,
                                    method: "GET",
                                    success: function (schedule) {
                                        //console.log("선택된 관람관의 스케쥴: ", schedule);

                                        // FullCalendar의 events 배열에 추가할 데이터 준비
                                        var events = [];
                                        schedule.forEach(function (item) {
                                            var event = {
                                                title: item.movieShowDetail.movie.title,
                                                start: item.start,
                                                end: item.end,
                                                borderColor: item.movieShowDetail.movie.color,
                                                backgroundColor: item.movieShowDetail.movie.color
                                            };
                                            events.push(event);
                                        });

                                        // FullCalendar에 events 설정
                                        var calendar = new FullCalendar.Calendar(calendarEl[0], {
                                            headerToolbar: {
                                                left: 'prev next today',
                                                center: 'title',
                                                right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                                            },
                                            titleFormat: function (date) {
                                                return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
                                            },
                                            dayCellContent: function (info) {
                                                var number = document.createElement("a");
                                                number.classList.add("fc-daygrid-day-number");
                                                number.innerHTML = info.dayNumberText.replace("일", "").replace("日", "");
                                                if (info.view.type === "dayGridMonth") {
                                                    return {
                                                        html: number.outerHTML
                                                    };
                                                }
                                                return {
                                                    domNodes: []
                                                };
                                            },
                                            selectable: true,
                                            nowIndicator: true,
                                            locale: 'ko',
                                            events: events // 위에서 설정한 events 배열 사용
                                        });

                                        calendar.render(); // 캘린더 렌더링
                                    },
                                    error: function (error) {
                                        console.log("에러 :", error);
                                        console.log("에러 상세 정보: ", error.responseText);
                                    }
                                });
                            });
                        },
                        error: function (error) {
                            console.log("에러 :", error);
                            console.log("에러 상세 정보: ", error.responseText);
                        }
                    });
                });
            });

        </script>

    </html>