<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종료된 이벤트 리스트</title>
<link rel="stylesheet" as="style" crossorigin
    href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<style>
main {
	width: 900px;
	margin: 80px auto;
	display:flex;
	justify-content:space-between;
}

main #container {
	box-sizing:border-box;
	background: #f0f0f0;
	padding: 20px;
	padding-bottom: 40px;
}

.sidebar-box2 p:nth-child(3) a{
	color: #816bff !important;
}
h2{
	margin-bottom: 20px;
	font-weight: 400;
	font-size: 22px;
}
#container h1{
	margin: 20px;
}
.salesChart{
	width: 250px;
	height: 200px;
	background: white;
	padding: 10px;
	box-sizing: border-box;
	border-radius: 5px;
}
#money_dashboard_container{
	display: flex;
	justify-content: space-evenly;
	flex-wrap: wrap;
	gap: 15px;
}
#money_dashboard p{
	margin: 10px;
	margin-left: 15px;
	font-weight: bold;
}
#money_dashboard{
	margin-bottom: 30px;
}
#movie_dashbaord p{
	margin: 10px;
	margin-left: 15px;
	font-weight: bold;
}
#movie_dashboard_container tr th, #movie_dashboard_container tr td{
	background: white;
	text-align: center;
	padding: 10px 20px;
}
#movie_dashboard_container tr td:nth-child(2){
	font-weight: bold;
}
#movie_dashboard_container table{
	border-spacing: 0;
	margin: 0 auto;
	border: 5px;
}
#movie_dashboard_container tr th{
	background: #ddd;
	color: white;
}
</style>
</head>
<%@ include file="../layout/adminHeader.jsp"%>
<body>
	<main>
		<div id="container">
			<h1>관리자 대시보드</h1>
			<div id="money_dashboard">
				<p>매출 및 재무</p>
				<div id="money_dashboard_container">
					<div class="salesChart">
						<canvas id="sales_dailyChart"></canvas>
					</div>
					<div class="salesChart">
						<canvas id="sales_monthlyChart"></canvas>
					</div>
					<div class="salesChart">
						<canvas id="sales_yearChart"></canvas>
					</div>
					<div id="salesChart">
						<canvas id="sales_fmChart"></canvas>
					</div>		
				</div>
			</div>
			<div id="movie_dashbaord">
				<p>POPULAR</p>
				<div id="movie_dashboard_container">
				</div>
						
			</div>
		</div>
	</main>
	<footer>
	
	</footer>
	<script type="text/javascript">
     
     $(document).ready(function(){
    	$.ajax({
    		url  : "http://localhost:9001/api/v1/admin/dashboard/sales/daily", 
    		method : "GET",
    		dataType : "json",
    		success : function(response){
    			
    			let dateArray = new Array();
    			let amountArray = new Array();
    			
    			response.forEach(sales => {
    				dateArray.push(sales.date);
    				amountArray.push(sales.totalAmount);
    			});
    			
    			 const ctx = document.getElementById('sales_dailyChart').getContext('2d');
    			 const salesChart = new Chart(ctx, {
    		         type: 'bar', // Use 'line' chart type
    		         data: {
    		             labels: dateArray, // Example labels, modify as needed
    		             datasets: [
    		                 {
    		                     label: '일별 매출',
    		                     data: amountArray, // Example daily sales data
    		                     borderColor: 'rgba(255, 99, 132, 1)',
    		                     backgroundColor: '#b4d6fa',
    		                     fill: false
    		                 },
    		             ]
    		         },
    		         options: {
    		        	 maintainAspectRatio: false,
    		             scales: {
    		                 x: {
    		                     beginAtZero: true
    		                 },
    		                 y: {
    		                     beginAtZero: true
    		                 }
    		             }
    		         }
    		    	 });
    		},
    		error : function(xhr, status, error){
    			console.log(error);
    		}
    	}); 
    	
    	$.ajax({
    		url  : "http://localhost:9001/api/v1/admin/dashboard/sales/monthly", 
    		method : "GET",
    		dataType : "json",
    		success : function(response){
    			
    			let monthArray = new Array();
    			let amountArray = new Array();
    			
    			response.forEach(sales => {
    				monthArray.push(sales.month);
    				amountArray.push(sales.totalAmount);
    			});
    			
    			 const ctx = document.getElementById('sales_monthlyChart').getContext('2d');
    			 const salesChart = new Chart(ctx, {
    		         type: 'bar', // Use 'line' chart type
    		         data: {
    		             labels: monthArray, // Example labels, modify as needed
    		             datasets: [
    		                 {
    		                     label: '월별 매출',
    		                     data: amountArray, // Example daily sales data
    		                     borderColor: 'rgba(255, 99, 132, 1)',
    		                     backgroundColor: '#b4d6fa',
    		                     fill: false
    		                 },
    		             ]
    		         },
    		         options: {
    		        	 maintainAspectRatio: false,
    		             scales: {
    		                 x: {
    		                     beginAtZero: true
    		                 },
    		                 y: {
    		                     beginAtZero: true
    		                 }
    		             }
    		         }
    		    	 });
    		},
    		error : function(xhr, status, error){
    			console.log(error);
    		}
    	}); 
    	
    	$.ajax({
    		url  : "http://localhost:9001/api/v1/admin/dashboard/sales/year", 
    		method : "GET",
    		dataType : "json",
    		success : function(response){
    			
    			let yearArray = new Array();
    			let amountArray = new Array();
    			
    			response.forEach(sales => {
    				yearArray.push(sales.year);
    				amountArray.push(sales.totalAmount);
    			});
    			
    			 const ctx = document.getElementById('sales_yearChart').getContext('2d');
    			 const salesChart = new Chart(ctx, {
    		         type: 'bar', // Use 'line' chart type
    		         data: {
    		             labels: yearArray, // Example labels, modify as needed
    		             datasets: [
    		                 {
    		                     label: '연도별 매출',
    		                     data: amountArray, // Example daily sales data
    		                     borderColor: 'rgba(255, 99, 132, 1)',
    		                     backgroundColor: '#b4d6fa',
    		                     fill: false
    		                 },
    		             ]
    		         },
    		         options: {
    		        	 maintainAspectRatio: false,
    		             scales: {
    		                 x: {
    		                     beginAtZero: true
    		                 },
    		                 y: {
    		                     beginAtZero: true
    		                 }
    		             }
    		         }
    		    	 });
    		},
    		error : function(xhr, status, error){
    			console.log(error);
    		}
    	});
    	
    	$.ajax({
    		url  : "http://localhost:9001/api/v1/admin/dashboard/sales/movie", 
    		method : "GET",
    		dataType : "json",
    		success : function(response){
    			
    			let str = '<table> ' + 
					   	  '<thead> ' + 
						  '<tr> ' + 
						  '<th>순위</th> ' + 
						  '<th>제목</th> ' + 
					      '<th>총매출</th> ' + 
						  '<th>예매수</th> ' + 
						  '</tr> ' + 
						  '</thead> ' + 
						  '<tbody> ';
				if(response.length > 5){
					for(let i = 0; i < 5; i++){
						
	    				str += '<tr> ' +
	    					   '<td>' + (i + 1) + '</td> ' +
	    					   '<td>' + response[i].title + '</td> ' +
	    					   '<td>' + response[i].totalAmount.toLocaleString()  + '</td> ' +
	    					   '<td>' + response[i].totalView + '</td> ' +
	    				  	   '</tr> ';
					}	
				}else{
					for(let i = 0; i < response.length; i++){
						
	    				str += '<tr> ' +
	    					   '<td>' + (i + 1) + '</td> ' +
	    					   '<td>' + response[i].title + '</td> ' +
	    					   '<td>' + response[i].totalAmount.toLocaleString()  + '</td> ' +
	    					   '<td>' + response[i].totalView + '</td> ' +
	    				  	   '</tr> ';
					}
				}
				
    			str += '</tbody>' + 
    				   '</table> ';
    				   
    			$("#movie_dashboard_container").html(str);
    			
    		},
    		error : function(xhr, status, error){
    			console.log(error);
    		}
    	});
    	
    	$.ajax({
    		url  : "http://localhost:9001/api/v1/admin/dashboard/sales/fm", 
    		method : "GET",
    		dataType : "json",
    		success : function(response){
    			console.log(response);
    			let fmArray = new Array();
    			let amountArray = new Array();
    			let backgroundColorArray = new Array();
    			response.forEach(sales => {
    				fmArray.push(sales.gender);
    				amountArray.push(sales.totalAmount);
    				if(sales.gender === "남자"){
    					backgroundColorArray.push("#87b1f5");
    				}else {
    					backgroundColorArray.push("#f78d83");
    				}
    			});
    			
    			 const ctx = document.getElementById('sales_fmChart').getContext('2d');
    			 const salesChart = new Chart(ctx, {
    		         type: 'pie', // Use 'line' chart type
    		         data: {
    		             labels: fmArray, // Example labels, modify as needed
    		             datasets: [
    		                 {
    		                     label: '남녀 성비',
    		                     data: amountArray, // Example daily sales data
    		                     borderColor: 'black',
    		                     backgroundColor: backgroundColorArray,
    		                     fill: false,
    		                     borderWidth: 0 
    		                 },
    		             ]
    		         },
    		         options: {
    		        	 maintainAspectRatio: false,
    		             scales: {
    		                 x: {	
    		                     beginAtZero: true
    		                 },
    		                 y: {
    		                     beginAtZero: true
    		                 }
    		             }
    		         }
    		    	 });
    		},
    		error : function(xhr, status, error){
    			console.log(error);
    		}
    	}); 
    	
    	
     });
	</script>
</body>
</html>