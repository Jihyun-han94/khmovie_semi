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
		<h3>비밀번호 찾기</h3>
		<hr>
		<form action="./findpw/res" method="post" name="findpw" onsubmit="return check()">
			<label class="find-label">회원 정보에 등록한 휴대전화로 인증</label>
			<div class="info">
				<span class="info-name">이  름</span>
				<input class="userinfo" type="text" name="userName">
			</div>
			<div class="info">
				<span class="info-id">아이디</span>
				<input class="userinfo" type="text" name="userid">
			</div>
			<div class="info">
				<span class="info-phone">핸드폰 번호</span>
				<input class="userinfo" type="text" name="userPhone">
			</div>
			<div class="info-check">
				<button class="find-bnt">비밀번호 찾기</button>
			</div>
		</form>
	</section>
</body>
<script type="text/javascript">
function check(){
	if(!document.findpw.userName.value){
		alert("이름를 입력하세요.");
		return false;
	}
	if(!document.findpw.userid.value){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(!document.findpw.userPhone.value){
		alert("핸드폰 번호를 입력하세요.");
		return false;
	}
}
</script>
</html>