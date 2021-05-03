<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, movie.MovieVO" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/movieList.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
	<title>현재 상영작</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<section class="movie-list">
		<%
			ArrayList<String> movieList = (ArrayList<String>)request.getAttribute("titleList");
			ArrayList<String> valList = new ArrayList<>();
			ArrayList<String> imgList = new ArrayList<>();
			ArrayList<String> sliderList = new ArrayList<>();
			valList.clear();
			imgList.clear();
			sliderList.clear();
			
			for(String title : movieList) {
				switch(title) {
					case "감기":
						valList.add("cold");
						imgList.add("./static/img/cold.jpg");
						sliderList.add("./static/sliderImg/the_flu.png");
						break;
					case "미나리":
						valList.add("minari");
						imgList.add("./static/img/minari.jpg");
						sliderList.add("./static/sliderImg/the_flu.png");
						break;
					case "비밀의 정원":
						valList.add("secretGarden");
						imgList.add("./static/img/secretGarden.png");
						sliderList.add("./static/sliderImg/the_flu.png");
						break;
					case "베테랑":
						valList.add("veteran");
						imgList.add("./static/img/veteran.png");
						sliderList.add("cold");
						sliderList.add("./static/sliderImg/the_flu.png");
						break;
					case "테넷":
						valList.add("tenet");
						imgList.add("./static/img/tenet.jpg");
						sliderList.add("./static/sliderImg/the_flu.png");
				}
			}
		%>
		
		<div class="slider">
			<ul class="slides">
				<%for(int i = 0; i < movieList.size(); i++) { %>
					<li><img class="post-img" src="<%=sliderList.get(i) %>"></li>
				<%} %>
			</ul>
		</div>
		
		<div class="Screening">
			<label class="Screening">현재 상영작</label>
				<form action="./movieselect" accept-charset="UTF-8">
				<% for(int i = 0; i < movieList.size(); i++) { %>
					<div class="movie-list">
						<img class="post-img" src="<%=imgList.get(i) %>" width="150px"; height="210px";>
					</div>
				<% } %>
				</form>
				<button class="add-list">더보기 ></button>
		</div>
		
		<div class="schedule Screening">
			<label class="Screening">상영 예정작</label>
				<form action="./movieselect" accept-charset="UTF-8">
				<% for(int i = 0; i < movieList.size(); i++) { %>
					<div class="movie-list">
						<img class="post-img" src="<%=imgList.get(i) %>" width="150px"; height="210px";>
					</div>
				<% } %>
				</form>
				<button class="add-list">더보기 ></button>
		</div>
	</section>
</body>
<script type="text/javascript">
$(document).ready(function(){
	  $('.slider').slider();
});
</script>
</html>