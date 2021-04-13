<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>

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

	<div id="contents">
		<!-- my-page-main -->
	<div class="my-page-main">

		<div class="my-page-info ">
			<!-- top -->
			<div class="top">
				<div class="photo" id="myPhoto">
					<div class="wrap">
						<button type="button" class="img">
							<img src="">
						</button>
					</div>
				</div>

				<div class="grade">
					<p class="name">
					현재 등급은 브론즈 등급입니다. <br>
					다음 등급까지 남은 관랍횟수는 2회입니다.
					</p>

					<div class="link">
						<a href="<%=request.getContextPath() %>/userinfo">> 예매하러 가기</a>
					</div>
				</div>
			</div>
			<!--// top -->
		</div>
	</div>
	
		<img src="<%=request.getContextPath() %>/img/grade.png" width="100%" height="auto">
</div>
</div>
</body>

</html>