<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 선택</title>
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/reserve/css/reserve.css">
</head>
<style>
	/*
	.selectTheater, .reserveStatus {
		width: 600px;
		border-radius: 5px;
		box-shadow: 5px 5px 5px lightgray;
	}
	*/
	
	div.reserveStatus>span:first-child, div.reserveStatus>span:last-child {
		font-size: small;
		color: rgb(157, 157, 157);
	}
	
	div.reserveStatus>span:nth-child(2) {
		font-size: large;
		font-weight: bold;
		color: skyblue;
	}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<%
		ArrayList<String> theaterList = (ArrayList<String>)request.getAttribute("theaterList");
		ArrayList<String> valList = new ArrayList<>();
		valList.clear();
		for(String theater : theaterList) {
			switch(theater) {
				case "강남":
					valList.add("gangnam");	break;
				case "천호":
					valList.add("cheonho"); break;
				case "송파":
					valList.add("songpa");	break;
				case "압구정":
					valList.add("apgujeong");	break;
				case "미아":
					valList.add("miah"); break;
				case "수유":
					valList.add("sooyu"); break;
				case "등촌":
					valList.add("deungchon"); break;
				case "강변":
					valList.add("gangbyeon"); break;
				case "건대입구":
					valList.add("konUniv");
			}
		}
	%>
	<section>
		<div class="reserveStatus">
			<span>영화 선택 > 날짜 선택 ></span>
			<span>극장 선택 > </span><span>시간 선택 > 좌석 선택</span>
		</div>
		<br>
		<div class="container">
			<form action="./selectTime" method="post" accept-charset="UTF-8">
				<% for(int i = 0; i < theaterList.size(); i++) { %>
					<button type="submit" class="btn btn-outline-light btn-sm" name="theaterName" value="<%=valList.get(i) %>"><%=theaterList.get(i) %></button>
				<% } %>
			</form>
		</div>
	</section>
</body>
</html>
