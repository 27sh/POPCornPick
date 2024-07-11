<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <script src='/dist/index.global.js'></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>상영시간표</title>
        <link rel="stylesheet" href="/css/style.css">
        <link rel="stylesheet" href="/css/scheduleDetail.css">
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
                <div id='external-events'>
                    <h4>Draggable Events</h4>

                    <div id='external-events-list'>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 1</div>
                        </div>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 2</div>
                        </div>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 3</div>
                        </div>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 4</div>
                        </div>
                        <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                            <div class='fc-event-main'>My Event 5</div>
                        </div>
                    </div>

                    <p>
                        <input type='checkbox' id='drop-remove' />
                        <label for='drop-remove'>remove after drop</label>
                    </p>
                </div>
                <div id='calendar-wrap'>
                    <div id='calendar'></div>
                </div>

                <div>
                    <div class="modal-title">
                        <select name="title" id="title"></select>
                    </div>
                    <div class="modal-body">
                    </div>
                </div>
            </main>

        </body>
        <script>

            // 1. 기본 캘린더 불러오기
            $(document).ready(function () {

                var calendarEl = document.getElementById('calendar');

                var roomNo = ${ roomNo };
                localStorage.setItem('roomNo', roomNo);

                $.ajax({
                    url: "http://localhost:9001/api/v1/schedule/" + roomNo,
                    method: "GET",
                    success: function (schedule) {
                        var events = [];
                        schedule.forEach(function (item) {
                            var event = {
                                title: item.movieShowDetail.movie.title,
                                start: item.start,
                                end: item.end
                            };
                            events.push(event);

                            var calendar = new FullCalendar.Calendar(calendarEl, {
                                customButtons: {
                                    myCustomButton: {
                                        text: '수정하기'
                                    },
                                    mySaveButton: {
                                        text: '저장하기'
                                    },
                                    slotPlusButton: {
                                        text: '영화 추가하기'
                                    }
                                },
                                headerToolbar: {
                                    left: 'prev next today',
                                    center: 'title',
                                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                                },
                                footerToolbar: {
                                    right: 'myCustomButton,mySaveButton,slotPlusButton'
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
                                events: events, // 위에서 설정한 events 배열 사용

                                selectable: true, // 달력 일자 드래그 설정가능

                                nowIndicator: true, // 현재 시간 마크
                                locale: 'ko', // 한국어 설정
                                editable: true,
                                droppable: true,
                                drop: function (arg) {
                                    if (document.getElementById('drop-remove').checked) {
                                        arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                                    }
                                },
                                eventDrop: function (info) {
                                    console.log(info);
                                    console.log('Event dropped');
                                    console.log('Event: ' + info.event.title);
                                    console.log('Start: ' + info.event.start.toISOString());
                                    console.log('End: ' + info.event.end ? info.event.end.toISOString() : 'N/A');
                                },
                                eventResize: function (info) {
                                    console.log('Event resized');
                                    console.log('Event: ' + info.event.title);
                                    console.log('Start: ' + info.event.start.toISOString());
                                    console.log('End: ' + info.event.end.toISOString());
                                }
                            });

                            calendar.render(); // 캘린더 렌더링
                            //                         	var allEvents = calendar.getEvents();
                            //                         	console.log(allEvents);

                        });
                    }
                });


                // 2. 사용 할 영화 슬롯 가져오기(GET)
                var containerEl = document.getElementById('external-events-list');
                new FullCalendar.Draggable(containerEl, {
                    itemSelector: '.fc-event',
                    eventData: function (eventEl) {
                        return {
                            title: eventEl.innerText.trim()
                        }
                    }
                });

                var modalBody = $('.modal-body');
                var slots = [];
                var selectedMovieDC = 0;

                $.ajax({
                    url: "http://localhost:9001/api/v1/schedule/slot",
                    method: "GET",
                    success: function (slot) {
                        slots = slot;

                        var title = $('#title');
                        title.empty();

                        var titles = new Set(slot.map(item => item.title));

                        titles.forEach(function (item) {
                            var option = $('<option>').text(item).val(item);
                            title.append(option);
                        });

                        title.prop('selectedIndex', 0).trigger('change');
                    },
                    error: function (error) {
                        console.log("에러 :", error);
                        console.log("에러 상세 정보: ", error.responseText);
                    }
                });

                $('#title').change(function () {
                    var selectedTitle = $(this).val();
                    slots.forEach(function (item) {
                        if (item.title === selectedTitle) {
                            selectedMovieDC = item.movieDC;

                            // 3. 영화 슬롯 편집 (GET)
                            $.ajax({
                                url: "http://localhost:9001/api/v1/schedule/slot/" + selectedMovieDC,
                                method: "GET",
                                success: function (slot) {
                                    $('.modal-body').empty(); // 여기서 modalBody를 선택
                                    var viewAge = slot.viewAge;
                                    var showTm = slot.showTm;
                                    var color = slot.color;

                                    var slotInfo = $('<p>').text(viewAge + '/' + showTm + '분');
                                    var slotColor = $('<p>').text('색상: ').append($('<input type="color" id="color">').val(color || '#ffffff'));
                                    var slotBtn = $('<button class="updateBtn">').text('등록');

                                    // 버튼에 이벤트 리스너 추가
                                    slotBtn.on('click', function (event) {
                                        submitSlot(event);
                                    });

                                    $('.modal-body').append(slotInfo).append(slotColor).append(slotBtn);
                                },
                                error: function (error) {
                                    console.log("에러 :", error);
                                    console.log("에러 상세 정보: ", error.responseText);
                                }
                            });
                        }
                    });
                });

                // 4. 수정 슬롯 등록하기
                function submitSlot(event) {
                    event.preventDefault();

                    var inputColor = $('#color').val(); // .value가 아니라 .val()

                    $.ajax({
                        url: "http://localhost:9001/api/v1/schedule/slot/" + selectedMovieDC,
                        method: "PUT",
                        data: { color: inputColor }, // 데이터를 객체로 전달
                        success: function (slot) {
                            alert("저장되었습니다.");
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