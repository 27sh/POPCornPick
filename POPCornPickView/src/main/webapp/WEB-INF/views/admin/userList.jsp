<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
main {
	width: 1200px;
	margin: 80px auto;
	min-height: 700px;
	border:1px solid #eee;
}

h2{
	margin-bottom: 20px;
	font-weight: 600;
	font-size: 22px;
}

table, tr, th, td{
	border-collapse:collapse;
	border:1px solid #eee;
	border-right:0;
	border-left:0;
	padding:20px;
	text-align:center;
}

#memberListBox .table{
	width: 100%;
}

.state{
	
}

</style>
</head>
<body>
<%@ include file="../layout/adminHeader.jsp"%>
	<main>
		<div id="container">
			<h2>회원 관리</h2>
			<div id="memberListBox">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">번호</th><th scope="col">아이디</th><th scope="col">이름</th><th scope="col">가입일</th><th scope="col">신고 횟수</th><th scope="col">활동 상태</th>
						</tr>
					</thead>
					<tbody id="memberList">
					
					</tbody>					
				</table>
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script>
	$(document).ready(function(){
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function(){
			if(this.readyState == 4 && this.status == 200){
				const data = JSON.parse(this.responseText);
				console.log(data);
				if(data != null && data.length > 0){
					let table = '';
					for(let i = 0 ; i < data.length ; i++){
						let color = data[i].memberState === '활동중' ? 'green' : 'red';
						
						table += '<tr>';
						table += '<td class="listNum">' + (i + 1) + '</td>';
						table += '<td class="username"><a href="/event/detail?eventNo='+ data[i].username +'">' + data[i].username + '</a></td>';
						table += '<td class="name">'+data[i].name + '</td>';
						table += '<td class="joinDate">' + data[i].formattedJoinDate + '</td>';
						table += '<td class="warnAmount">' + data[i].warnAmount + '</td>';
						table += '<td class="state" style="color: '+ color + ';">' + data[i].memberState + '</td>';
						table += '</tr>';
					}
					document.getElementById("memberList").innerHTML = table;
					
				} else{
					document.getElementById("memberList").innerHTML = table;
				}
			} else if(this.readyState == 4 && this.status != 200){
				alert("회원 목록을 불러올 수 없습니다. 다시 시도해주세요.");
			}
		}
		
		xhttp.open("GET", "http://localhost:9001/api/v1/admin/member", true);
		xhttp.send();
	});
	</script>
</body>
</html>