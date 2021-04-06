<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <html lang="en">

  <head>
   <link type="text/css" rel="stylesheet"
    href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">   
  </head>

  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">예매</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">관람후기</a>
            </li>
            <li class="login">
              <a class="nav-link" href="#">로그인</a>
            </li>
            <li class="join">
              <a class="nav-link" href="#">회원가입</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <hr id="hr3">
    <h2 id="text">박스오피스</h2>
    <hr id="hr">
    <div class="item">
      <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
      <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
      <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
      <div class="col-sm-3"><a href="#x" class="thumbnail"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
    </div>
    <h2 id="text2">Review</h2>
    <hr id="hr2">
    <div class="item2">
      <div class="col-sm-4"><a href="#x" class="thumbnail2"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
      <div class="col-sm-4"><a href="#x" class="thumbnail2"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
      <div class="col-sm-4"><a href="#x" class="thumbnail2"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
      <div class="col-sm-4"><a href="#x" class="thumbnail2"><img src="<%=request.getContextPath() %>/static/img/poster3.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
    <h2 id="text3">등급별 혜택</h2>
    <hr id="hr4">
    <div class="item3">
      <div class="col-sm-5"><a href="#x" class="thumbnail2"><img src="<%=request.getContextPath() %>/static/img/reward.jpg" alt="Image"
            class="img-responsive"></a>
      </div>
      </div>
    
    <footer class="footer">

    </footer>
  </body>

  </html>