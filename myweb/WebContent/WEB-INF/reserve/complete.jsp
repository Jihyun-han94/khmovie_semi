<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH무비</title>
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reserve.css">
</head>
<style>
	section {
		width: 300px;
		height: 350px;
		background-color: #1D2316;
		margin-left: 130px;
		border: 1px solid white;
	}
	#msg {
		transition: translate(0%, 5%);
		text-align: center;
		color: skyblue;
		line-height: 60px;
	}
	hr {
		color: white;
		border-color: white;
		background-color: white;
	}

	#sub {
		text-indent: 23px;
		color: black;
		background-color: orange;
	}
	table {
		margin-left: 25px;
		color: white;
	}
	td {
		text-indent: 15px;
	}
	
	#confirm {
		display: block;
		margin: 0 auto;
	}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<%
		String title = (String)session.getAttribute("title");
		String date = (String)session.getAttribute("date");
		String theaterName = (String)session.getAttribute("theaterName");
		String time = (String)session.getAttribute("time");
		String[] seatNumArr = (String[])session.getAttribute("seatNumArr");
		int totalPrice = (Integer)session.getAttribute("totalPrice");
	%>
	<section>
		<p id="msg">예매가 정상적으로 접수되었습니다.</p>
		<p id="sub">예매내역 확인</p>
		<table>
			<tr>
				<td>영화제목</td>
				<td><%=title %></td>
			</tr>
			<tr>
				<td>관람극장</td>
				<td><%=theaterName %></td>
			</tr>
			<tr>
				<td>관람일시</td>
				<td><%=date %>&nbsp;<%=time %></td>
			</tr>
			<tr>
				<td>관람인원</td>
				<td><%=seatNumArr.length %>명</td>
			</tr>
			<tr>
				<td>좌석번호</td>
				<td>
					<% for(int i = 0; i < seatNumArr.length; i++) { %>
						<%=seatNumArr[i] %>&nbsp;
					<% } %>
				</td>
			</tr>
			<tr>
				<td>결제금액</td>
				<td><%=totalPrice %>원</td>
			</tr>
		</table>
		<br>
		<form action = "<%=request.getContextPath() %>/main">
			<button id="confirm" type="submit" class="btn btn-light btn-sm">확인</button>
		</form>
	</section>
</body>
</html>