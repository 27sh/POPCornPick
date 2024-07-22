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
