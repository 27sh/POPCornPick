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
main {
	width: 1200px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

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

.sidebar {
    flex: 1;
    margin-right: 20px;
}
.main-content {
    flex: 3;
}


h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.tab-menu {
	display: flex;
	justify-content: space-around;
	margin-bottom: 20px;
	background-color: #white;
	border-bottom: 1px solid black;
	padding-bottom: 10px;
	
}
.tab-menu-item{
	cursor: pointer;
	padding: 15px;
}

.tab-menu-item:hover{
	color: #673AB7;
}

.tab-menu button {
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.tab-menu button:hover, .tab-menu button.active {
	border: 1px solid #816bff;
	color: white;
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

.notice-table th, .notice-table td {
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

.pagination button:hover, .pagination button.active {
	background-color: #ddd;
}

a:hover {
	color: gray;
}
.tab-menu button:hover {
    color: #816bff; /* Use a hash (#) for the color code */
}
.sidebar-container{
	margin-top: 150px;
}
</style>
</head>
<body>
           
<main>	
		<div class="sidebar-container">
			<%@ include file="../layout/serviceSideBar.jsp"%>
		</div>

	<div class="container">
			<h1>공지사항 목록</h1>
		<div class="tab-menu">
			<div id="" onclick="a(event)" class="tab-menu-item" data-value="공지사항">공지사항</div>
			<div id="" onclick="" class="tab-menu-item" data-value="이벤트">이벤트</div>
			<div id="" onclick="" class="tab-menu-item" data-value="FAQ">FAQ</div>
			<div id="" onclick="" class="tab-menu-item" data-value="문의">문의</div>
			<div id="" onclick="" class="tab-menu-item" data-value="신고">신고</div>
			<div>사이드바를 만들었으니 여기에 카테고리를 넣으면 될것같다.</div>
		</div>
		
		<br>
		<form class="search-form" onsubmit="searchNotice(event)">
			<label for="search">검색</label> <input type="text" id="search"
				placeholder="제목을 검색해주세요">
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
		
	   <div class="pagination" id="pagination">
             
        </div>
	</div>
	</main>
	
	<script>
    $(document).ready(function() {
        var currentPage = 1;
        var itemsPerPage = 10;

        loadPage(currentPage);

        function loadPage(page) {
            $.ajax({
                url: "http://localhost:9001/api/v1/admin/announcementList",
                method: "GET",
                data: {
                    page: page,
                    size: itemsPerPage
                },
                success: function(data) {
                    var tableBody = $("#tablebody");
                    tableBody.empty();

                    var counter = (page - 1) * itemsPerPage + 1;
                    data.forEach(function(not) {
                        var date = new Date(not.regdate);
                        var year = date.getFullYear();
                        var month = (date.getMonth() + 1).toString().padStart(2, '0');
                        var day = date.getDate().toString().padStart(2, '0');
                        var formattedDate = year + '-' + month + '-' + day;

                        var row = '<tr>' +
                            '<td>' + counter + '</td>' +
                            '<td>' + not.noticeCategory + '</td>' +
                            "<td><a href='http://localhost:8080/admin/noticeDetail/" + not.noticeNo + "'>" + not.noticeTitle + "</a></td>" +
                            '<td>' + formattedDate + '</td>' +
                            '</tr>';

                        tableBody.append(row);
                        counter++;
                    });

                    // Pagination
                    var pagination = $("#pagination");
                    pagination.empty();
                    var totalPages = Math.ceil(data.totalElements / itemsPerPage);
                    for (var i = 1; i <= totalPages; i++) {
                        var buttonClass = (i === page) ? "active" : "";
                        pagination.append('<button class="' + buttonClass + '" onclick="loadPage(' + i + ')">' + i + '</button>');
                    }
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        }

        function searchNotice(event) {
            event.preventDefault();
            var searchQuery = $("#search").val();
            $.ajax({
                url: "http://localhost:9001/api/v1/admin/search",
                method: "GET",
                data: { title: searchQuery },
                success: function(data) {
                    var tableBody = $("#tablebody");
                    tableBody.empty();

                    var counter = 1;
                    data.forEach(function(not) {
                        var date = new Date(not.regdate);
                        var year = date.getFullYear();
                        var month = (date.getMonth() + 1).toString().padStart(2, '0');
                        var day = date.getDate().toString().padStart(2, '0');
                        var formattedDate = year + '-' + month + '-' + day;

                        var row = '<tr>' +
                            '<td>' + counter + '</td>' +
                            '<td>' + not.noticeCategory + '</td>' +
                            "<td><a href='http://localhost:8080/admin/noticeDetail/" + not.noticeNo + "'>" + not.noticeTitle + "</a></td>" +
                            '<td>' + formattedDate + '</td>' +
                            '</tr>';

                        tableBody.append(row);
                        counter++;
                    });
                },
                error: function(xhr, status, error) {
                    console.log(error);
                }
            });
        }

        $("#searchForm").submit(function(event) {
            searchNotice(event);
        });
    });
    
    function a(event){
    	
    }
    
</script>

</body>
</html>