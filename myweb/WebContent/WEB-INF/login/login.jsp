<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/login.css">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
<title>로그인</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<%
    	String username = "";
    	if(request.getAttribute("userid") != null){
    		username = (String)request.getAttribute("username");
    	}
    %>
	<section class="login">
		<form action="./login" method="post" name="login" onsubmit="return logincheck()">
		<div class="login"><label class="login">아이디</label>
		<% if(request.getAttribute("loginchek") != null) { %>
				<p class="login-res">아이디와 비밀번호를 확인해주세요.</p>
		<% } %>
		</div>
		<div class="input"><input class="id" type="text" name="userid">
		<a href="<%=request.getContextPath()%>/login/findid"><p class="find">아이디 찾기</p></a></div>
		<div class="login"><label class="login">비밀번호</label></div>
		<div class="input"><input class="pw" type="password" name="userpw">
		<a href="<%=request.getContextPath() %>/login/findpw"><p class="find">비밀번호 찾기</p></a></div>
		<div class="checkbox">
			<%
				if(username.equals("")) {
			%>
		      	<input type="checkbox" name="remember" class="remember-box">
		    <% } else { %>
		      	<input type="checkbox" name="remember" class="remember-box" checked>
		    <% } %>
		    <label for="id=remember" class="login">기억하기</label>
		    <label class="login-bnt"><button class="login-bnt" onclick="check();">로그인</button></label>
		</form>
			<label class="login-bnt registerpage"><a href="<%=request.getContextPath() %>/register"><button class="login-bnt">회원가입</button></a></label>
		</div>
	</section>
</body>
<script>
function check(){
	if(!document.login.userid.value){
		alert("ID를 입력하세요.");
		return false;
	}
	if(!document.login.userpw.value){
		alert("PASSWORD를 입력하세요.");
		return false;
	}
}
</script>
</html>