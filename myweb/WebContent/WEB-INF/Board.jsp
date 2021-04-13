<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList,board.BoardVO" %>
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
	<div class="item1"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item2"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item3"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item4"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item5"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item6"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item7"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item8"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
            <div class="item5"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item9"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item10"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
	<div class="item11"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>
    <div class="item12"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a></div>        
	</div>
	<div class="table">
	<table>
	<% ArrayList<BoardVO> datas = (ArrayList<BoardVO>)request.getAttribute("datas");
		for(BoardVO data: datas){%>
	<tr>
	<td><%=data.getB_TITLE() %></td>
	</tr>
	<% }%>
	</table>
	</div>	
	<footer class="footer"></footer>
</body>
</html>