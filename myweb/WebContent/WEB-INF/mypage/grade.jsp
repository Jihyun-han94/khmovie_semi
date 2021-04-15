<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH무비</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">

</head>
<body>
<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
</header>
<div class="inner-wrap">
	<div class="lnb-area location-fixed">
		<%@ include file="/WEB-INF/module/mypage_lnb_nav.jsp" %>
	</div>
	
	<%
	int gradenum = (int) request.getAttribute("grade");
	int purchase = (int) request.getAttribute("purchase");
	
    String src = "";
    String grade = "";
    String nextGrade = "";
    
    if(gradenum==3){
    	grade = "플라티넘";
    	src = "/img/platinum.png";
    	nextGrade = "최고등급입니다.";
    }
    else if(gradenum==2){
    	grade = "골드";
    	src = "/img/gold.png";
    	int remain = 12-purchase;
    	nextGrade += "다음 등급까지 ";
    	nextGrade += Integer.toString(remain);
    	nextGrade += "회";
    }
    else if(gradenum==1){
    	grade = "실버";
    	src = "/img/silver.png";
    	int remain = 8-purchase;
    	nextGrade += "다음 등급까지 ";
    	nextGrade += Integer.toString(remain);
    	nextGrade += "회";
    }
    else {
    	grade = "브론즈";
    	src = "/img/bronze.png";
    	int remain = 4-purchase;
    	nextGrade += "다음 등급까지 ";
    	nextGrade += Integer.toString(remain);
    	nextGrade += "회";
    }
	
	%>
	

	<div id="contents">
	<div class="my-page-main">

		<div class="my-page-info ">
			<!-- top -->
			<div class="top">
				<div class="photo" id="myPhoto">
					<div class="wrap">
						<button type="button" class="img">
							<img src="<%=request.getContextPath() %><%=src%>">
						</button>
					</div>
				</div>

				<div class="grade">
					<p class="name">
					현재는 <%=grade%> 등급입니다. <br></p>
					<p class="text">이번 달 관람횟수 <%=purchase%>회</p>
					<p class="text"><%=nextGrade%></p>
				
					<div class="link">
						<a href="<%=request.getContextPath() %>/reserve">> 예매하러 가기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		<img src="<%=request.getContextPath() %>/img/grade.png" width="100%" height="auto">
</div>
</div>
</body>

</html>