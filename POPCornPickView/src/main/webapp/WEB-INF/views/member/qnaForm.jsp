<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 작성 페이지</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>

* {
/* 	box-sizing: border-box; */
}

main {
	display: flex;
	width: 1200px;
	margin: 80px auto;
/* 	min-height: 700px; */
	border:1px solid #eee;
	box-sizing: border-box;
}

#sidebar-container {
	width: 200px;
	background-color: #f4f4f4;
	padding: 10px;
}

.sidebar {
	margin-top: 70px;
	width: 210px;
	box-sizing: border-box;
	height: 600px;
}

.content {
	flex: 1;
	margin-left: 20px;
}

.tab {
	display: flex;
	box-sizing: border-box;
	width: 940px;
	height: 70px;
	border-bottom: 2px solid #A4A4A4;
	border-top: 2px solid #A4A4A4;
	text-align: center;
}

.tab a {
	flex: 1;
	text-align: center;
	justify-content: center;
	align-items: center;
	display: flex;
	width: 220px;
	height: 60px;
}

.tab a:hover {
	background-color: #E6E6E6;
}

.FAQ {
	width: 940px;
	height: 200px;
	border: 1px solid #08088A;
	margin-top: 20px;
	box-sizing: border-box;
	display: flex;
	align-items: center;
	justify-content: center;
}

#text-red {
	color: #FE2E64;
}

#text-grey {
	color: grey;
	font-size: 11px;
}

.text-box {
	width: 500px;
	text-align: left;
}

.text-box p, .text-box h4 {
	margin-bottom: 10px;
}

.text-box h4 a {
	border-bottom: 2px solid;
}

.text-warning {
	margin-top: 20px;
}

.qna-content {
	position: relative;
	margin-top: 50px;
	padding-bottom: 15px;
	border-bottom: 1.5px solid #848484;
}

#required-input {
	display: inline-block;
	font-size: 16px;
	color: #FA5858;
	font-weight: 600;
	position: absolute;
	right: 23px;
}

.required-input {
	color: #FA5858;
}

table {
	width: 100%;
	margin-top: 20px;
}

input[type="radio"] {
	margin: 0 10px;
}

select {
	padding: 0 10px;
}

#select-cinemaNo, #select-big-location {
	padding: 0 10px;
	margin: 0 0 0 20px;;
}

.th {
	display: flex;
	padding-left: 10px;
	width: 108px;
}

td {
	width: 735px;
}

th, td {
	border-bottom: 1px solid #EEEEEE;
    height: 50px;
    padding: 7px 4px;
    font-size: 15px;
    align-items: center;
}

input[type="text"] {
	height: 35px;
	padding: 0 18px;
	font-size: 15px;
	width: 100%;
}

textarea[name="qnaContent"] {
	height: 100%;
	width: 100%;
	padding: 10px 15px;
	font-size: 15px;
}

tr[name="qnaContentTr"] {
	height: 300px;
}

.text-area {
	width: 100%;
	height: 100%;
}

.th-content {
	height: 300px;
	
}

.btn-box {
	text-align: center;
}

.btn {
	width: 120px;
	padding: 12px 0;
	margin: 10px 20px;
	border: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
	cursor: pointer;
}

#cancer-btn {
	background-color: #E6E6E6;
}

#write-btn {
	color: #fff;
	background-color: #d9534f;
}

#cancer-btn:hover {
	background-color: #BDBDBD;
}

#write-btn:hover {
	background-color: #c9302c;
}

#select-box {
	display: inline-block;
/* 	margin-left:  */
}


</style>
</head>
<body>
	<header>
<%-- 		<%@ include file="../layout/header.jsp"%> --%>
		<%@ include file="../member/mainInfo.jsp"%>
	</header>
	<main>
		<div class="sidebar">
			<%@ include file="../member/sideMenu.jsp"%>
		</div>
		<div class="content">
			<div class="tab">
				<a href="/common/faqList">FAQ</a><a href="/common/noticeList">공지사항</a><a href="/member/qnaForm">1:1 문의</a>
			</div>
			<div class="FAQ">
				<div class="text-box">
					<h4>FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.</h4>
					<h4><a href="#FAQ">FAQ 바로가기</a></h4>
					<p class="text">· 1:1 문의글 답변 운영시간 : 평일 09:00 ~ 18:00</p>
					<p class="text">· 주말/공휴일 미운영하며, 영업시간 내 순차적 답변 처리됩니다.</p>
				</div>
			</div>
			<div class="text-warning">
				<p>고객님의 문의에 <span id="text-red">답변하는 직원은 고객 여러분의 가족 중 한 사람</span>일 수 있습니다.</p>
				<p id="text-grey">고객의 언어폭력(비하, 욕설, 반말, 성희롱)으로부터 직원을 보호하기 위해 관련 범에 따라 수사기관에 필요한 조치를 요구 할 수 있으며, 형법에 의해 처벌 대상이 될 수 있습니다.</p>
			</div>
			<div class="qna-content">
				<h2>문의 내용<span id="required-input">* 필수입력</span></h2>
			</div>
			<form id="frm">
				<table >
					<tr>
						<th class="th">분류 <span class="required-input">*</span></th>
						<td>
							<select id="big-classification" name="qnaBigCategory">
								<option selected>분류 선택</option>
								<option value="영화관">영화관</option>
								<option value="영화">영화</option>
								<option value="멤버십">멤버십</option>
								<option value="예매/결제">예매/결제</option>
								<option value="대관문의" onclick="changeText()">대관문의</option>
							</select>
							<select id="small-classification" name="qnaSmallCategory">
								<option value="0" selected>문의 종류</option>
								<option value="문의">문의</option>
								<option value="칭찬">칭찬</option>
								<option value="불만">불만</option>
								<option value="건의">건의</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="th">종류 <span class="required-input">*</span></th>
						<td>
							<label><input type="radio" name="qnaType" value="영화관문의" onclick="able()"> 영화관문의 </label> <label><input type="radio" name="qnaType" value="기타 문의" onclick="disable()"> 기타 문의 </label>
							<div id="select-box">
							<select id="select-big-location" onchange="loadCinemaList(event)" name="qnaCinemaLocation">
								<option selected>지역 선택</option>
								<option value="My 영화관" >My 영화관</option>
								<option value="서울" >서울</option>
								<option value="경기/인천" >경기/인천</option>
								<option value="충청/대전" >충청/대전</option>
								<option value="전라/광주" >전라/광주</option>
								<option value="경북/대구" >경북/대구</option>
								<option value="경남/부산/울산" >경남/부산/울산</option>
								<option value="강원" >강원</option>
								<option value="제주" >제주</option>
							</select>
							<select id="select-cinemaNo" name="qnaCinemaName" onchange="consoleCheck(event)">
								<option selected>영화관 선택</option>
							</select>
							</div>
						</td>
					</tr>
					<tr>
						<th class="th">제목 <span class="required-input">*</span></th>
						<td><div class="text-area"><input type="text" name="qnaTitle" placeholder="제목을 입력해주세요."></div></td>
					</tr>
					<tr name="qnaContentTr">
						<th class="th th-content" >내용 <span class="required-input">*</span></th>
						<td><div class="text-area"><textarea name="qnaContent" placeholder="내용 및 첨부파일에 개인정보(카드번호, 계좌번호, 주민번호)가 포함되지 않도록 유의하여 입력해주세요." onkeydown="pressEnter(event)"></textarea></div></td>
					</tr>
					<tr>
						<th class="th">첨부파일 </th>
						<td><div class="text-area"><input type="file" name="qnaFile" value="파일 첨부"></div></td>
					</tr>
					
				</table>
					<div class="btn-box">
						<button class="btn" id="cancer-btn" type="button" onclick="cancer()">취소 </button> <button class="btn" id="write-btn" type="button" onclick="qnaWrite()">확인</button>
					</div>
			</form>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	
		function pressEnter(event){
			if(event.keyCode === 13){ // 엔터키 코드 (13) 사용
				event.preventDefault(); // 엔터키 기본 동작 방지 (줄바꿈 방지)
				// 줄바꿈 처리 로직
				console.log(event.target);
				let inputValue = document.querySelector("textarea[name='qnaContent']").value;
				let inputValue2 = event.target.value;
				inputValue += '\r\n';
				document.querySelector("textarea[name='qnaContent']").value = inputValue;
			}
		}
		
		function qnaWrite(){
			tokenCheck();
			const token = localStorage.getItem("jwtToken");
			const form = document.querySelector("#frm");
			const formData = new FormData(frm);
			
			let username = getUsername();
			console.log(username);
// 			const fileInput = document.querySelector("input[name='file']");
// 			const file = fileInput.files[0];
// 			formData.append("qnaFile", file);
			formData.append("username", username);
// 			formData.append("qnaTitle", document.querySelector("input[name='qnaTitle']").value);
// 			formData.append("qnaContent", document.querySelector("textarea[name='qnaContent']").value);
// 			formData.append("qnaBigCategory", document.querySelector("#big-classification").value);
// 			formData.append("qnaSmallCategory", document.querySelector("#small-classification").value);
// 			formData.append("qnaType", document.querySelector("input[name='qnaType']").value);
// 			formData.append("qnaCinemaLocation", document.querySelector("#select-big-location").value);// 영화관문의, 기타문의
// 			formData.append("qnaCinemaNo", document.querySelector("#select-cinemaNo").value);
			console.log("getUsername() 함수 결과 : " + username);
			console.log(formData);
			
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				if(xhttp.responseText != null){
					if(xhttp.status === 200){
						alert("문의가 성공적으로 등록됬습니다.");
						window.location.href = "/member/qnaList";
					}else {
						alert(this.responseText + ", 문의 등록 실패");
					}
				}
			}
			
			xhttp.open("POST", "http://localhost:9001/api/v1/memInquiry/writeInquiry");
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			//xhttp.setRequestHeader("Content-type", "multipart/form-data"); FormData 객체가 표준화된 방식으로 데이터를 준비해서 자동으로 이 설정이 됨.
			xhttp.send(formData);
		}
		
// 		function qnaWrite(){
// 			tokenCheck();
// 			const token = localStorage.getItem("jwtToken");
			
// 			const formData = new FormData();
			
// 			let username = getUsername();
// 			const fileInput = document.querySelector("input[name='file']");
// 			const file = fileInput.files[0];
// 			formData.append("qnaFile", file);
// 			formData.append("username", username);
// 			formData.append("qnaTitle", document.querySelector("input[name='qnaTitle']").value);
// 			formData.append("qnaContent", document.querySelector("textarea[name='qnaContent']").value);
// 			formData.append("qnaBigCategory", document.querySelector("#big-classification").value);
// 			formData.append("qnaSmallCategory", document.querySelector("#small-classification").value);
// 			formData.append("qnaType", document.querySelector("input[name='qnaType']").value);
// 			formData.append("qnaCinemaLocation", document.querySelector("#select-big-location").value);// 영화관문의, 기타문의
// 			formData.append("qnaCinemaNo", document.querySelector("#select-cinemaNo").value);
// 			console.log("getUsername() 함수 결과 : " + username);
// 			console.log(formData);
			
// 			const xhttp = new XMLHttpRequest();
			
// 			xhttp.onload = function(){
// 				if(xhttp.responseText != null){
// 					if(xhttp.status === 200){
// 						alert("문의가 성공적으로 등록됬습니다.");
						
// 					}else {
// 						alert(this.responseText + ", 문의 등록 실패");
// 					}
// 				}
// 			}
			
// 			xhttp.open("POST", "http://localhost:9001/api/v1/memInquiry/writeInquiry");
// 			xhttp.setRequestHeader("Authorization", "Bearer " + token);
// 			//xhttp.setRequestHeader("Content-type", "multipart/form-data"); FormData 객체가 표준화된 방식으로 데이터를 준비해서 자동으로 이 설정이 됨.
// 			xhttp.send(formData);
// 		}
		
		function getUsername(){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			xhttp.onload = function(){
				console.log(this.responseText);
				return this.responseText;
			}
			xhttp.open("GET", "http://localhost:9001/api/v1/common/getUsername");
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		
		function loadCinemaList(event){
			const xhttp = new XMLHttpRequest();
			const location = event.target.value;
			console.log(location + ", " + event.target.value);
			const token = localStorage.getItem("jwtToken");
			
			xhttp.onload = function(){
				if(xhttp.responseText != null){
					if (xhttp.status === 200) {
						const cinemaList = JSON.parse(xhttp.responseText);
						const selectCinemaNo = document.querySelector("#select-cinemaNo");
// 						selectCinemaNo.empty(); // 기존 옵션 요소 비우기 jquery
// 						selectCinemaNo.append('<option selected>영화관 선택</option>');
// 						selectCinemaNo.innerHTML = '<option selected onchange="consoleCheck(event)">영화관 선택</option>';
						selectCinemaNo.innerHTML = ''; // 기존 옵션 요소 비우기
						let defaultOption = document.createElement("option");
						defaultOption.selected = true;
						defaultOption.textContent = "영화관 선택";
						selectCinemaNo.appendChild(defaultOption);
// 						selectCinemaNo.onchange = function(event){
// 							console.log("value : " + event.target.value);
// 						}
						
						cinemaList.forEach(cinema => {
// 							selectCinemaNo.append(`<option value="${cinema}">${cinema}</option>`); // jquery
// 							selectCinemaNo.innerHTML += `<option value="${cinema}">${cinema}</option>`; // 기본 JS 문법
							let option = document.createElement("option");
							option.value = cinema.cinemaName;
							option.textContent = cinema.cinemaName;
							selectCinemaNo.appendChild(option);
							console.log("option value : " + option.value);
							console.log(cinema);
						});
// 						for(let i = 0; i < cinemaList.length; i++){
// 							selectCinemaNo.innerHTML += `<option value="${cinemaList[i]}">${cinemaList[i]}</option>`;
// 							console.log(${cinemaList[i]});
// 						};
					}else {
						alert("Faile");
					}
				}
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/memInquiry/cinemaList?location=" + location);
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
			
		}
		
		function loadCinemaNo(event){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			const cinemaName = event.target.value;
			
			xhttp.onload = function(){
				const cinemaNo = this.responseText;
				console.log("cinemaNo : " + cinemaNo);
				document.querySelector("#select-cinemaNo").value = cinemaNo;
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/memInquiry/cinemaNo?cinemaName=" + cinemaName);
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		
		function consoleCheck(event){
			console.log(event.target.value);
		}
		
		function tokenCheck(){
			const token = localStorage.getItem("jwtToken");
			const xhr = new XMLHttpRequest();
			
			xhr.onload = function(){
				
			}
			
			xhr.open("GET", "http://localhost:9001/api/v1/common/loginCheck");
			xhr.setRequestHeader("Authorization", "Bearer " + token);
			xhr.send();
		}
		
		
		function cancer(){
			window.location.href = "/";
		}
		
// 		function able(){
// 			const select = document.querySelector("#select-box");
// 			select.style.display = "block";
// 		}
		
// 		function disable(){
// 			const select = document.querySelector("#select-box");
// 			select.style.display = "none";
// 		}
		
		function able() {
			const selectBox = document.querySelector("#select-box");
			selectBox.innerHTML = 
				`<select id="select-big-location" onchange="loadCinemaList(event)" name="qnaCinemaLocation">
					<option selected>지역 선택</option>
		            <option value="My 영화관">My 영화관</option>
    	    	    <option value="서울">서울</option>
        		    <option value="경기/인천">경기/인천</option>
		            <option value="충청/대전">충청/대전</option>
	    	        <option value="전라/광주">전라/광주</option>
        		    <option value="경북/대구">경북/대구</option>
	    	        <option value="경남/부산/울산">경남/부산/울산</option>
    		        <option value="강원">강원</option>
	        	    <option value="제주">제주</option>
		        </select>
				<select id="select-cinemaNo" name="qnaCinemaName" onchange="consoleCheck(event)">
					<option selected>영화관 선택</option>
				</select>`;
				
				//selectBox.style.display = "block"; // style.display 를 이용하면 기존 css를 무시하고 생성되서 구조가 달라질 수 있다.
		}

		function disable() {
			const selectBox = document.querySelector("#select-box");
			selectBox.innerHTML = ''; // 내용 지우기
			//selectBox.style.display = "none";
		}
		
		function changeText(){
			let qnaContent = document.querySelector("textarea[name='qnaContent']");
			qnaContent.placeholder = "대관 날짜와 몇시부터 몇시까지 인지 대관시간 및 인원(성인, 청소년, 경로, 장애인, 어린이 구분), 시청하시려는 영화명을 입력해주세요. 추가적으로 요청사항이나 저희가 알아야 할 참고사항을 뒤에 기입하셔도 됩니다.";
			qnaContent.innerHTML = "변동 가능성";
		}
		
	</script>
</body>
</html>