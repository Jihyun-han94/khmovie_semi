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
								<select name="selYM" class="selectpicker small" onchange="getRList(this)">
										<option value="4/21">2021년 4월</option>
										<option value="3-21">2021년 3월</option>
										<option value="2-21">2021년 2월</option>
										<option value="1-21">2021년 1월</option>
										<option value="12-20">2020년 12월</option>
										<option value="11-20">2020년 11월</option>
										<option value="10-20">2020년 10월</option>
										<option value="9-20">2020년 9월</option>
										<option value="8-20">2020년 8월</option>
										<option value="7-20">2020년 7월</option>
								</select>

								<button type="button" class="button search" name="search">조회 </button>
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
            <tbody id="tbody">
           <!-- 
                    <tr>
                        <td>123-456-789</td>
                        <td>영화 제목</td>
                        <td>상영관 위치</td>
                        <td>2020-02-08 15:20</td>
                        <td><button type="button" class="button small" name="more">자세히</button></td>
                    </tr>
            -->
            </tbody>
        </table>
	</div>
</div>
</div>
</body>
<script>
	function getRList(element) {
		$.ajax({
			url: "<%=request.getContextPath() %>/getRList",
			type: "get",
			datatype: "json",
			data: {
				date: $(element).val()
			},
			success: function(data) {
				let reserve = data.reserve;
				let length = Object.keys(reserve).length;
				
				let html = "";
				let arr = new Array(); 
				for(let i = 0; i < length; i++) {
					arr.push(reserve[i]);
				}
				console.log('성공');
				
				for(let j = 0; j < arr.length; j++) {
					for(key in arr) {
						html += "<tr>";
						html += "<td>" + arr[key].ticketID + "</td>";
						html += "<td>" + arr[key].title + "</td>";
						html += "<td>" + arr[key].theaterName + "</td>";
						html += "<td>" + arr[key].holdDate + "</td>";
						html += "<td>" + arr[key].time_schedule + "</td>";
						html += "<td>" + arr[key].seatNum + "</td>";
						html += "<td>" + arr[key].user_id + "</td>";
						html += "</tr>";
						
						$("#tbody").empty();
						$("#tbody").append(html);
					}
				}
			}
		});
	}
</script>
</html>