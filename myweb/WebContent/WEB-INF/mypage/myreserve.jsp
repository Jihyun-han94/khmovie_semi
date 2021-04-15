<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/mypage.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">

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
								<select name="select" onchange="getRList(this)">
										<option value="날짜선택">날짜선택</option>
										<option value="2104">2021년 4월</option>
										<option value="2103">2021년 3월</option>
										<option value="2102">2021년 2월</option>
										<option value="2101">2021년 1월</option>
										<option value="2012">2020년 12월</option>
										<option value="2011">2020년 11월</option>
										<option value="2010">2020년 10월</option>
										<option value="2009">2020년 9월</option>
										<option value="2008">2020년 8월</option>
										<option value="2007">2020년 7월</option>
								</select>
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
                    <th>좌석번호</th>
                </tr>
            </thead>
            <tbody id="tbody">
            </tbody>
        </table>
	</div>
</div>
</div>
</body>
<script>
	function getRList(element) {
		$("#tbody").empty();

		$.ajax({
			url: "<%=request.getContextPath() %>/getRList",
			type: "get",
			datatype: "json",
			data: {
				date: $(element).val()
			},
			success: function(data) {
				let length = Object.keys(data).length;
				let html = "";
				
				$.each(data, function() {
					html += "<tr>";
					html += "<td>" + this.ticketID + "</td>";
					html += "<td>" + this.title + "</td>";
					html += "<td>" + this.theaterName + "</td>";
					html += "<td>" + this.holdDate + " " + this.time_schedule + "</td>";
					html += "<td>" + this.seatNum + "</td>";
					html += "</tr>";
					
					$("#tbody").empty();
					$("#tbody").append(html);
				});
			}
		});
	}
</script>
</html>