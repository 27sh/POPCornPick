<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 관리 페이지</title>
<link rel="stylesheet" as="style" crossorigin
            href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>

main {
	width: 1200px;
	margin: 80px auto;
/* 	min-height: 700px; */
/* 	border:1px solid #eee; */
	box-sizing: border-box;
}

.flex-box {
	display: flex;
	box-sizing: border-box;
}

.myInfo {
	margin: 0 30px;
}

#event-apply-history {
	margin: 40px 0;
}

.Btns {
	text-align: center;
}

.Btns input[type='button'] {
	width: 150px;
	height: 60px;
	margin: 20px 50px;
	border: none;
	border-radius: 8px;
}

#putBtn {
	color: #fff;
	background-color: #d9534f;
}

#putBtn:hover {
	background-color: #c9302c;
}

#deleteBtn {
	color: #ffffff;
	background-color: #8C8C8C;
}

#deleteBtn:hover {
	background-color: #5D5D5D;
}

.total-apply-history {
	width: 920px;
	border: 1px solid;
	box-sizing: border-box;
	margin-bottom: 10px;
/* 	text-align: center; */
}

.apply-event {
/* 	border: 1px solid; */
/* 	border-color: blue; */
	margin: 40px 30px;
	padding: 30px 30px;
	box-sizing: border-box;
	display: flex;
	
}

.text-content {
	width: 600px;
	box-sizing: border-box;
	border: 1px;
	border-color: red;
}

.winner-check {
	align-content: center;
	
}

.event-title,
.event-date {
	position: relative;
/* 	left: -150px; */
	margin-bottom: 10px;
}

.apply-history,
.winner {
	width: 160px;
	height: 45px;
	border: none;
	border-radius: 15px 15px 0 0;
	margin-bottom: 3px;
	background-color: #AAAAAA;
	color: #ffffff;
	font-weight: bold;
	font-size: 17px;
}

.check-btn {
	width: 160px;
	height: 40px;
	border: 2px solid;
	border-color: #FF4141;
	border-radius: 30px;
	font-size: 20px;
	font-weight: bold;
	color: #FF4141;
	background-color: #ffffff;
}

.active2 {
	background-color: #d9534f;
	
}

</style>
</head>
<body>
	<header>
		<%@ include file="../member/mainInfo.jsp"%>
	</header>
	<main>
		<div class="flex-box">
			<div class="sidebar">
				<%@ include file="../member/sideMenu.jsp"%>
			</div>
			<div class="myInfo">
				<div class="event-notice">
					<h2 id="event-apply-history">이벤트 참여내역</h2>
					<div>
						<input type="button" value="응모내역" class="apply-history" onclick="a()"> <input type="button" value="당첨자 발표" class="winner" onclick="b()">
					</div>
<!-- 					<div class="total-apply-history"> -->
<!-- 						<div class="apply-event"> -->
<!-- 							<div class="text-content"> -->
<!-- 								<h2 class="event-title">[비공식작전] 포토존 인증</h2> -->
<!-- 								<p class="event-date">2024.07.31 ~ 2024.08.07</p> -->
<!-- 							</div> -->
<!-- 							<div class="winner-check"> -->
<!-- 								<input type="button" value="당첨확인" class="check-btn" onclick="checkBtn()"> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
		document.addEventListener("DOMContentLoaded", () => {
			a();
			loadEventApplyHistory();
		});
		
		function a(){
			console.log("참여내역");
			document.querySelector('.apply-history').classList.add('active2');
            document.querySelector('.winner').classList.remove('active2');
            
//             const memberFrm = document.querySelector("#member-frm");
//             const nonMemberFrm = document.querySelector("#non-member-frm");
            
//             memberFrm.style.display = "block";
//             nonMemberFrm.style.display = "none";
		}
		
		function b(){
			console.log("당첨자 발표");
			document.querySelector('.apply-history').classList.remove('active2');
            document.querySelector('.winner').classList.add('active2');
            
//             const memberFrm = document.querySelector("#member-frm");
//             const nonMemberFrm = document.querySelector("#non-member-frm");
            
//             memberFrm.style.display = "none";
//             nonMemberFrm.style.display = "block";
		}
		
		function loadEventApplyHistory(){
			const token = localStorage.getItem("jwtToken");
			const xhttp = new XMLHttpRequest();
			
			xhttp.onload = function(){
				console.log(this.responseText);
				if(this.responseText != null){
					const list = JSON.parse(this.responseText);
					const applyList = document.querySelector(".event-notice");
					
					list.forEach(participation =>{
						applyList.innerHTML += '<div class="total-apply-history">' +
							'<div class="apply-event">' +
								'<div class="text-content">' + 
									'<h2 class="event-title">' + participation.eventTitle + '</h2>' +
									'<p class="event-date">' + participation.startEvent + ' ~ ' + participation.endEvent +'</p>' +
								'</div>' +
								'<div class="winner-check">' +
									'<input type="button" value="당첨확인" class="check-btn" onclick="checkBtn(' + participation.participationResult + ')">' +
								'</div>' +
							'</div>' +
						'</div>';
					})
					
				}
			}
			
			xhttp.open("GET", "http://localhost:9001/api/v1/mem/event");
			xhttp.setRequestHeader("Authorization", "Bearer " + token);
			xhttp.send();
		}
		
		function checkBtn(result){
			if(result == null){
				alert("아직 이벤트가 진행중입니다. 마감까지 기다려보세요.");
			}else if(result === '당첨'){
				alert("이벤트에 당첨되셨습니다. 자세한 정보는 등록된 휴대폰에 문자로 발송해드리겠습니다.");
			}else {
				alert("당첨에 실패하셨습니다. ㅠ.ㅠ");
			}
		}
		
	</script>
</body>
</html>