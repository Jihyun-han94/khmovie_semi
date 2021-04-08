<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간 선택</title>
</head>
<style>
	p {
		background-color: black;
		color: lightgray;
	}
	
	.selectTime {
		width: 300px;
		border-radius: 5px;
		box-shadow: 5px 5px 5px lightgray;
	}
	
	button {
		display: block;
	}
</style>
<body>
	<%
		ArrayList<String> timeList = (ArrayList<String>)request.getAttribute("timeList");
	%>
	<section>
		<div class="selectTime">
			<p>4.시간 선택</p>
			<div class="container">
				<form action="./reserve_4" method="post" accept-charset="UTF-8">
					<% for(String time : timeList) { %>
						<button type="submit" class="btn btn-primary" name="time" value="<%=time %>"><%=time %></button>
					<% } %>
				</form>
			</div>
		</div>
	</section>
</body>
</html>