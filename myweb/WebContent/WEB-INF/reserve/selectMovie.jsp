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
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reserve.css">
</head>
<style>
/*
	.selectMovie {
		width: 1400px;
		height: 280px;
		border-radius: 5px;
		box-shadow: 2px 2px 5px lightgray;
	}
*/
	div.reserveStatus>span:first-child {
		font-size: large;
		font-weight: bold;
		color: skyblue;
	}
	
	div.reserveStatus>span:last-child {
		font-size: small;
		color: rgb(157, 157, 157);
	}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<%
		ArrayList<String> titleList = (ArrayList<String>)request.getAttribute("titleList");
		ArrayList<String> valList = new ArrayList<>();
		ArrayList<String> imgList = new ArrayList<>();
		valList.clear();
		imgList.clear();
		for(String title : titleList) {
			switch(title) {
				case "감기":
					valList.add("cold");
					imgList.add("./poster/cold.jpg"); break;
				case "미나리":
					valList.add("minari");
					imgList.add("./poster/minari.jpg"); break;
				case "비밀의 정원":
					valList.add("secretGarden");
					imgList.add("./poster/secretGarden.png"); break;
				case "베테랑":
					valList.add("veteran");
					imgList.add("./poster/veteran.png"); break;
				case "테넷":
					valList.add("tenet");
					imgList.add("./poster/tenet.jpg");
			}
		}
	%>
	<section>
		<div class="reserveStatus">
			<span>영화 선택 > </span>
			<span>날짜 선택 > 극장 선택 > 시간 선택 > 좌석 선택</span>
		</div>
		<br>
		<div class="container">
			<form action="./selectDate" method="post" accept-charset="UTF-8">
				<% for(int i = 0; i < titleList.size(); i++) { %>
					<div class="movieItem">
						<button class="movie" type="submit" name="title" value="<%=valList.get(i) %>">
							<img src="<%=imgList.get(i) %>" width="150px"; height="210px"; alt="">
						</button>
						<!--
							<span class="imgTxt">예매하기</span></div> span에 링크 적용이 안 돼 우선 패스.
						-->
						<%-- <button type="submit" class="btn btn-sm" name="title" value="<%=valList.get(i) %>"></button> --%>
					</div>
				<% } %>
			</form>
		</div>
	</section>
</body>
</html>