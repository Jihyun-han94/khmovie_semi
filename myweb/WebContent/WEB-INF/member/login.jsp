<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/register.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
<title>로그인</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<%
    	String userid = "";
    	if(request.getAttribute("userid") != null){
    		userid = (String)request.getAttribute("username");
    	}
    %>
	<section class="login">
		<form action="./login" method="post">
			<section>
				<div class="loginid"><label>아이디</label></div>
				<div><input type="text" name="userid"></div>
				<div class="loginpw"><label>비밀번호</label></div>
				<div><input type="password" name="userpw"></div>
				<button class="login-bnt">로그인</button>
				<div class="remember">
					<label class="remember-label">기억하기</label>
					<%
						if(userid.equals("")) {
					%>
				      	<input type="checkbox" name="remember" class="remember-box">
				    <% } else { %>
				      	<input type="checkbox" name="remember" class="remember-box" checked>
				    <% } %>
				</div>
			</section>
		</form>
	</section>
</body>
</html>