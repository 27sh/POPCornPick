<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 평점</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
    #full-container {
        display: flex;
        width: 100%;
    }
    
    #sidebar-container {
        width: 200px;
        background-color: #f4f4f4;
        padding: 10px;
    }
    
    #container {
        flex: 1;
        padding: 10px;
    }
    
    #review-container {
        display: flex;
        align-items: center;
        padding: 10px;
        gap: 10px;
    }
    
    #review-title {
        margin-bottom: 0; /* 기본 margin 제거 */
    }
    
    .score-cell {
    }

    .score-cell img {
        width: 20px;
        height: 20px;
        float: left;
    	display: block;
    }
    
    table {
        width: 950px;
        border-collapse: collapse;
        margin-left: 20px;
    	margin-top: 30px;
    }

    thead {
        background-color: #e3e3e3;
        color: gray;
    }

    th, td {
        border-bottom: 1px solid gray;
        padding: 8px;
        text-align: center; /* 텍스트 가운데 정렬 */
    }
    
    td {
    	height: 40px;
    }
    
    td:nth-child(2) {
    	width: 480px;
    }

	#count-review {
		font-weight: bold;
	    color: darkgray;
	    margin: 5px 10px 0 0;
	}
	
</style>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var token = localStorage.getItem("jwtToken");

    if (!token) {
        console.error("No token found in local storage");
        return;
    }

    fetch("http://localhost:9001/api/v1/myPage/myReviews", {
        method: "GET",
        headers: {
            "Authorization": "Bearer " + token
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok ' + response.statusText);
        }
        return response.json();
    })
    .then(data => {
        const reviewTable = document.getElementById("review-table").getElementsByTagName('tbody')[0];
        reviewTable.innerHTML = "";

        data.forEach(review => {
            var row = reviewTable.insertRow();
            var movieTitle = review.ticketing.reservatedSeat.schedule.movieShowDetail.movie.title;
            row.insertCell(0).innerText = movieTitle; // 영화 제목
            row.insertCell(1).innerText = review.reviewContent;

            // 별점 이미지를 추가합니다.
            var scoreCell = row.insertCell(2);
            scoreCell.className = 'score-cell';
            for (var i = 0; i < review.reviewScore; i++) {
                var img = document.createElement('img');
                img.src = '/img/full_score.png';
                img.alt = '별점';
                img.width = 20;
                img.height = 20;
                scoreCell.appendChild(img);
            }
            for (var i = review.reviewScore; i < 5; i++) {
                var img = document.createElement('img');
                img.src = '/img/blank_score.png';
                img.alt = '빈 별점';
                img.width = 20;
                img.height = 20;
                scoreCell.appendChild(img);
            }

            row.insertCell(3).innerText = new Date(review.regdate).toLocaleDateString();
        });

        document.getElementById("count-review").innerText = data.length + "건";
    })
    .catch(error => console.error('Error:', error));
});
</script>
</head>
<body>
    <main>
        <%@ include file="./mainInfo.jsp"%>

        <div id="full-container">
            <div class="sidebar-container">
                <%@ include file="./sideMenu.jsp"%>
            </div>
            <div id="container">
                <div id="review-container">
                    <h2 id="review-title">내가 쓴 평점</h2>
                    <div id="count-review">0건</div>
                </div>
                <div id="table-container">
                    <table id="review-table">
                        <thead>
                            <tr>
                                <th>영화 제목</th>
                                <th>평점</th>
                                <th>별점</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 데이터가 여기에 추가될 것입니다 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <!-- footer 내용 -->
    </footer>
</body>
</html>
