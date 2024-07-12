<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeWrite</title>
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
	width: 60%;
	margin: 50px auto;
	padding: 20px;
	background-color: white;
	//box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

label {
	margin-bottom: 10px;
	font-weight: bold;
}

select, input[type="text"], textarea {
	width: 98%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 16px;
}

textarea {
	height: 200px;
	resize: none;
}

input[type="file"] {
	margin-bottom: 20px;
}

button {
	padding: 10px 20px;
	background-color: #ff0066;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
}

button:hover {
	background-color: #cc0052;
}

/* Additional styling for specific elements */
.file-info {
	font-size: 14px;
	color: #555;
}

.cancel-btn {
	background-color: #ccc;
	color: black;
}

.cancel-btn:hover {
	background-color: #999;
}
</style>
</head>
<body>
	
	<div class="container">
        <h1>공지사항 관리</h1>
        
            <label for="category">카테고리 <span style="color: red;">*</span></label>
            <select id="category" name="category"  required>
                <option value="전체">전체</option>
                <option value="시스템점검">시스템점검</option>
                <option value="극장">극장</option>
                <option value="행사/이벤트">행사/이벤트</option>
                <option value="제휴이벤트">제휴이벤트</option>
                <option value="기타">기타</option>
                <!-- Add more options here -->
            </select>
			<hr>
            <label for="title">제목 <span style="color: red;">*</span></label>
            <input type="text" id="title" name="title" required>

            <label for="content">내용 <span style="color: red;">*</span></label>
            <textarea id="content" name="content" required></textarea>
			<hr>
            <label for="file">첨부파일</label>
            <input type="file" id="file" name="file">
            <p class="file-info">*첨부가능 확장자: 이미지(jpg, gif, bmp, png, jpeg), 워드문서(hwp, ppt, pptx, xls, xlsx, doc, docx, zip, pdf, txt)</p>
			<hr>
			<br>
			<br>
            <button type="button" class="cancel-btn" onclick="historyback(event);">취소</button>
            <button type="button" onclick="noticeWrite(event)" >등록하기</button>
        
    </div>
	
	<script>
		
	function noticeWrite(evnet){
		var noticecategory = $("#category").val();
		var noticetitle = $("#title").val();
		var noticecontent = $("#content").val();
		var noticefile = $("#file").val();
		
		console.log(noticecategory);
		console.log(noticetitle);
		console.log(noticecontent);
		console.log(noticefile);
		
		$.ajax({
			url : "http://localhost:9001/api/v1/admin/announcement",
			enctype : "multipart/form-data",
			method : "POST",
			contentType : "application/json",
			data : JSON.stringify({
				noticeCategory : noticecategory,
				noticeTitle : noticetitle,
				noticeContent : noticecontent,
				noticeFile : noticefile
			}),
			success : function(response){
				alert("공지사항이 등록되었습니다");
				//window.location.href=""; 나중에 여기 달아줘야함/////////////////////////////////////////////////////////////////////////////////////////////////
			},
			error : function(xhr, status, error){
				console.log(error)
			}
		})
	}
	
	function historyback(event){
		const result = confirm('정말로 취소하시겠습니까');
		if(result){
			window.location.href="/admin/noticeForm"
		}else{
			
		}
		
	}
	
	
	</script>
	
	
	
</body>
</html>