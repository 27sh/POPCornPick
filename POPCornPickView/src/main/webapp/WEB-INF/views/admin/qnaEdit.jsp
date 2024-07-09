<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnaEdit</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../layout/adminHeader.jsp"%>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
 <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 60%;
            margin: auto;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .qna {
            border: 1px solid #ccc;
            padding: 20px;
            margin-bottom: 10px;
        }
        .category, .title, .author, .content, .answer {
            margin-bottom: 10px;
        }
        .category span, .title span, .author span {
            font-weight: bold;
        }
        .footer {
            text-align: right;
        }
        .btn {
            background-color: #7D4EF0;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Q&A</h1>
        </div>
        <div class="qna">
            <div class="category">
                <span>카테고리:</span> 서비스 이용 문의
            </div>
            <div class="title">
                <span>제목:</span> 회원 탈퇴는 어떻게 하나요?
            </div>
            <div class="author">
                <span>작성자:</span> hgd
            </div>
            <div class="content">
                <h3>내용</h3>
                탈퇴하는 곳이 없는데 어떻게 하는지 모르겠어요.
            </div>
            <div class="answer">
                <h3>답변</h3>
                안녕하세요, 고객님.<br>
                저희 팝콘펙에서는 고객센터로 문의 시 회원 탈퇴를 도와드리고 있습니다.
            </div>
        </div>
        <div class="footer">
            <button class="btn">목록</button>
            <button class="btn">답변</button>
        </div>
    </div>
</body>
</html>