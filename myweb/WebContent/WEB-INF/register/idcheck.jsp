<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "Register.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/register.css">
	<%@ include file="/WEB-INF/module/register_link.jsp" %>
</head>
<body>
	<header class="idcheck">
		<h3>아이디 중복확인</h3>
	</header>
	<section class="idcheck">
		<form action="./register" method="post">
			<button type="submit" onclick="popupClose()">확인</button>
		</form>
	</section>
</body>
</html>