<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../layout/adminHeader.jsp"%>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    margin: 50px auto;
    padding: 20px;
    background-color: white;
    border-radius: 5px;
}

h1 {
    font-size: 24px;
    margin-bottom: 20px;
}

.tab-menu {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;

}


.tab-menu button {
    padding: 10px 20px;
    border: none;
    background-color: #f0f0f0;
    cursor: pointer;
    border-radius: 5px;
}

.tab-menu button:hover,
.tab-menu button.active {
    background-color: #ddd;
}

.search-form {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    margin-bottom: 20px;
}

.search-form label {
    margin-right: 10px;
    font-weight: bold;
}

.search-form input[type="text"] {
    width: 300px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-right: 10px;
}

.search-form button {
    padding: 10px 20px;
    background-color: #555;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.search-form button:hover {
    background-color: #333;
}

.notice-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.notice-table th,
.notice-table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

.notice-table th {
    background-color: #f0f0f0;
}

.notice-table .red {
    color: red;
}

.pagination {
    display: flex;
    justify-content: center;
    align-items: center;
}

.pagination button {
    padding: 10px 20px;
    border: none;
    background-color: #f0f0f0;
    cursor: pointer;
    border-radius: 5px;
    margin: 0 5px;
}

.pagination button:hover,
.pagination button.active {
    background-color: #ddd;
}
a:hover{
 color: gray;
}
</style>
</head>
<body>


  <div class="container">
        <h1>공지사항 목록</h1>
        <div class="tab-menu">
            <div id="">공지사항</div>
            <div id="">이벤트</div>
            <div id="">FAQ</div>
            <div id="">문의</div>
            <div id="">신고</div>
        </div>
        <hr>
        <br>
        <form class="search-form">
            <label for="search">검색</label>
            <input type="text" id="search" placeholder="검색어를 입력해주세요.">
            <button type="submit">검색</button>
        </form>
        <table class="notice-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>구분</th>
                    <th>제목</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody id="tablebody">
               
            </tbody>
        </table>
        <div class="pagination">
            <button>&lt;</button>
            <button class="active">1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>&gt;</button>
        </div>
    </div>
<script>
	$(document).ready(function(){
		$.ajax({
			url : "http://localhost:9001/api/v1/admin/announcementList",
			mehtod : "GET",
			success : function(data){
					var tableBody = $("#tablebody");
					tableBody.empty();
					
					var counter =1;
					data.forEach(function(not){
						
						var date = new Date(not.regdate);
						var year = date.getFullYear();
						var month = (date.getMonth() + 1).toString().padStart(2,'0');
						var day = date.getDate().toString().padStart(2,'0');
						var formattedDate = year + '-' + month + '-' + day;
						
						var row= '<tr>' +
						'<td>' + counter +  '</td>' + 
						'<td>' + not.noticeCategory +  '</td>' +
						"<td><a href='http://localhost:8080/admin/noticeDetail/" + not.noticeNo + "'>" + not.noticeContent + "</a></td>" +						
						'<td>' + formattedDate +  '</td>' +
						+'</tr>';
						
						tableBody.append(row);
						
						counter++;
						console.log(counter);
						console.log(not.noticeCategory);
						console.log(not.noticeContent);
						console.log(formattedDate);
						
					})
			},
			error : function(xhr, status, error){
				console.log(error);
			}
		});
	});

	
	
	
</script>

</body>
</html>