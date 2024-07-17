<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CinemaPage</title>
<link rel="stylesheet" href="/css/style.css">
<style>
    #like-cinema-container {
        background-color: #424242;
        padding: 20px;
        text-align: center; /* 부모 요소에 중앙 정렬 적용 */
    }
    #like-cinema-container h2, ul, li {
        color: white;
    }
    .cinema-item {
        color: #000;
        padding: 10px;
        margin: 10px 10px 10px 0; /* 가로 정렬 시 간격 추가 */
        border-radius: 5px;
        display: inline-block; /* 가로 정렬 */
        vertical-align: top; /* 상단 정렬 */
        position: relative; /* 가상 요소 위치 설정을 위해 */
        cursor: pointer; /* 마우스 커서 변경 */
    }
    .cinema-item:not(:last-child)::after {
        content: "";
        position: absolute;
        right: -5px;
        top: 50%; /* 가운데 맞추기 위해 조정 */
        transform: translateY(-50%);
        width: 1px;
        height: 50%; /* 세로 줄의 길이를 절반으로 설정 */
        background-color: #c7c7c7;
    }
    #cine-item-title.selected {
        color: #ffffff; /* 선택된 항목의 색상 변경 */
    }
    #cine-item-title {
        color: #c7c7c7;
    }
    #high-container {
        display: inline-block; /* 내부 요소를 중앙에 정렬 */
    }
    #high-container h2, 
    #high-container .select-cinema, 
    #high-container button {
        display: inline-block;
        vertical-align: middle;
        margin-right: 10px;
    }
    .select-cinema {
        border: 2px solid #c7c7c7;
        width: 150px;
        height: 40px;
    }
    
    .inner-select-cinema {
        border: 1px solid #c7c7c7;
        width: 145px;
        height: 35px;
        margin: 2px;
    }
    
    #high-container button {
        height: 46px; /* select-cinema 높이와 맞추기 위해 */
        width: 46px;
        font-size: 30px;
        background-color: #666666;
        color: #c7c7c7;
        border: 1px solid #6f6f6f;
        font-weight: bold;
    }
    .clearfix::after {
        content: "";
        display: table;
        clear: both;
    }
    #nav-container {
        text-align: center; /* 부모 요소에 중앙 정렬 적용 */
    }
    #nav-container ul {
        padding: 15px;
        margin: 20px 0;
        list-style-type: none;
        border-top: 1px solid #c7c7c7; /* 위쪽 가로 줄 추가 */
        border-bottom: 1px solid #c7c7c7; /* 아래쪽 가로 줄 추가 */
        display: inline-block; /* ul 요소를 중앙에 정렬 */
        width: 1000px;
    }
    #nav-container ul li {
        display: inline-block;
        margin: 0 30px;
        padding: 0 10px;
        position: relative;
        font-weight: bold;
        color: #c7c7c7;
        cursor: pointer; /* 마우스 커서 변경 */
    }
    #nav-container ul li.selected {
        color: #ffffff; /* 선택된 항목의 색상 변경 */
    }
    #row-container {
        text-align: left; /* 자식 요소들을 왼쪽으로 정렬 */
        margin: 0 0 0 60px;
    }
    #cinema-info {
        margin-top: 20px;
        color: #c7c7c7;
        padding: 20px;
        border-radius: 5px;
        display: none; /* 초기에는 숨기기 */
        position: relative; /* 자식 요소들의 위치 설정을 위해 */
    }
    #cinema-info-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    #cinema-info-title {
        font-size: 30px;
    }
    #cinema-info-bottom {
        position: relative; /* 자식 요소들의 위치 설정을 위해 */
    }
    #cinema-info-img {
        height: 500px;
        background-color: #424242;
        background-size: cover;
        background-position: center;
    }
    #cinema-info-text {
        position: absolute; /* 부모 요소 안에서 절대 위치 */
        left: 0;
        right: 0;
        bottom: 0;
        display: flex;
        flex-direction: row; /* 가로 정렬 */
        justify-content: space-between;
        color: white;
        background-color: rgba(0, 0, 0, 0.8); /* 반투명 검정 배경 */
        padding: 30px;
        height: 130px;
    }
    #cinema-info-left, #cinema-info-mid, #cinema-info-notice {
        margin-bottom: 10px;
    }
    
    #cinema-info-left {
        width: 50%;
    }
    
    #cinema-info-mid {
        width: 10%;
    }
    
    #cinema-info-notice {
	    width: 30%;
	    margin-bottom: 10px;
	    display: inline-block; /* 가로 정렬 */
	}
	
	#cinema-info-notice-text {
	    display: inline-block;
	}
    
    #cinema-info-notice button {
        background-color: #666666;
        color: #ffffff;
	    border: 1px solid #6f6f6f;
        font-weight: bold;
        cursor: pointer;
        margin-left: 10px; /* 버튼과 텍스트 사이 간격 */
        width: 15px;
	    height: 15px;
	    border-radius: 2px;
    }
    
    
    #cinema-info-intro {
        color: white;
    }
    
    #cinema-info-tel {
        color: white;
        margin-top: 15px;        
    }
    
    #cinema-info-notice-text {
        color: white;
    }
    
    #cinema-info-sRoom-list {
        color: white;
    }
    
    #inquery-btn {
        padding: 0 14px;
        border: 1px solid transparent;
        height: 30px;
        background-color: rgb(248, 47, 98);
        color: white;
    }
    
    #roomType-img {
    	margin-bottom: 5px;
    }
    
    #cinema-info-divider {
	    width: 1px;
	    background-color: #4f4f4f;
	    height: 100%;
	    display: inline-block;
	    vertical-align: top;
	    margin: 0 10px;
	}
    
    
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        var locationMap = {
            "서울": "seoul",
            "경기/인천": "gyeonggi_incheon",
            "충청/대전": "chungcheong_daejeon",
            "경북/대구": "gyeongbuk_daegu",
            "경남/부산/울산": "gyeongnam_busan_ulsan",
            "전라/광주": "jeonla_gwangju",
            "제주": "jeju"
        };

        function loadCinemas(location) {
            var mappedLocation = locationMap[location];
            if (mappedLocation) {
                $.ajax({
                    url: 'http://localhost:9001/api/v1/memberCinema/cinemaLocation/' + mappedLocation,
                    method: 'GET',
                    success: function(data) {
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
                            }
                        });

                        $('.cinema-item').click(function() {
                            $('.cinema-item #cine-item-title').removeClass('selected');
                            $(this).find('#cine-item-title').addClass('selected');
                            var cinemaName = $(this).data('cinema-name');
                            var cinemaNo = $(this).data('cinema-no');
                            var selectedCinema = data.find(c => c.cinemaName === cinemaName);
                            if (selectedCinema) {
                                showCinemaInfo(selectedCinema);
                                loadRooms(cinemaNo);
                            }
                        });
                    },
                    error: function(error) {
                        console.log("Error:", error);
                    }
                });
            }
        }

        function showCinemaInfo(cinema) {
            $('#cinema-info-title').text('팝콘픽 ' + cinema.cinemaName);
            $('#cinema-info-img').css('background-image', 'url(/img/' + cinema.cinemaImgNewName + ')');
            $('#cinema-info-intro').text(cinema.cinemaIntro);
            $('#cinema-info-tel').text(cinema.cinemaTel);
            $('#cinema-info').show();
        }

        function loadRooms(cinemaNo) {
            console.log("Loading rooms for cinemaNo: ", cinemaNo);
            $.ajax({
                url: 'http://localhost:9001/api/v1/memberCinema/cinemaRooms/' + cinemaNo,
                method: 'GET',
                success: function(data) {
                    console.log("Rooms data: ", data);
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
                    console.log("Error:", error);
                }
            });
        }

        $('#nav-container ul li').click(function() {
            var location = $(this).text();
            loadCinemas(location);
            $('#nav-container ul li').removeClass('selected');
            $(this).addClass('selected');
        });

        // 기본적으로 '서울'을 선택
        loadCinemas("서울");
        $('#nav-container ul li').first().addClass('selected');
    });
</script>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
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
            <button>+</button>
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
        <div id="row-container">
        </div>
    </div>
    <div id="cinema-info">
        <div id="cinema-info-top">
            <div id="cinema-info-title"></div>
            <button id="inquery-btn">단체/대관문의</button>
        </div>
        <div id="cinema-info-bottom">
            <div id="cinema-info-img"></div>
            <div id="cinema-info-text">
                <div id="cinema-info-left">
                    <div id="cinema-info-intro"></div>
                    <div id="cinema-info-tel"></div>
                </div>
                <div id="cinema-info-mid">
                    <div id="cinema-info-sRoom"></div>
                </div>
                <div id="cinema-info-divider"></div>
                <div id="cinema-info-notice">
                    <div id="cinema-info-notice-text">공지사항</div>
                    <button>+</button>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
