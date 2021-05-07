<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    		
	<form action="./update" method="post" class="inputform" enctype="multipart/form-data" accept-charset="utf-8">
	 	<div class="form-group">
              <label for="input1">아이디</label><br>
            <input type="text" id="input1" name="B_ID" placeholder="아이디를 입력해주세요." value=<%=userid %>>
          </div>
        <div class="form-group">
              <label for="input1">제목</label><br>
            <input type="text" id="input2" name="B_TITLE" placeholder="영화제목을 작성해주세요.">
          </div>
        <div class="form-group">
            <label for="input2">감독</label><br>
            <input type="text" id="input3" name="B_DIRECT" placeholder="영화감독을 작성해주세요.">
          </div>
        <div class="form-group">
            <label for="input3">출연진</label><br>
            <input type="text" id="input4" name="B_ARTIST" placeholder="출연진을 작성해주세요.">
          </div>
          <div class="form-group">
            <label for="input4">줄거리</label><br>
            <textarea id="input5" name="B_CONTEXT" rows="10" placeholder="줄거리를 작성해주세요."></textarea>
          </div>
			파일:<input type="file" name="file"><br>
          <div class="buttons">
        <button type="submit" class="btn btn-info" id="btn1">등록하기</button>
        <button type="button" class="btn btn-secondary" id="btn2" onclick="location.href='<%=request.getContextPath() %>/board'">목록으로</button>
		</div>
	</form>
	</div>
	
	<footer class="footer"></footer>

</body>
</html>

