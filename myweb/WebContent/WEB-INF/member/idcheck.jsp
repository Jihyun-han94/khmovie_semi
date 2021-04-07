<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "Member.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/join.css">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
	<%@ include file="/script/join_script.jsp" %>
</head>
<body>
	<header class="idcheck">
		<h3>아이디 중복확인</h3>
	</header>
	<%=request.getAttribute("msg") %>
</body>
</html>