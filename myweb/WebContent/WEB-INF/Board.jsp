<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList,board.BoardVO,board.BoardDAO" %>
 
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
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/board.css">   
</head>
<body>
	<h2 id="text2">kh무비에 없는 영화를 등록해주세요!</h2>
	<form action="./update" method ="get">
	<button id="btn" type="submit">등록하기</button>
	</form>
 	<h2 id="text">관람후기</h2>
    <hr id="hr">

	
	<div class="container">
	
	<% 
		ArrayList<BoardVO> filedatas = (ArrayList<BoardVO>)request.getAttribute("filedatas");
		for(BoardVO filedata: filedatas){%>
	
	<div class=item><a href="<%=request.getContextPath() %>/moviereview?B_TITLE=<%=filedata.getMovietitle()%>&filename=<%=filedata.getFileName() %>"><img width="200px" height="287px" src="upload/<%=filedata.getFileRealName() %>"></a></div>
	
	<% }%>
	
	</div>	
	<footer class="footer"></footer>
</body>
</html>