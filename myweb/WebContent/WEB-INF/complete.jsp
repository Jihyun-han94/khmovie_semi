<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매완료</title>
</head>
<style>
	div {
		width: 300px;
		height: 350px;
		border: 1px solid darkgray;
	}
	
	h4 {
		text-align: center;
		color: rgb(74, 0, 149);
	}
	
	p {
		text-indent: 20px;
	}
	
	button {
		display: block;
		margin: 0 auto;
		background-color: rgb(74, 0, 149);
		color: white;
		cursor: pointer;
	}
</style>
<body>
	<%
		String title = (String)session.getAttribute("title");
		String date = (String)session.getAttribute("date");
		String theaterName = (String)session.getAttribute("theaterName");
		String time = (String)session.getAttribute("time");
		String[] seatNumArr = (String[])session.getAttribute("seatNumArr");
		int totalPrice = (Integer)session.getAttribute("totalPrice");
	%>
	<section>
		<div>
			<h4>예매가 정상적으로 접수되었습니다.</h4>
			<hr>
			<p><b>예매내역 확인</b></p>
			<!-- <p>예매일시: <%=date %> + <%=time %></p> -->
			<p><b>영화제목</b> &nbsp;<%=title %></p>
			<p><b>관람극장</b> &nbsp;메가박스 <%=theaterName %></p>
			<p><b>관람일시</b> &nbsp;<%=date %>&nbsp;<%=time %></p>
			<p><b>관람인원</b> &nbsp;<%=seatNumArr.length %>명</p>
			<p><b>좌석번호</b> &nbsp;</p>
			<p><b>결제금액</b> &nbsp;<%=totalPrice %>원</p>
			<form action = "./reserve_5">
				<button type="submit">확인</button>
			</form>
		</div>	
	</section>
</body>
</html>