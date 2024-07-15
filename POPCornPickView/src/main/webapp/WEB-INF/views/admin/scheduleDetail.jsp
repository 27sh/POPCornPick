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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

        <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    </head>
    <%@ include file="../layout/adminHeader.jsp" %>

        <body>
            <div id='external-events'>
                <h4>영화 목록</h4>

                <div id='external-events-list' style="overflow: hidden;">
                </div>

                <p>
                    <input type='checkbox' id='drop-remove' />
                    <label for='drop-remove'>드롭 후 삭제</label>
                </p>
            </div>
            <main>
                <div id='calendar-wrap'>
                    <div id='calendar'></div>
                </div>

                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="modal-title">
                                    <select name="title" id="title"></select>
                                </div>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <button class="updateBtn" onclick="submitSlot(event)">등록</button>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                    취소
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

        </body>
        <script>

            // 1. 기본 캘린더 불러오기
        $(document).ready(function () {        	
            var calendarEl = document.getElementById('calendar');
            var roomNo = ${roomNo};       
            localStorage.setItem('roomNo', roomNo);
      		
            function toKST(date) {
                return new Date(date).toLocaleString('ko-KR', { timeZone: 'Asia/Seoul' });
            }
            $.ajax({
                url: "http://localhost:9001/api/v1/schedule/" + roomNo,
                method: "GET",
                success: function (schedule) {
                    var events = [];
                    schedule.forEach(function (item) {
                    	// console.log(item);
                    	var start = new Date(item.start);
                        var end = new Date(start.getTime() + item.movieShowDetail.movie.showTm * 60000); // showTm 분 후의 시간 계산
                        
                        var event = {
                            title: item.movieShowDetail.movie.title,
                            start: start,
                            end: end,
                            borderColor: item.movieShowDetail.movie.color,
                            backgroundColor: item.movieShowDetail.movie.color,
                            extendedProps: {
                                detailNo: item.movieShowDetail.detailNo // detailNo를 extendedProps에 추가
                            }
                        };
                        events.push(event);
                    });
                    
                    var calendar = new FullCalendar.Calendar(calendarEl, {
                    	
                        customButtons: {
                            mySaveButton: {
                                text: '저장',                 
                                click: function () {
                                    if(confirm('저장하시겠습니까?')){
                                    	var allEvents = calendar.getEvents();
                                        var saveData = allEvents.map(event => {                                    	
                                            return {
                                                title: event.title,
                                                detailNo: event.extendedProps.detailNo,
                                                start: event.start.toISOString(), // ISO 형식으로 변환
                                                end: event.end.toISOString(),     // ISO 형식으로 변환
                                                roomNo: roomNo
                                            };
                                        });
                                    	

                                    	$.ajax({
                                    		url: "http://localhost:9001/api/v1/schedule/" + roomNo + "/" + title,
                                            method: "PUT",
                                            contentType: "application/json", // JSON 형식으로 데이터 전송
                                            data: JSON.stringify(saveData),
                                            success: function(save){
                                            	console.log(save);
                                            	alert("저장되었습니다.");
                                            },
                                            error: function (error) {
                                                console.log("에러 :", error);
                                                console.log("에러 상세 정보: ", error.responseText);
                                            }
                                    	});
                                    }
                                }
                            },
                            myDeleteButton: {
                                text: '삭제',
                                click: function () {
                                    alert('삭제 confirm창 한번 더 띄워야됨');
                                }
                            },
                            slotPlusButton: {
                                text: '영화 추가하기',
                                click: function () {
                                    $("#exampleModal").modal("show");
                                }
                            }
                        },
                        headerToolbar: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                        },
                        footerToolbar: {
                            right: 'mySaveButton,myDeleteButton,slotPlusButton'
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
                        events: events,
                        eventReceive: function (eventDropped) {
                        	
                        	console.log(eventDropped.event);
                        	console.log(slots);
                            var showTm = parseInt(eventDropped.draggedEl.getAttribute('data-showTm')); // 드래그된 요소에서 showTm 가져오기
                            var start = eventDropped.event.start; // 드롭된 이벤트의 시작 시간
                            var end = new Date(start.getTime() + showTm * 60000); // showTm 분 후의 시간 계산

                            eventDropped.event.setProp('backgroundColor', eventDropped.draggedEl.getAttribute('data-color'));
                            eventDropped.event.setProp('borderColor', eventDropped.draggedEl.getAttribute('data-color'));
                            eventDropped.event.setEnd(end); // 계산된 end 시간을 설정
                            
//                             for(i=0; i<slots.length, i++){
//                             	if(eventDropped.event.title === slots[i].title){
//                             		var detailNo;
//                             		eventDropped.event.setExtendedProp('detailNo', detailNo);
//                             	}
//                             }

                        },
                        timeZone: 'local',
                        navLinks: true,
                        selectable: true,
                        nowIndicator: true,
                        locale: 'ko',
                        editable: true,
                        eventDurationEditable: false,
                        droppable: true,  // 기본적으로 드롭 비활성화
                        drop: function (arg) {
                            if (document.getElementById('drop-remove').checked) {
                                arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                            }
                        },
                        eventDrop: function (info) {
                            console.log('Event dropped');
                            console.log('Event: ' + info.event.title);
                            console.log('Start: ' + toKST(info.event.start));
                            console.log('End: ' + (info.event.end ? toKST(info.event.end) : 'N/A'));                      
                        },
                        datesSet: function (view) {
                            if (view.view.type === 'dayGridMonth') {
                                $('#external-events').hide();
                                $('.fc-mySaveButton-button').hide();
                                $('.fc-myDeleteButton-button').hide();
                                $('.fc-slotPlusButton-button').hide();

                            } else {
                                $('#external-events').show();
                                $('.fc-mySaveButton-button').show();
                                $('.fc-myDeleteButton-button').show();
                                $('.fc-slotPlusButton-button').show();
                            }
                        }
                    });

                    calendar.render();
                }
            });
                // 2. 사용 할 영화 슬롯 가져오기(GET)
                var containerEl = document.getElementById('external-events-list');
                // FullCalendar의 Draggable 기능 초기화
                new FullCalendar.Draggable(containerEl, {
                    itemSelector: '.fc-event',
                    eventData: function (eventEl) {
                        var mainEventEl = eventEl.querySelector('.fc-event-main');
                        return {
                            title: mainEventEl ? mainEventEl.innerText.trim() : ''
                        };
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

                        var externalEventsList = $('#external-events-list');

                        var title = $('#title');
                        title.empty();

                        var titles = new Set(slot.map(item => item.title));

                        titles.forEach(function (item) {
                            // 해당 제목과 일치하는 첫 번째 슬롯을 찾습니다.
                            var matchingSlot = slots.find(s => s.title === item);

                            var mainEventEl = document.createElement('div');
                            mainEventEl.className = 'fc-event-main';
                            mainEventEl.innerText = item;

                            // color 값을 설정
                            var color = matchingSlot ? matchingSlot.color : null;
                            if (color === null) {
                                mainEventEl.style.display = 'none';
                            } else {
                                mainEventEl.style.backgroundColor = color;
                                mainEventEl.setAttribute('data-color', color);
                            }

	
                            var eventEl = document.createElement('div');
                            eventEl.className = 'fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event';
                            eventEl.setAttribute('data-color', color); 
                            if (matchingSlot) {
                                eventEl.setAttribute('data-showTm', matchingSlot.showTm); // showTm 설정
                            }
                            
                            eventEl.appendChild(mainEventEl);

                            containerEl.appendChild(eventEl);

                            externalEventsList.append(containerEl);

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

                // 4. 영화 슬롯 등록하기
                function submitSlot(event) {
                    event.preventDefault();

                    var inputColor = $('#color').val(); // .value가 아니라 .val()

                    $.ajax({
                        url: "http://localhost:9001/api/v1/schedule/slot/" + selectedMovieDC,
                        method: "PUT",
                        contentType: "application/json", // contentType을 application/json으로 설정
                        data: JSON.stringify({ color: inputColor }), // 데이터를 JSON 문자열로 변환하여 전송
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>

    </html>