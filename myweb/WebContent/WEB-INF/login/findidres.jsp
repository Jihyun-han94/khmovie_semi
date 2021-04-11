<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Register.MemberVO" %>
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
	<section class="findres">
		<h3>아이디 검색 결과</h3>
		<hr>
		<h2>회원님의 아이디는</h2>
		<h2 class="id-res"><%=request.getAttribute("userid")%></h2>
		<h2>입니다.</h2>
		<div class="info-check">
				<button class="find-bnt" onclick="loginpage()">로그인하기</button>
		</div>
	</section>
</body>
<script>
function loginpage() {
	window.location.href="<%=request.getContextPath() %>/login";
}
</script>
</html>