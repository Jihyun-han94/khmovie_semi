<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
</head>
<style>
	p {
		background-color: black;
		color: lightgray;
	}
	
	.selectSeat {
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
		ArrayList<String> seatNumList = (ArrayList<String>)request.getAttribute("seatNumList");
	%>
	<section>
		<div class="selectSeat">
			<p>5.좌석 선택</p>
			<div class="custom-control custom-checkbox">
				<form action="./reserve_5" method="post" accept-charset="UTF-8">
					<% for(String seatNum : seatNumList) { %>
						<input type="checkbox" class="custom-control-input" name="seatNum" value="<%=seatNum %>">
					<% } %>
					<button type="submit" class="btn btn-primary">예매하기</button>
				</form>
			</div>
		</div>
	</section>
</body>
</html>