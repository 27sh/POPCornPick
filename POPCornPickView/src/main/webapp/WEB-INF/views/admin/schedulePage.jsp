<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>상영시간표</title>
        <link rel="stylesheet" href="/css/style.css">
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
                <!-- calender -->
                <div id="calendar"></div>
            </main>
        </body>
        <script>

            // 1. 기본 캘린더 불러오기
            $(document).ready(function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                    customButtons: {
                        myCustomButton: {
                            text: '저장하기'
                        }
                    },
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
                    //initialView: 'dayGridMonth',
                    selectable: true, // 달력 일자 드래그 설정가능
                    droppable: true,
                    editable: true,
                    nowIndicator: true, // 현재 시간 마크
                    locale: 'ko', // 한국어 설정

                    // ajax GET
                    events: [

                    ]
                });

                calendar.render();



                // 2. 사용 할 영화 슬롯 가져오기
                // 3. 영화 슬롯 추가 모달창
                // 4. 수정한 캘린더 schedule 엔티티에 저장하기


            });

        </script>

    </html>