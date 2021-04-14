<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/login.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
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
		<form action="./login" method="post" name="login">
		<div class="login"><label class="login">아이디</label>
		<input type="button" class="find-bnt" onclick="findidpage()" value="아이디 찾기">
		<% if(request.getAttribute("loginchek") != null) { %>
				<p class="login-res">아이디와 비밀번호를 확인해주세요.</p>
		<% } %>
		</div>
		<div class="input"><input class="id" type="text" name="userid"></div>
		<div class="login"><label class="login">비밀번호</label>
		<input type="button" class="find-bnt" onclick="findpwpage()" value="비밀번호 찾기"></div>
		<div class="input"><input class="pw" type="password" name="userpw"></div>
		<div class="checkbox">
			<%
				if(username.equals("")) {
			%>
		      	<input type="checkbox" name="remember" class="remember-box">
		    <% } else { %>
		      	<input type="checkbox" name="remember" class="remember-box" checked>
		    <% } %>
		    <label for="id=remember" class="login">기억하기</label>
		    <label class="login-bnt"><button class="login-bnt" onclick="check()">로그인</button></label>
		</form>
			<input type="button" class="find-bnt" onclick="registerpage()" value="회원가입">
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

function findidpage() {
	window.location.href="<%=request.getContextPath() %>/login/findid";
}

function findpwpage() {
	window.location.href="<%=request.getContextPath() %>/login/findpw";
}

function registerpage() {
	window.location.href="<%=request.getContextPath() %>/register";
}
</script>
</html>