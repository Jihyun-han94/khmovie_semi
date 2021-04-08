<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "Register.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/register.css">
</head>
<body>
	<header class="idcheck">
		<h3>아이디 중복확인</h3>
	</header>
	<section class="idcheck">
		<%
			String id = request.getParameter("userid");
			MemberDAO dao = MemberDAO.getInstance();
			boolean result = dao.confirmId(id);
			if(result) { %>
				<center>
				<br /><br />
				<h4>이미 사용중인 ID 입니다.</h4>
				</center>
		<% 	} else { %>
				<center>
				<br /><br />
				<h4>입력하신 ID는 사용가능합니다.</h4>
				</center>
		<%  }%>
	</section>
</body>
</html>