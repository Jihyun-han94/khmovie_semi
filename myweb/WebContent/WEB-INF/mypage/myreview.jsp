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

	<div id="contents">
		<h2 class="tit">나의 리뷰 관리</h2>
	
		<div id="myReviewArea" class="tab-cont">

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

							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<table class="table table-hover">
            <thead>
                <tr>
                	<th>작품 제목</th>
                    <th>내용</th>
                    <th>작성 일시</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
           
                    <tr>
                        <td>리뷰가 없습니다.</td>
                        <td></td>
                        <td></td>
                        <!--  <td><button type="button" class="button small" name="edit">수정</button>-->
                        <!-- <button type="button" class="button small" style="background-color: #FF5252" name="delete">삭제</button></td>-->
                    </tr>
            </tbody>
        </table>
		</div>
</div>
</div>
</body>

</html>