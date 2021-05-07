<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO" %>
<%@page import="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH무비</title>

<link type="text/css" rel="stylesheet"
    href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/MovieUpdate.css">  

</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<h2 id="text">Review</h2>
    <hr id="hr">
    <div class="container">
    <% String userid = (String)request.getAttribute("userid"); %>	
    	<% if(userid == null){
    	%>	
    	<script type="text/javascript">
    	alert("로그인 후 이용가능 합니다.");
    	window.location.href="<%=request.getContextPath() %>/login";
    	</script> 
    	<%} 
    	
    	BoardVO data = (BoardVO)request.getAttribute("data");
    	String movietitle = (String)request.getAttribute("movietitle");
    	
    	%>
	<form action="<%=request.getContextPath() %>/movie/update" method="post" class="inputform" enctype="multipart/form-data" accept-charset="utf-8">
	 	
	 	<div class="form-group">
	 	<div class="form-group">
  
            <input type="hidden" id="input1" name="B_NUM"  value=<%=data.getB_NUM() %>>
          </div>
              <label for="input1">아이디</label><br>
            <input type="text" id="input1" name="B_ID" placeholder="<%=data.getB_ID() %>" value=<%=userid %>>
          </div>
        <div class="form-group">
              <label for="input1">제목</label><br>
            <input type="text" id="input2" name="B_TITLE" placeholder="<%=data.getB_TITLE() %>">
          </div>
        <div class="form-group">
            <label for="input2">감독</label><br>
            <input type="text" id="input3" name="B_DIRECT" placeholder="<%=data.getB_DIRECT() %>">
          </div>
        <div class="form-group">
            <label for="input3">출연진</label><br>
            <input type="text" id="input4" name="B_ARTIST" placeholder="<%=data.getB_ARTIST() %>">
          </div>
          <div class="form-group">
            <label for="input4">줄거리</label><br>
            <textarea id="input5" name="B_CONTEXT" rows="10" placeholder="<%=data.getB_CONTEXT() %>"></textarea>
          </div>
			파일:<input type="file" name="file"><br>
          <div class="buttons">
        <button type="submit" class="btn btn-info" id="btn1">수정하기</button>
        <button type="button" class="btn btn-secondary" id="btn2" onclick="location.href='<%=request.getContextPath() %>/board'">목록으로</button>
		</div>
	</form>
	</div>
	
	<footer class="footer"></footer>

</body>
</html>

