<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매완료</title>
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/reserve/css/reserve.css">
</head>
<style>
	section {
		width: 300px;
		height: 350px;
		background-color: #1D2316;
		margin-left: 130px;
		border: 1px solid white;
	}
	h6 {
		transition: translate(0%, 5%);
		text-align: center;
		color: skyblue;
		font-weight: bold;
		line-height: 60px;
	}
	hr {
		color: white;
		border-color: white;
		background-color: white;
	}

	p {
		text-indent: 23px;
		color: black;
		background-color: orange;
	}
	table {
		margin-top: 20px;
		margin-left: 25px;
		color: white;
	}
	td {
		text-indent: 15px;
	}
	
	#confirm {
		display: block;
		margin: 0 auto;
		font-weight: bold;
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
		<h6>예매가 정상적으로 접수되었습니다.</h6>
		<p><b>예매내역 확인</b></p>
		<!-- <p>예매일시: <%=date %> + <%=time %></p> -->
		<table>
			<tr>
				<th>영화제목</th>
				<td><%=title %></td>
			</tr>
			<tr>
				<th>관람극장</th>
				<td><%=theaterName %></td>
			</tr>
			<tr>
				<th>관람일시</th>
				<td><%=date %>&nbsp;<%=time %></td>
			</tr>
			<tr>
				<th>관람인원</th>
				<td><%=seatNumArr.length %>명</td>
			</tr>
			<tr>
				<th>좌석번호</th>
				<td>
					<% for(int i = 0; i < seatNumArr.length; i++) { %>
						<%=seatNumArr[i] %>&nbsp;
					<% } %>
				</td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td><%=totalPrice %>원</td>
			</tr>
		</table>
		<br>
		<form action = "./reserve_5">
			<button id="confirm" type="submit" class="btn btn-light btn-sm">확인</button>
		</form>
	</section>
</body>
</html>