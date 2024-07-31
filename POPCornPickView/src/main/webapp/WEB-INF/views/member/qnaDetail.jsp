<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역 상세보기 페이지</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />

<style>

* {
/* 	box-sizing: border-box; */
}

main {
	width: 1200px;
	margin: 80px auto;
/* 	min-height: 700px; */
	border:1px solid #eee;
}

#sidebar-container {
	width: 200px;
	background-color: #f4f4f4;
	padding: 10px;
}

/*.myInfo {
	width: 100%;
	height: 400px;
	border: 2px solid red;
	box-sizing: border-box;
	margin-bottom: 30px;
}*/

.flex-box {
	display: flex;
	box-sizing: border-box;
}

.sidebar {
	width: 230px;
	height: 795px;
	box-sizing: border-box;
	margin-right: 20px;
}

/* h2, p{ */
/* 	margin: 15px 0; */
/* } */

.h2, 
.p {
	margin: 15px 0;
}

.qnaContent {
	border: 1px solid;
	width: 860px;
	height: 735px;
	box-sizing: border-box;
}

.title {
	position: relative;
	margin: 20px 20px 50px 20px;
	border-bottom: 2px solid #BDBDBD;
}

.smallCategoryAndTitle {
	font-size: 20px;
	font-weight: bold;
	height: 30px;
	margin: 15px 0;
}

.qnaAnswer {
	text-align: right;
	display: inline-block;
	position: absolute;
	right: 20px;
	font-size: 14px;
	font-weight: normal;
}

.context {
	font-size: 16px;
	margin: 0 20px;
	padding: 10px 0 0 20px;
	height: 300px;
/* 	border: 1px solid green; */
}

.regdate {
	font-size: 15px;
	font-weight: normal;
	margin-left: 20px;
	color: #A4A4A4;
}

.no {
	color: red;
}

.ok {
	color: green;
}

.file {
	margin: 20px 20px 30px;
	height: 30px;
	font-size: 18px;
	font-weight: bold;
	border-bottom: 2px solid #BDBDBD;
}

.fileName {
	margin: 15px 20px;
}

.fileImage {
	margin: 15px 20px;
	height: 150px;
}

.buttons {
	text-align: center;
}

.buttons input[type='button'] {
	width: 120px;
	height: 35px;
	margin: 10px 30px;
}

#editBtn {
	border: none;
	border-radius: 7px;
	background-color: #d9534f;
	color: #ffffff;
}

#deleteBtn {
	border: none;
	border-radius: 7px;
	background-color: #BDBDBD;
	color: #ffffff;
}

#editBtn:hover {
	background-color: #EB534F;
}

#deleteBtn:hover {
	background-color: #A0A0A0;
}

</style>
</head>
<body>
	<header>
		<%@ include file="../member/mainInfo.jsp"%>
	</header>
	<main>
		<div class="myInfo">
			
		</div>
		<div class="flex-box">
			<div class="sidebar">
				<%@ include file="../member/sideMenu.jsp"%>
			</div>
			<div class="qnaDetailContent">
				<h2 class="h2">나의 문의내역</h2>
				<p class="p">1:1 문의</p>
				<div class="qnaContent">
					<div class="title">
						[<span id="qnaSmallCategory">건의</span>] Title ${qnaNo }
					</div>
					<div class="content">
						Content
					</div>
					<div class="file">
						사진이면 미리보기
					</div>
					
				</div>
			</div>
		</div>
		
	</main>
	<footer>
		
	</footer>
	<script type="text/javascript">
		
		function loadQnaDetail(){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				const qna = JSON.parse(this.responseText);
				const qnaDetail = document.querySelector(".qnaContent");
				const qnaSC = document.querySelector("#qnaSmallCategory");
				let Answer;
				const qnaFileName = qna.qnaFile ? qna.qnaFile.split("--")[1] : '';
				
				if(qna.qnaAnswer == null){
					Answer = "미답변";
				}else {
					Answer = "답변 완료";
				}
				
				qnaDetail.innerHTML = ''; 
				qnaDetail.innerHTML += '<div class="title"><p class="smallCategoryAndTitle">[' + qna.qnaSmallCategory + ']     ' + qna.qnaTitle + ' <span class="regdate">' +  qna.regdate.split("T")[0] + '</span><span class="qnaAnswer">' + Answer + '</span></p></div>';
				qnaDetail.innerHTML += '<div class="context">' + qna.qnaContent + '</div>';
				qnaDetail.innerHTML += '<p class="file"> 첨부 파일</p>';
				qnaDetail.innerHTML += '<div class="fileImage"><img src="" id="qnaFileImg" alt="이미지 첨부파일 미리보기"></div>';
				qnaDetail.innerHTML += '<div class="fileName">' + qnaFileName + '</div>';
				qnaDetail.innerHTML += '<div class="buttons"><input type="button" id="editBtn" value="수정" onclick="editQnaForm()"> <input type="button" id="deleteBtn" value="삭제" onclick="deleteQna()"></div>'
				
				const AnswerColor = document.querySelector(".qnaAnswer");
				
				if(Answer == "미답변"){
					AnswerColor.classList.add('no');
					AnswerColor.classList.remove('ok');
				}else {
					AnswerColor.classList.add('ok');
					AnswerColor.classList.remove('no');
				}
				
				console.log("qnaFileName : " + qnaFileName + ", qna.qnaFile : " + qna.qnaFile);
				
				// 파일 미리보기 처리
				const filePreview = document.querySelector("#qnaFileImg");
				if (qnaFileName && isImage(qnaFileName)) {
					const imageUrl = createImageUrl(qna.qnaFile); // 이미지 URL 생성 함수 호출
					filePreview.src = imageUrl;
					console.log("filePreview.src : " + filePreview.src);
				} else {
					console.log("이미지url 확인 : " + createImageUrl(qna.qnaFile));
				}
				
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/memInquiry/qnaDetail?qnaNo=" + ${qnaNo});
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		
		// 이미지 파일 여부 확인 함수
		function isImage(fileName) {
			const imageExtensions = ['jpg', 'jpeg', 'png', 'gif'];
			const extension = fileName.split('.').pop().toLowerCase();
			return imageExtensions.includes(extension);
		}

		// 이미지 URL 생성 함수 (예시)
		function createImageUrl(originFileName) {
			return '/static/upload/' + originFileName; // 실제 서버 환경에 맞게 수정
		}
		
		document.addEventListener("DOMContentLoaded", () => {
			loadQnaDetail();
		});
		
		function editQnaForm(){
			window.location.href = "/member/editQnaForm?qnaNo=" + ${qnaNo};
// 			const xhttp = new XMLHttpRequest();
			
// 			xhttp.onload = function(){
				
// 			}
			
// 			xhttp.open("PUT", "http://localhost:9001/api/v1/memInquiry/editInquiry?qnaNo=${qnaNo}");
// 			xhttp.setRequestHeader("Authorization", "Bearer " + token);
// 			xhttp.send();
		}
		
		function deleteQna(){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			console.log(${qnaNo});
			xhttp.onload = function(){
				alert(this.responseText);
				window.location.href = "/member/qnaList";
			}
			
			xhttp.open("DELETE", "http://localhost:9001/api/v1/memInquiry/deleteInquiry?qnaNo=${qnaNo}"); 
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
			
		}
		
	</script>
</body>
</html>