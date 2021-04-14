<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Member.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/find.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
<title>비밀번호 찾기</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<section class="findres">
		<h3>비밀번호 검색 결과</h3>
		<hr>
		<% if(request.getAttribute("userpw") != null) {%>
		<h2>회원님의 비밀번호는</h2>
		<h2 class="id-res"><%=request.getAttribute("userpw")%></h2>
		<h2>입니다.</h2>
		<div class="info-check">
				<button class="find-bnt" onclick="loginpage()">로그인하기</button>
		</div>
		<% } else { %>
			<h2>가입된 정보가</h2>
			<h2>확인되지 않습니다.</h2>
			<div class="info-check">
			<button class="find-bnt" onclick="findidpage()">아이디 찾기</button>
			<button class="find-bnt" onclick="findpwpage()">비밀번호 찾기</button>
			<button class="find-bnt" onclick="loginpage()">로그인하기</button>
		</div>
		<% } %>
	</section>
</body>
<script>
function loginpage() {
	window.location.href="<%=request.getContextPath() %>/login";
}

function findidpage() {
	window.location.href="<%=request.getContextPath() %>/login/findid";
}

function findpwpage() {
	window.location.href="<%=request.getContextPath() %>/login/findpw";
}
</script>
</html>
