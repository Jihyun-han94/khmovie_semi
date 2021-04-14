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
		<h2 class="tit">예매/구매 내역</h2>
		
		<!-- 예매내역 -->
		<div id="myBokdArea">

			<!-- 예매 조회 조건 -->
			<div class="board-list-search mt20">
				<table>
					<colgroup>
						<col style="width:75px;"/>
						<col />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">날짜별 </th>
							<td>
								<select name="selYM" class="selectpicker small">
										<option value="202104">2021년 4월</option>
										<option value="202103">2021년 3월</option>
										<option value="202102">2021년 2월</option>
										<option value="202101">2021년 1월</option>
										<option value="202012">2020년 12월</option>
										<option value="202011">2020년 11월</option>
										<option value="202010">2020년 10월</option>
										<option value="202009">2020년 9월</option>
										<option value="202008">2020년 8월</option>
										<option value="202007">2020년 7월</option>
								</select>

								<button type="button" class="button search" name="search"> 조회 
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<table class="table table-hover">
            <thead>
                <tr>
                	<th>예매 번호</th>
                    <th>작품 제목</th>
                    <th>상영관</th>
                    <th>관람일시</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
           
                    <tr>
                        <td>123-456-789</td>
                        <td>영화 제목</td>
                        <td>상영관 위치</td>
                        <td>2020-02-08 15:20</td>
                        <td><button type="button" class="button small" name="more">자세히</button></td>
                    </tr>
            </tbody>
        </table>
	</div>
</div>
</div>
</body>

</html>