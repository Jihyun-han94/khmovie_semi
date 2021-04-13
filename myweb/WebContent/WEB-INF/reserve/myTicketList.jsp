<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
				 reserve.TicketVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예매 내역</title>
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reserve.css">
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<% ArrayList<TicketVO> ticketList = (ArrayList<TicketVO>)request.getAttribute("ticketList"); %>
	<select name="select">
		<option>예매일자</option>
		<% for(TicketVO ticket : ticketList) { %>
				<option value="<%=ticket.getBTime() %>" onclick=getData(this);><%=ticket.getBTime() %></option>
		<% } %>
	</select>
</body>
</html>