<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <script src='/dist/index.global.js'></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>schedulePage</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/schdulePage.css">
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
            <select id="cinemaLocation" name="cinemaLocation" required>
                <option value="" disabled selected>선택</option>
                <option value="seoul">서울</option>
                <option value="gyeonggi_incheon">경기/인천</option>
                <option value="chungcheong_daejeon">충청/대전</option>
                <option value="jeonla_gwangju">전라/광주</option>
                <option value="gyeongbuk_daegu">경북/대구</option>
                <option value="gyeongnam_busan_ulsan">경남/부산/울산</option>
                <option value="gangwon">강원</option>
                <option value="jeju">제주</option>
            </select>
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

        // 극장 목록
        $.ajax({
            url: "http://localhost:9001/api/v1/schedule/cinema",
            method: "GET",
            success: function(cinema){
                console.log(cinema);
            },
            error: function(error){
                console.log("에러 :", error);
                console.log("에러 상세 정보: ", error.responseText);
            } 
        })




/*         var cinemaNo =${cinemaNo};
        console.log("cinemaNo 값 : " + cinemaNo);


        var srcCalendarEls = document.getElementsByClassName('source-calendar');
        var destCalendarEls = document.getElementsByClassName('destination-calendar');

        Array.from(srcCalendarEls).forEach(function (srcCalendarEl) {
            var srcCalendar = new FullCalendar.Calendar(srcCalendarEl, {
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
                selectable: true, // 달력 일자 드래그 설정가능
                droppable: true,
                editable: true,
                nowIndicator: true, // 현재 시간 마크
                locale: 'ko', // 한국어 설정
                events: [ // schedule Data 가져오기
                    $.ajax({
                        url: "http://localhost:9001/api/v1/schedule/cinema" + roomNo,
                        method: "GET",
                        success: function(cinema){
                            {
                                title: schedule.
                            }
                        }
                    })
                ],
                eventLeave: function (info) {
                    console.log('event left!', info.event);
                }
            });
            srcCalendar.render();
        });

        Array.from(destCalendarEls).forEach(function (destCalendarEl) {
            var destCalendar = new FullCalendar.Calendar(destCalendarEl, {
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
                selectable: true, // 달력 일자 드래그 설정가능
                droppable: true,
                editable: true,
                nowIndicator: true, // 현재 시간 마크
                locale: 'ko', // 한국어 설정
                editable: true,
                droppable: true, // will let it receive events!
                eventReceive: function (info) {
                    console.log('event received!', info.event);
                }
            });
            destCalendar.render();
        }); */
    });
</script>

</html>