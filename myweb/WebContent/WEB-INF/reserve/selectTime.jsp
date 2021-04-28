<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH무비</title>
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reserve.css">
</head>
<style>
	div.reserveStatus>span:first-child, div.reserveStatus>span:last-child {
		font-size: small;
		color: rgb(157, 157, 157);
	}
	
	div.reserveStatus>span:nth-child(2) {
		font-size: large;
		color: skyblue;
	}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<%
		if (session == null || !session.getAttribute("login").equals("true")) {
	%>
		 	<script>
				alert("로그인 인증이 만료되었습니다.\n다시 로그인 해 주시기 바랍니다.");
				location.href="<%=request.getContextPath()%>/login";
			</script>
	<%
		}
		ArrayList<String> timeList = (ArrayList<String>)request.getAttribute("timeList");
	%>
	<section>
		<div class="reserveStatus">
			<span>영화 선택 > 날짜 선택 > 극장 선택 ></span>
			<span>시간 선택 > </span><span>좌석 선택</span>
		</div>
		<br>
		<div class="container">
			<form action="./selectSeat" method="post" accept-charset="UTF-8">
				<% for(String time : timeList) { %>
					<button type="submit" class="btn btn-outline-light btn-sm" name="time" value="<%=time %>"><%=time %></button>
				<% } %>
			</form>
		</div>
	</section>
</body>
</html>