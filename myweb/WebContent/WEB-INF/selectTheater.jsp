<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 선택</title>
</head>
<style>
	p {
		background-color: black;
		color: lightgray;
	}
	
	.selectTheater {
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
					valList.add("songpa");
			}
		}
	%>
	<section>
		<div class="selectTheater">
			<p>3.극장 선택</p>
			<div class="container">
				<form action="./reserve_3" method="post" accept-charset="UTF-8">
					<% for(int i = 0; i < theaterList.size(); i++) { %>
						<button type="submit" class="btn btn-primary" name="theaterName" value="<%=valList.get(i) %>"><%=theaterList.get(i) %></button>
					<% } %>
				</form>
			</div>
		</div>
	</section>
</body>
</html>