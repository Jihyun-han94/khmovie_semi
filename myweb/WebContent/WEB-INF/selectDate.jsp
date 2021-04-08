<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 선택</title>
</head>
<style>
	p {
		background-color: black;
		color: lightgray;
	}
	
	.selectDate {
		width: 300px;
		border-radius: 5px;
		box-shadow: 5px 5px 5px lightgray;
	}
	
	.btn {
		display: block;
	}
</style>
<body>
	<% ArrayList<String> getDate = (ArrayList<String>)request.getAttribute("getDate"); %>
	<section>
		<div class="selectDate">
			<p>2.날짜 선택</p>
			<div class="container">
				<form action="./reserve_2" method="post">
				<% for(String date : getDate) { %>
						<button type="submit" class="btn btn-primary" name="date" value="<%=date %>"><%=date %></button>
				<% } %>
				</form>
			</div>
		</div>
	</section>
</body>
</html>