<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 확인</title>
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/register.css">
</head>
<body>
	<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	<section class="register-res">
		<h3 class="success"><%=request.getAttribute("msg") %></h3>
	</section>
</body>
</html>