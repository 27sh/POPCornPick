<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>상영시간표</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/scheduleList.css">
<script src="https://code.jquery.com/jquery-3.7.1.js"
integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<%@ include file="../layout/header.jsp"%>
<body>
	<main>
		<div id="wrap">

			<ul id="tab_wrap">

				<li class="btn_wrap">
					<button type="button" class="tab_btn btn1">영화관 별 상영시간표</button>
					<button type="button" class="tab_btn btn2">영화별 상영시간표</button>
				</li>

				<!-- 버튼 -->


				<li class="main_tab">
					<div class="tab_con">
						<div class="tab_con_1">
							<div class="tab_tit cName"></div>
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
							<div class="tab_tit"></div>
							<!-- 선택한 날짜 출력 -->

							<div class="calendar">
								<div class="date_wrap">
									<ul class="date_tab">
										<li></li>
									</ul>
								</div>
								<!-- 날짜 영역 -->
								<div class="room_wrap">
									<ul class="room_tab"></ul>
								</div>
								<!-- 관람관 영역 -->
								<div class="schedule_wrap">
									<div class="schedule_con">
										<div class="sche_tit"></div>
										<p class="sche_showTypes"></p>
										<ul class="sche_time">
											<li></li>
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

				<li class="main_tab">

					<div class="tab_con">
						<div class="tab_con_1">
							<div class="tab_tit"></div>
							<!-- 선택한 영화 이름 출력 -->

							<ul class="select_wrap">
								<li class="select_1">
									<ul id="cinemaLocation" class="region">
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

	</main>
</body>
<script>

$(document).ready(function(){
    var cinemas = [];
    var selectedCinemaNo = 0; // 전역 변수로 선언된 선택된 극장의 cinemaNo

    // 극장 목록
    $.ajax({
        url: "http://localhost:9001/api/v1/schedule/cinema",
        method: "GET",
        success: function (cinema) {
            cinemas = cinema; // 전역 변수에 저장

            // 극장 위치
            var cinemaLocation = $('.region');
            cinemaLocation.empty(); // 요소 비움

            // 중복된 위치를 제거하기 위해 Set 사용
            var locations = new Set(cinemas.map(item => item.cinemaLocation));
            locations.forEach(function (location) {
                console.log(location);
                var li = $('<li>').text(location).addClass('region-item');
                cinemaLocation.append(li);
            });
        },
        error: function (error) {
            console.log("에러 :", error);
            console.log("에러 상세 정보: ", error.responseText);
        }
    });

    // 극장 위치 선택 시 이벤트 처리
    $(document).on('click', '.region-item', function () {
        var selectedLocation = $(this).text();

        // 찾은 cinemaNo 저장
        cinemas.forEach(function (item) {
            if (item.cinemaLocation === selectedLocation) {
                selectedCinemaNo = item.cinemaNo; // 선택된 극장의 cinemaNo를 전역 변수에 저장
            }
        });

        // 극장 이름
        var cinemaName = $('.cinema');
        cinemaName.empty(); // 요소 비움

        // 선택된 위치의 극장 이름 추가
        cinemas.forEach(function (item) {
            if (item.cinemaLocation === selectedLocation) {
                var li = $('<li>').text(item.cinemaName).addClass('cinema-item');
                cinemaName.append(li);
            }
        });
    });

    // 극장 이름 선택 시 이벤트 처리
    $(document).on('click', '.cinema-item', function () {
        var selectedCinemaName = $(this).text();
        $('.cName').text(selectedCinemaName); // 선택한 cinema의 이름을 .cName에 출력

        // 선택된 극장의 관람관 정보를 가져오는 Ajax 요청
        $.ajax({
            url: "http://localhost:9001/api/v1/schedule/cinema/" + selectedCinemaNo,
            method: "GET",
            success: function (rooms) {
                console.log("선택된 극장의 관람관 정보: ", rooms);

                var roomTab = $('.room_tab');
                roomTab.empty(); // 요소 비움

                // 각 관람관의 정보를 room_tab에 li 형태로 추가
                rooms.sort((a, b) => a.roomType.roomTypeNo - b.roomType.roomTypeNo).forEach(function (room) {
                    var li = $('<li>').text(room.roomType.roomName);
                    roomTab.append(li);

                    var roomNo = room.roomNo;

                    // 선택된 극장의 스케쥴을 가져오는 Ajax 요청
                    $.ajax({
                        url: "http://localhost:9001/api/v1/schedule/" + roomNo,
                        method: "GET",
                        success: function (schedule) {
                            //console.log("선택된 관람관의 스케쥴: ", schedule);
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
