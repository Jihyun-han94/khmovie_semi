<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String logined = "";
	if(session.getAttribute("login") != null) {
		logined = (String)session.getAttribute("login");
	}
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
    	<a class="navbar-brand" href="#">Navbar</a>
        	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          	<span class="navbar-toggler-icon"></span>
        	</button>
        <div class="collapse navbar-collapse" id="navbarNav">
          	<ul class="navbar-nav">
            	<li class="nav-item">
              		<a class="nav-link active" aria-current="page" href="<%=request.getContextPath() %>">Home</a>
            	</li>
            	<li class="nav-item">
             		<a class="nav-link" href="<%=request.getContextPath() %>/reserve">예매</a>
            	</li>
            	<li class="nav-item">
              		<a class="nav-link" href="<%=request.getContextPath() %>/board">관람후기</a>
            	</li>
            	
            	<%  if(logined.equals("true")){ %>
            		<li class="login">
              		<a class="nav-link" href="<%=request.getContextPath() %>/logout">로그아웃</a>
	            	</li>
	            <%  } else { %>
	            	<li class="login">
              		<a class="nav-link" href="<%=request.getContextPath() %>/login">로그인</a>
	            	</li>
	            	<li class="join">
	              		<a class="nav-link" href="<%=request.getContextPath() %>/register">회원가입</a>
	            	</li>
	            <%  } %>
	            
	            <li class="nav-item">
	              		<a class="nav-link" href="<%=request.getContextPath() %>/mypage">마이페이지</a>
	            	</li>
          	</ul>
		</div>
	</div>
</nav>