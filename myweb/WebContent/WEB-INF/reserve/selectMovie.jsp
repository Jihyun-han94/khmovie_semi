<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
				 reserve.ReserveVO" %>
<%@ page info="reserve" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>KH무비</title>
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reserve.css">
</head>
<style>
	div.reserveStatus>span:first-child {
		font-size: large;
		color: skyblue;
	}
	
	div.reserveStatus>span:last-child {
		font-size: small;
		color: rgb(157, 157, 157);
	}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<%
		if (session == null || session.getAttribute("username") == null || !session.getAttribute("login").equals("true")) {
	%>
		 	<script>
				alert("로그인이 필요한 페이지입니다.");
				location.href="<%=request.getContextPath()%>/login";
			</script>
	<%
		}
		ArrayList<String> titleList = (ArrayList<String>)request.getAttribute("titleList");
	%>	
	<section>
		<div class="reserveStatus">
			<span>영화 선택 > </span>
			<span>날짜 선택 > 극장 선택 > 시간 선택 > 좌석 선택</span>
		</div>
		<br>
		<div class="container">
			<form action="./selectDate" accept-charset="UTF-8">
				<div class="movieItem">
				<% for(String title: titleList) { %>
					<button class="movie" type="submit" name="title" value="<%=title %>">
						<img src="<%=request.getContextPath() %>/static/img/<%=title %>.jpg"; width="150px"; height="210px"; alt="">
					</button>
				<% } %>
				</div>
			</form>
		</div>
	</section>
</body>
</html>