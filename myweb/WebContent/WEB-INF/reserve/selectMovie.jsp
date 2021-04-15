<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
				 reserve.ReserveVO" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta charset="UTF-8">
<title>KH무비</title>
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reserve.css">
</head>
<style>
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
					imgList.add("./static/img/cold.jpg"); break;
				case "미나리":
					valList.add("minari");
					imgList.add("./static/img/minari.jpg"); break;
				case "비밀의 정원":
					valList.add("secretGarden");
					imgList.add("./static/img/secretGarden.png"); break;
				case "베테랑":
					valList.add("veteran");
					imgList.add("./static/img/veteran.png"); break;
				case "테넷":
					valList.add("tenet");
					imgList.add("./static/img/tenet.jpg");
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
			<form action="./selectDate" accept-charset="UTF-8">
				<% for(int i = 0; i < titleList.size(); i++) { %>
					<div class="movieItem">
						<button class="movie" type="submit" name="title" value="<%=valList.get(i) %>">
							<img src="<%=imgList.get(i) %>" width="150px"; height="210px"; alt="">
						</button>
					</div>
				<% } %>
			</form>
		</div>
	</section>
</body>
</html>