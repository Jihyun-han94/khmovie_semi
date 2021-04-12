<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/find.css">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
<title>아이디 찾기</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<section class="find">
		<h3>아이디 찾기</h3>
		<hr>
		<form action="./findid/res" method="post" name="findid" onsubmit="return check()">
			<label class="find-label">회원 정보에 등록한 휴대전화로 인증</label>
			<div class="info">
				<span class="info-name">이  름</span>
				<input class="userinfo" type="text" name="userName">
			</div>
			<div class="info">
				<span class="info-phone">핸드폰 번호</span>
				<input class="userinfo" type="text" name="userPhone">
			</div>
			<div class="info-check">
				<button class="find-bnt">아이디 찾기</button>
			</div>
		</form>
	</section>
</body>
<script>
function check(){
	if(!document.findid.userName.value){
		alert("이름를 입력하세요.");
		return false;
	}
	if(!document.findid.userPhone.value){
		alert("핸드폰 번호를 입력하세요.");
		return false;
	}
}
</script>
</html>