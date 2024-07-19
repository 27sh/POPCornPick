<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CinemaPage</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/cinemaPageTop.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    /* 모달 창 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1000; /* 헤더보다 위에 표시되도록 z-index 설정 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #f6f6f4;
        margin: 10% auto;
        border: 5px solid #313131;
        width: 620px;
        height: 520px;    
    }

    .close {
        color: white;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        text-decoration: none;
        cursor: pointer;
    }
</style>
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

    var reverseLocationMap = {
        "seoul": "서울",
        "gyeonggi_incheon": "경기/인천",
        "chungcheong_daejeon": "충청/대전",
        "gyeongbuk_daegu": "경북/대구",
        "gyeongnam_busan_ulsan": "경남/부산/울산",
        "jeonla_gwangju": "전라/광주",
        "jeju": "제주"
    };

    function loadFavoriteCinemas() {
        $.ajax({
            url: 'http://localhost:9001/api/v1/memberCinema/favoriteCinemas',
            method: 'GET',
            headers: {
                'Authorization': 'Bearer ' + localStorage.getItem('jwtToken')
            },
            success: function(data) {
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
                $('#inner-select-1').trigger('click');
            },
            error: function(error) {
                console.log("Error:", error);
            }
        });
    }

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
                            loadRoomCount(cinema.cinemaNo);
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
                            loadRoomCount(cinemaNo);
                        }
                        $('#cinema-info-between').show();
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
                    console.log("Error:", error);
                }
            });
        }
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

        console.log(selectedCinemas); // 추가된 로그
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
                console.log("Error:", error);
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

    function loadRoomCount(cinemaNo) {
        $.ajax({
            url: 'http://localhost:9001/api/v1/memberCinema/cinemaRoomCount/' + cinemaNo,
            method: 'GET',
            success: function(data) {
                var count = data.roomCount;
                var seatSum = data.seatSum;
                $('#cinema-info-room').text(count + '관 / ' + seatSum + '석');
            },
            error: function(error) {
                console.log("Error:", error);
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
        $.ajax({
            url: 'http://localhost:9001/api/v1/memberCinema/cinemaLocation/' + location,
            method: 'GET',
            success: function(data) {
                $('#select-cinema-cinemaName').empty();
                data.forEach(function(cinema) {
                    $('#select-cinema-cinemaName').append('<option value="' + cinema.cinemaName + '">' + cinema.cinemaName + '</option>');
                });
            },
            error: function(error) {
                console.log("Error:", error);
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
    loadCinemasForLocation('seoul');
    $('#select-cinema-location').val('seoul');

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
});

$(document).ready(function() {
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
        <div id="row-container">
        </div>
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
                <div id="cinema-info-notice-inner-text"></div> <!-- 여기서 변경된 ID 사용 -->
                <button id="cinema-snotice-btn">✕</button>
            </div>
        </div>
        <div id="cinema-info-bottom">
            <div id="cinema-info-img"></div>
            <div id="cinema-info-text">
                <div id="cinema-info-left">
                    <div id="cinema-info-addr"></div>                    
                    <div id="cinema-info-tel"></div>
                    <div id="cinema-info-room"></div> <!-- 방 개수 출력 -->
                </div>
                <div id="cinema-info-mid">
                    <div id="cinema-info-sRoom"></div>
                </div>
                <div id="cinema-info-divider"></div>
                <div id="cinema-info-notice">
                    <div id="cinema-info-notice-text">공지사항</div> <!-- 여기서 변경된 ID 사용 -->
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
                    <div id="modal-ex-div">영화관을 선택하여 등록해주세요. 최대 3개까지 등록하실 수 있습니다.</div>
                    <div id="modal-select-div">
                        <select name="location" id="select-cinema-location">
                            <option value="seoul">서울</option>
                            <option value="gyeonggi_incheon">경기/인천</option>
                            <option value="chungcheong_daejeon">충청/대전</option>
                            <option value="gyeongbuk_daegu">경북/대구</option>
                            <option value="gyeongnam_busan_ulsan">경남/부산/울산</option>
                            <option value="jeonla_gwangju">전라/광주</option>
                            <option value="jeju">제주</option>
                        </select>
                        <select name="cinema" id="select-cinema-cinemaName">
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
            <hr style="
                border: dashed 1px lightgray;
                margin: 0 20px;
            ">
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
                            <td>자주가는
                                <br>
                                팝콘픽
                                <br>
                                (최대3개)
                            </td>
                            <td>
                                - 상품 결제시(영화 예매시) 편의 제공 <br>
                                - 선호 극장의 상영작 및 상영시간 우선 제공
                            </td>
                            <td>
                                별도 동의 철회시까지 또는 약관 철회 후 1주일까지
                            </td>
                            <td>
                                <input type="radio" name="chkY" value="동의함" checked>동의함<br>
                                <input type="radio" name="chkY" value="동의안함">동의안함
                            </td>
                        </tr>
                    </tbody>
                </table>
                <p style="padding: 10px 0; color: gray; font-size: 11px;">※ 동의를 거부하시는 경우에도 본 서비스 외 다른 팝콘픽 서비스를 이용하실 수 있습니다.</p>
            </div>
            <div id="modal-button-container">
                <button id="modal-close-btn">취소</button>
                <button id="save-changes-btn">등록하기</button>
            </div>
        </div>
    </div>
    
    <a href="#" class="btn_gotop">
      TOP
    </a>
    
    <a href="/reservation/main" class="btn_goreservation">
      예매하기
    </a>
    
</main>
</body>
</html>
