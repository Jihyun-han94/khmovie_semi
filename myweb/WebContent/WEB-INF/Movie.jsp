<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO" %>
<%@page import="board.BoardDAO" %>
<%@page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>

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
	<% String path =request.getServletContext().getRealPath(File.separator)+"\\upload"; %>
	<% BoardVO data = (BoardVO)request.getAttribute("data"); %>
	<% String filename = (String)request.getAttribute("filename"); 
		System.out.println(filename);
		String directory = application.getRealPath("/upload/")+filename;
		System.out.println(directory);
	%>
	
	<div class="container">
	<div class="poster"><img id="img" src="upload/<%=filename %>"></div>
	<div class="contents">
	<p class="title"><%=data.getB_TITLE() %></p>
	<p class="direct">감독 : <%=data.getB_ARTIST() %></p>
	<p class="acctist">출연진 : <%=data.getB_CONTEXT() %></p>
	<p>줄거리</p>
	<p class="context"><%=data.getB_DIRECT() %></p>
	</div>
	</div>
	<footer class="footer"></footer>
</body>
</html>