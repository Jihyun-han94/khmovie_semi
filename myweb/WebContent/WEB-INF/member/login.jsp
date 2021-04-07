<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
<title>로그인</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<section>
		<%
    	String username = "";
    	if(request.getAttribute("username") != null){
    		username = (String)request.getAttribute("username");
    	}
	    %>
		<form action="./login" method="post" class="form-horizontal">
			<div class="form-grop">
				<label for="id_username" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="id_username" value="<%=username %>" name="username" required>
				</div>
			</div>
			<div class="form-grop">
				<label for="id_password" class="col-sm-2 control-label">패스워드</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="id_password" name="password" required>
				</div>
			</div>
			<div class="form-grop">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<%
							if(username.equals("")) {
						%>
					      	<input type="checkbox" id="id_remember" name="remember">
					    <% } else { %>
					      	<input type="checkbox" id="id_remember" name="remember" checked>
					    <% } %>
					    <label for="id=remember">기억하기</label>
					</div>
				</div>
			</div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
			    	<button type="submit" class="btn btn-default">로그인</button>
			    </div>
			</div>
		</form>
	</section>
</body>
</html>