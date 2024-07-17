<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    }
    #like-cinema-container h2, ul, li {
        color: white;
    }
    .cinema-item {
        background-color: #fff;
        color: #000;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
    }
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        $('#nav-container ul li').click(function() {
            var location = $(this).text();
            var locationMap = {
                "서울": "seoul",
                "경기/인천": "gyeonggi_incheon",
                "충청/대전": "chungcheong_daejeon",
                "경북/대구": "gyeongbuk_daegu",
                "경남/부산/울산": "gyeongnam_busan_ulsan",
                "전라/광주": "jeonla_gwangju",
                "제주": "jeju"
            };

            var mappedLocation = locationMap[location];
            if (mappedLocation) {
                $.ajax({
                    url: 'http://localhost:9001/api/v1/memberCinema/cinemaLocation/' + mappedLocation,
                    method: 'GET',
                    success: function(data) {
                        $('#row-container').empty();
                        data.forEach(function(cinema) {
                            var cinemaItem = '<div class="cinema-item">' +
                                '<h3>' + cinema.cinemaName + '</h3>' +
                                '<p>' + cinema.cinemaAddr + '</p>' +
                                '<p>' + cinema.cinemaTel + '</p>' +
                                '<p>' + cinema.cinemaIntro + '</p>' +
                                '</div>';
                            $('#row-container').append(cinemaItem);
                        });
                    },
                    error: function(error) {
                        console.log("Error:", error);
                    }
                });
            }
        });
    });
</script>

</head>
<body>
<%@ include file="../layout/header.jsp" %>
<main>
    <div id="like-cinema-container">
        <div id="high-container">
            <h2>자주 가는 팝콘픽 극장</h2>
            <div class="select-cinema"></div>
            <div class="select-cinema"></div>
            <div class="select-cinema"></div>
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
</main>
</body>
</html>
