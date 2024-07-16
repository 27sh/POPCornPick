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
	
	<div class="container" id="noticeDetail">
        
    </div>
	
	<script>
	$(document).ready(function(){
		const noticeNo = "${noticeNo}";
		console.log(noticeNo);
		
		$.ajax({
			url : "http://localhost:9001/api/v1/admin/announcementDetial/" + noticeNo,
			method : "GET",
			success : function(data){
				console.log(data.noticeContent);
				let str = '';
				str += '<div>'+ data.noticeFile +'</div>';
				str += '<h1>공지사항 Detail</h1>';
				str += '<label for="category">카테고리</label>';
				str += '<select id="category" name="category" required>';
				str += '    <option value="전체">전체</option>';
				str += '    <option value="시스템점검">시스템점검</option>';
				str += '    <option value="극장">극장</option>';
				str += '    <option value="행사/이벤트">행사/이벤트</option>';
				str += '    <option value="제휴이벤트">제휴이벤트</option>';
				str += '    <option value="기타">기타</option>';
				str += '</select>';
				str += '<hr>';
				str += '<label for="title">제목</label>';
				str += '<input type="text" id="title" name="title" required value="' + data.noticeTitle + '">';
				str += '<label for="content">내용</label>';
				str += '<textarea id="content" name="content" required>' + data.noticeContent + '</textarea>';
				str += '<hr>';
				str += '<label for="file">첨부파일</label>';
				str += '<input type="file" id="file" name="file">';
				str += '<p>현재 첨부된 파일: ' + data.noticeFile + '</p>';
				str += '<p class="file-info">*첨부가능 확장자: 이미지(jpg, gif, bmp, png, jpeg), 워드문서(hwp, ppt, pptx, xls, xlsx, doc, docx, zip, pdf, txt)</p>';
				str += '<hr>';
				str += '<br>';
				str += '<br>';
				str += '<button type="button" class="cancel-btn" onclick="history.back();">취소</button>';
				str += '<button type="button" onclick="noticemodify(event)">수정하기</button>';
				
				
				$("#noticeDetail").html(str);
			},
			error : function(xhr, status, error){
				console.log(error);
			}
			
		})
		
	});
	
		

	function noticemodify(event){
	const noticeno = "${noticeNo}";
	const noticetitle= $("#title").val();
	const noticecontent= $("#content").val();
	const noticefile= $("#file").val();
		
	console.log(noticeno);
	console.log(noticetitle);
	console.log(noticecontent);
	console.log(noticefile);
	
	
		$.ajax({
			url : "http://localhost:9001/api/v1/admin/announcementput/" + noticeno,
			enctype : "multipart/form-data",
			method : "PUT",
			contentType : "application/json",
			data : JSON.stringify({
				noticeNo : noticeno,
				noticeTitle : noticetitle,
				noticeContent : noticecontent,
				noticeFile :noticefile,
			}),
			success : function(noticeModify){
				alert("노티스모디퐈이 수정완료");
				window.location.href="/admin/noticeList";
			},
			error : function(xhr, status, error){
				console.log(error);
			}
			
		})
		
	}
	
	
	
		
	</script>
	
	
	
</body>
</html>