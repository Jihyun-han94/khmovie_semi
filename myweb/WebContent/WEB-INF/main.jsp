<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <html lang="en">

  <head>
  <title>KH무비</title>
   <link type="text/css" rel="stylesheet"
    href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">   
</head>

<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<div class="container">
	<div class="textdiv">
    <h2 id="text">박스오피스</h2>
    </div>
    <div class="hrdiv">
    <hr id="hr">
    </div>
    <div class="item">
      	<div class="col-sm-3">
      		<a href="<%=request.getContextPath() %>/selectDate?title=감기" class="thumbnail"><img width="180px" height="250px" src="<%=request.getContextPath() %>/static/img/cold.jpg" alt="Image" class="img-responsive" width="175px" height="250px"></a>
      	</div>
      	<div class="col-sm-3">
      		<a href="<%=request.getContextPath() %>/selectDate?title=미나리" class="thumbnail"><img width="180px" height="250px" src="<%=request.getContextPath() %>/static/img/minari.jpg" alt="Image" class="img-responsive" width="175px" height="250px"></a>
      	</div>
      	<div class="col-sm-3">
      		<a href="<%=request.getContextPath() %>/selectDate?title=비밀의 정원" class="thumbnail"><img width="180px" height="250px" src="<%=request.getContextPath() %>/static/img/secretGarden.png" alt="Image" class="img-responsive" width="175px" height="250px"></a>
      	</div>
      	<div class="col-sm-3">
      		<a href="<%=request.getContextPath() %>/selectDate?title=테넷" class="thumbnail"><img width="180px" height="250px" src="<%=request.getContextPath() %>/static/img/tenet.jpg" alt="Image" class="img-responsive" width="175px" height="250px"></a>
      	</div>
   	</div>
   	<div class="textdiv2">
    <h2 id="text2">Review</h2>
    </div>
    <div class="hrdiv2">
    <hr id="hr2">
    </div>
    <div class="item2">
		<div class="col-sm-4">
	    	<a href="#x" class="thumbnail2"><img width="180px" height="250px" src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image" class="img-responsive"></a>
    	</div>
    	<div class="col-sm-4">
    		<a href="#x" class="thumbnail2"><img width="180px" height="250px" src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image" class="img-responsive"></a>
      	</div>
      	<div class="col-sm-4">
      		<a href="#x" class="thumbnail2"><img width="180px" height="250px" src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image" class="img-responsive"></a>
      	</div>
      	<div class="col-sm-4">
      		<a href="#x" class="thumbnail2"><img width="180px" height="250px" src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image" class="img-responsive"></a>
      	</div>
    </div>
	<div class="textdiv3">
    <h2 id="text3">등급별 혜택</h2>
    </div>
    <div class="hrdiv3">
    <hr id="hr3">
    </div>
    <div class="item3">
      		<a href="<%=request.getContextPath() %>/grade" class="thumbnail2"><img width="830px" height="300px" src="<%=request.getContextPath() %>/img/grade.png" alt="Image" class="img-responsive"></a>
	</div>
	</div>
	<div>
    <div class="footer">
    <div id ="address">
    <p>
    | KH 무비 대표 문의 전화 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |  찾아오시는 길  | <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;070-325-3456&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울특별시 강남구 테헤란로14길 6 
    </p>
    </div>
    </div>
    </div>
</body>

</html>