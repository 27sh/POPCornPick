<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관람권/할인쿠폰 등록</title>
<link rel="stylesheet" as="style" crossorigin
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<link href="/css/style.css" rel="stylesheet" type="text/css">
<style>
#full-container {
    display: flex;
    width: 100%;
}

#sidebar-container {
	width: 200px;
	background-color: #f4f4f4;
	padding: 10px;
}

#container {
	flex: 1;
	padding: 10px;
}

#coupon-title {
	margin-bottom: 30px;
}

#title-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
}

#regi-title {
	font-weight: bold;
    color: #a6a6a6;
}

#go-to-coupon-list {
	background-color: #2d2d2d;
    color: white;
    font-size: 12px;
    width: 140px;
    text-align: center;
    height: 30px;
    align-content: center;
    font-weight: bold;
    cursor: pointer;
}

#context-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    padding: 20px;
    border: 1px solid #ddd;
    background-color: #f9f9f9;
    margin: 70px 0;
}

#context-mid-title {
    margin-bottom: 20px;
    font-size: 18px;
    color: #333;
}

#input-div-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 20px;
}

#code-title {
    margin-bottom: 10px;
    font-size: 14px;
    color: #666;
}

#input-coupon-code {
    padding: 10px;
    width: 300px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

#regi-btn {
    background-color: rgb(248, 47, 98);
    color: white;
    font-size: 14px;
    width: 140px;
    text-align: center;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-weight: bold;
    cursor: pointer;
    border: none;
    border-radius: 4px;
}

#coupon-regi-etc-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
	padding: 50px 0;
	border: 1px solid #999;
    margin: 10px;
    argin-top: 50px;
}

#etc-left-container {
    width: 150px;
    padding: 20px;
}

#etc-right-container {
	margin-left: 20px;
    padding: 0 30px;
    font-size: 13px;
    color: #a7a7a7;
    margin-left: 20px;
    border-left: 1px solid #ccc;
}
</style>
<script>
document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('regi-btn').addEventListener('click', function () {
        const couponCode = document.getElementById('input-coupon-code').value;

        fetch('http://localhost:9001/api/v1/myPage/register', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                'Authorization': 'Bearer ' + localStorage.getItem('jwtToken')
            },
            body: new URLSearchParams({ couponCode: couponCode })
        })
        .then(response => response.text())
        .then(message => {
            alert(message);
        })
        .catch(error => {
            console.error('Error:', error);
            alert('쿠폰 등록 중 오류가 발생했습니다.');
        });
    });
});
</script>
</head>
<body>
	<main>
		<%@ include file="./mainInfo.jsp"%>

		<div id="full-container">
			<div class="sidebar-container">
				<%@ include file="./sideMenu.jsp"%>
			</div>
			<div id="container">
				<div id="regi-full-container">
					<h2 id="coupon-title">관람권/할인쿠폰 관리</h2>
					<div id="title-container">
						<div id="regi-title">쿠폰 등록</div>
						<a href="/myPage/couponList" id="go-to-coupon-list">사용 내역 조회</a>
					</div>
					<div id="context-container">
						<h1 style="padding-bottom: 30px;">소지하신 쿠폰 등록하기</h1>
						<div id="context-mid-title">쿠폰 코드를 입력해주세요.</div>
						<div id="input-div-container">
							<div id="code-title">쿠폰 코드</div>
							<input type="text" id="input-coupon-code">
						</div>
						<button id="regi-btn">등록하기</button>
					</div>
				</div>
				<div id="img-container"></div>
				<div id="coupon-regi-etc-container">
					<div id="etc-left-container">이용안내</div>
					<div id="etc-right-container">
						영화관람권 비밀번호를 입력해주세요.<br> 온라인(홈페이지/모바일)에서 등록하신 관람권은 홈페이지/모바일예매에
						한하여 사용할 수 있으며, 현장 매표소에서는 사용할 수 없습니다.<br> 영화 관람권은 일반 인터넷 사이트를
						포함한 시중에서 임의로 매매될 수 없으며 반드시 팝콘픽을 통해서만 구입하실 수 있습니다.
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer>
		<!-- -->
	</footer>

</body>
</html>