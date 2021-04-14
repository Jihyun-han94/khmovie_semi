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

								<button type="button" class="button gray-line small ml05" name="search">
									<i class="iconset ico-search-gray"></i> 조회 
								</button>
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
                        <td>영화 제목</td>
                        <td>내용 어쩌고 저쩌고</td>
                        <td>2020-02-08 15:20</td>
                        <td><button type="button" class="button gray-line small ml05" name="edit">수정</button>
                        <button type="button" class="button gray-line small ml05" name="delete">삭제</button></td>
                    </tr>
            </tbody>
        </table>
		</div>
</div>
</div>
</body>

</html>
