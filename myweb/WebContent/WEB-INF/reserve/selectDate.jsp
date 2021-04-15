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
	<% ArrayList<String> availList = (ArrayList<String>)request.getAttribute("availList"); %>
	<section>
		<div class="reserveStatus">
			<span>영화 선택 ></span>
			<span>날짜 선택 > </span><span>극장 선택 > 시간 선택 > 좌석 선택</span>
		</div>
		<br>
		<div class="container">
			<form action="./selectTheater" method="post">
			<% for(String date : availList) { %>
					<button type="submit" class="btn btn-outline-light btn-sm" name="date" value="<%=date %>"><%=date %></button>
			<% } %>
			</form>
		</div>
	</section>
</body>
</html>