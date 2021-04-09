<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
    href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/module/top_nav.jsp" %>
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/Movie.css">  
</head>
<body>
	<div class="container">
	<div class="poster">포스터</div>
	<div class="contents">
	<label for="title">제목</label><br>
	<p class="title"></p>
	<label for="context">줄거리</label><br>
	<p class="context"></p>
	</div>
	</div>
</body>
</html>