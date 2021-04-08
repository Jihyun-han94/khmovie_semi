<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
				 reserve.ReserveVO" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>영화 선택</title>
</head>
<style>
	p {
		background-color: black;
		color: lightgray;
	}
	
	.selectMovie {
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
		ArrayList<String> titleList = (ArrayList<String>)request.getAttribute("titleList");
		ArrayList<String> valList = new ArrayList<>();
		valList.clear();
		for(String title : titleList) {
			switch(title) {
				case "베테랑":
					valList.add("veteran"); break;
				case "감기":
					valList.add("cold"); break;
				case "범죄도시":
					valList.add("villans");
			}
		}	
	%>
	<section>
		<div class="selectMovie">
			<p>1.영화 선택</p>
			<div class="container">
				<form action="./reserve_1" method="post" accept-charset="UTF-8">
					<% for(int i = 0; i < titleList.size(); i++) { %>
						<button type="submit" class="btn btn-primary" name="title" value="<%=valList.get(i) %>"><%=titleList.get(i) %></button>
					<% } %>
				</form>
			</div>
		</div>
	</section>
</body>
</html>