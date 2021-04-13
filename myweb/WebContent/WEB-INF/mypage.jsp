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
		<nav id="lnb">
			<ul>
				<li style="border-top: 0px solid #d8d9db;"><a href="/mypage" title="예매 내역 조회">마이페이지</a></li>
				<li><a href="<%=request.getContextPath() %>/myreserve" title="예매 내역 조회">예매 내역 조회</a></li>
                <li><a href="<%=request.getContextPath() %>/userinfo" title="개인 정보 수정">개인정보 수정</a></li>
				<li><a href="<%=request.getContextPath() %>/myreview" title="나의 리뷰 관리">나의 후기 관리</a></li>
				<li><a href="<%=request.getContextPath() %>/grade"	title="나의 등급 조회">나의 등급 조회</a></li>
			</ul>
		</nav>
	</div>


<%
                String name = (String) request.getAttribute("name");
				int gradenum = (int) request.getAttribute("grade");
                String src = "";
                String grade = "";
                
                
                if(gradenum==3){
                	grade = "플라티넘";
                	src = "/img/platinum.png";
                }
                else if(gradenum==2){
                	grade = "골드";
                	src = "/img/gold.png";
                }
                else if(gradenum==1){
                	grade = "실버";
                	src = "/img/silver.png";
                }
                else {
                	grade = "브론즈";
                	src = "/img/bronze.png";
                }
                
                String title = "영화 이름";
                String theater = "영화관 이름";
                String holddate = "2022-04-04";
                String seatnum = "I열 30번";

            %>

<div id="contents">

	<!-- my-page-main -->
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
					<%=name%> 님은 <br>
					<%=grade%> 등급입니다.
					
					</p>

					<div class="link">
						<a href="<%=request.getContextPath() %>/userinfo">> 개인정보수정</a>
						<a href="<%=request.getContextPath() %>/grade">> 나의 등급조회 </a>
					</div>
				</div>
			</div>
			<!--// top -->
		</div>
		<!--// my-magabox-info -->


		<div id="myBokd">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 예매내역</h2>

				<a href="/myreserve" class="more">더보기 <i class="iconset ico-arr-right-gray"></i></a>
			</div>

			<!-- my-reserve-history -->
			<div class="my-reserve-history">
				<ul>
					<li class="no-result">
						<table>
							<tbody>
								<tr>
									<td><%=title%></td>
									<td><%=theater%></td>
									<td><%=holddate%></td>
									<td><%=seatnum%></td>
									<td><button type="button">자세히</button></td>
								</tr>
							</tbody>
						</table>
					</li>
				</ul>
			</div>
			<!--// my-reserve-history -->
		</div>

		<div id="myBokd">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 리뷰내역</h2>

				<a href="/myreview" class="more">더보기 <i class="iconset ico-arr-right-gray"></i></a>
			</div>

			<!-- my-reserve-history -->
			<div class="my-reserve-history">
				<ul>
					<li class="no-result">
						<div class="no-history-reservation">
							리뷰 내역이 없습니다.
						</div>
					</li>
				</ul>
			</div>
			<!--// my-reserve-history -->
		</div>
	</div>
	<!--// my-page-main -->
</div>
</div>
</body>

</html>