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
                
                String ticketid = (String) request.getAttribute("ticketid");
                String title = (String) request.getAttribute("title");
                String theater = (String) request.getAttribute("theater");
                String holddate = (String) request.getAttribute("holddate");
                String seatnum = (String) request.getAttribute("seatnum");
                
                if(ticketid == null){
                	ticketid = "예매 내역이 없습니다.";
                	title = "";
                	theater = "";
                	holddate ="";
                	seatnum = "";
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


		<div id="myBokd">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 예매내역</h2>

				<a href="/myreserve" class="more">더보기 ></a>
			</div>

			<div class="my-reserve-history">
				<ul>
					<li>
						<table>
							<tbody>
								<tr>
									<td><%=ticketid%></td>
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
		</div>

		<div id="myBokd">
			<div class="tit-util mt70">
				<h2 class="tit small">나의 리뷰내역</h2>

				<a href="/myreview" class="more">더보기 ></a>
			</div>

			<div class="my-reserve-history">
				<ul>
					<li>
						<div>
							리뷰 내역이 없습니다.
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
</body>

</html>