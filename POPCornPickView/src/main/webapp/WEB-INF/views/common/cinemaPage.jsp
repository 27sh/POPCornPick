<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CinemaPage</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/scheduleSection.css">
<link rel="stylesheet" href="/css/cinemaPageTop.css">
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/js/cinemaPageTop.js"></script>
<style>
</style>
<script>

</script>

</head>
<body>
	<%@ include file="../layout/header.jsp"%>
	<main>
		<div id="like-cinema-container">
			<div id="high-container" class="clearfix">
				<h2>자주 가는 팝콘픽</h2>
				<div class="select-cinema">
					<div class="inner-select-cinema" id="inner-select-1"></div>
				</div>
				<div class="select-cinema">
					<div class="inner-select-cinema" id="inner-select-2"></div>
				</div>
				<div class="select-cinema">
					<div class="inner-select-cinema" id="inner-select-3"></div>
				</div>
				<button id="plus-like-cinema-btn">+</button>
			</div>
			<div id="nav-container">
				<ul>
					<li>서울</li>
					<li>경기/인천</li>
					<li>충청/대전</li>
					<li>경북/대구</li>
					<li>경남/부산/울산</li>
					<li>전라/광주</li>
					<li>제주</li>
				</ul>
			</div>
			<div id="row-container"></div>
		</div>
		<div>
			<img src="/img/theater.png" alt="theater" style="padding: 20px 0;">
		</div>
		<div id="cinema-info">
			<div id="cinema-info-top">
				<div id="cinema-info-title-container">
					<div id="cinema-info-title"></div>
					<div id="star-img"></div>
				</div>
				<button id="inquery-btn">단체/대관문의</button>
			</div>
			<div id="cinema-info-between">
				<div id="cinema-info-Snotice">
					<div id="cinema-info-notice-title">중요 알림</div>
					<div id="cinema-info-notice-inner-text"></div>
					<!-- 여기서 변경된 ID 사용 -->
					<button id="cinema-snotice-btn">✕</button>
				</div>
			</div>
			<div id="cinema-info-bottom">
				<div id="cinema-info-img"></div>
				<div id="cinema-info-text">
					<div id="cinema-info-left">
						<div id="cinema-info-addr"></div>
						<div id="cinema-info-tel"></div>
						<div id="cinema-info-room"></div>
						<!-- 방 개수 출력 -->
					</div>
					<div id="cinema-info-mid">
						<div id="cinema-info-sRoom"></div>
					</div>
					<div id="cinema-info-divider"></div>
					<div id="cinema-info-notice">
						<div id="cinema-info-notice-text">공지사항</div>
						<!-- 여기서 변경된 ID 사용 -->
						<button>+</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 모달 창 구조 -->
		<div id="myModal" class="modal">
			<div class="modal-content">
				<div id="bar-content">
					<div id="bar-title">자주가는 팝콘픽 설정</div>
					<span class="close">&times;</span>
				</div>
				<div id="modal-high-div">
					<div id="modal-select-container">
						<div id="modal-ex-div">영화관을 선택하여 등록해주세요. 최대 3개까지 등록하실 수
							있습니다.</div>
						<div id="modal-select-div">
							<select name="location" id="select-cinema-location">
								<option value="seoul">서울</option>
								<option value="gyeonggi_incheon">경기/인천</option>
								<option value="chungcheong_daejeon">충청/대전</option>
								<option value="gyeongbuk_daegu">경북/대구</option>
								<option value="gyeongnam_busan_ulsan">경남/부산/울산</option>
								<option value="jeonla_gwangju">전라/광주</option>
								<option value="jeju">제주</option>
							</select> <select name="cinema" id="select-cinema-cinemaName">
							</select>
							<button id="plus-like-cinema-btn-temporary">자주가는 팝콘픽 추가</button>
						</div>
					</div>
					<div id="modal-box-container">
						<div id="modal-ex-title">user님이 자주 가는 팝콘픽</div>
						<div id="box-cinema-name-container">
							<div class="modal-box-cinema">
								<div class="modal-box-cinema-name" id="box-cinema-name1"></div>
								<button class="modal-box-cinema-x">x</button>
							</div>
							<div class="modal-box-cinema">
								<div class="modal-box-cinema-name" id="box-cinema-name2"></div>
								<button class="modal-box-cinema-x">x</button>
							</div>
							<div class="modal-box-cinema">
								<div class="modal-box-cinema-name" id="box-cinema-name3"></div>
								<button class="modal-box-cinema-x">x</button>
							</div>
						</div>
					</div>
				</div>
				<hr style="border: dashed 1px lightgray; margin: 0 20px;">
				<div id="modal-row-div">
					<table>
						<thead>
							<tr>
								<th>항목</th>
								<th>이용목적</th>
								<th>보유기간</th>
								<th>동의여부</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>자주가는 <br> 팝콘픽 <br> (최대3개)
								</td>
								<td>- 상품 결제시(영화 예매시) 편의 제공 <br> - 선호 극장의 상영작 및 상영시간 우선
									제공
								</td>
								<td>별도 동의 철회시까지 또는 약관 철회 후 1주일까지</td>
								<td><input type="radio" name="chkY" value="동의함" checked>동의함<br>
									<input type="radio" name="chkY" value="동의안함">동의안함</td>
							</tr>
						</tbody>
					</table>
					<p style="padding: 10px 0; color: gray; font-size: 11px;">※ 동의를
						거부하시는 경우에도 본 서비스 외 다른 팝콘픽 서비스를 이용하실 수 있습니다.</p>
				</div>
				<div id="modal-button-container">
					<button id="modal-close-btn">취소</button>
					<button id="save-changes-btn">등록하기</button>
				</div>
			</div>
		</div>


		<ul id="tab_wrap">

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
			</div>
			<!-- tab_con  END -->
			</li>
			<!-- 영화관별 상영시간표 -->
		</ul>



		<a href="#" class="btn_gotop"> TOP </a> <a href="/reservation/main"
			class="btn_goreservation"> 예매하기 </a>

	</main>
</body>
</html>
