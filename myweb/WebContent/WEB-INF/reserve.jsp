<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
				 reserve.ReserveVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" type="text/css" href="./WEB-INF/custom_css/custom.css">-->
<!-- <script src="./WEB-INF/custom_js/custom.js"></script> -->
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
	src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
</head>
<style>
    .grid-layout {
        display: grid;
        column-gap: 5px; row-gap: 5px;
        grid-template-areas:
            "o s t f";
    }
	.grid-first {
	    padding: 6px;
	    border: 1px solid black;
	    grid-area: o;
	}
	.grid-second {
	    padding: 6px;
	    border: 1px solid black;
	    grid-area: s;
	}
	.grid-third {
	    padding: 6px;
	    border: 1px solid black;
	    grid-area: t;
	}
	.grid-fourth {
	    padding: 6px;
	    border: 1px solid black;
	    grid-area: f;
	}
	.category {
		background: black;
		color: lightgray;
		text-align: center;
	}
	.common_btn {
		cursor: pointer;
		border: none;
	}
	.common_btn:hover {
		color: skyblue;
	}
	.reg, .date, .time {
		display: none;
	}
	.seoul {
		cursor: pointer;
		font-weight: bold;
	}
	.seoul_detail {
		display: none;
	}
	#seoul_detail {
		list-style: none;
	}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<% ArrayList<ReserveVO> pieceArr = (ArrayList<ReserveVO>)request.getAttribute("pieces"); %>
	<section>
       <div class="grid-layout">
           <section class="grid-first">
				<p class="category">영화</p>
           		<div>
           			<% for(ReserveVO piece : pieceArr) { %>
           				<button class="form-control common_btn piece_detail"><%=piece.getTitle() %></li>
           			<% } %>
           		</div>
           </section>
           <section class="grid-second">
           		<p class="category">극장</p>
           		<div class="reg">
           			<button class="form-control common_btn reg_detail">강남</button>
           			<button class="form-control common_btn reg_detail">건대</button>
           		</div>
           </section>
           <section class="grid-third">
                <p class="category">날짜</p>
        		<div class="date">
        		  	<% for(ReserveVO piece : pieceArr) { %>
           				<button class="form-control common_btn date_detail"><%=piece.getStart_date() %></li>
           			<% } %>
           		</div>
           </section>
           <section class="grid-fourth">
				<p class="category">시간</p>
				<div class="time">
      				<button class="form-control common_btn time_detail">10:00</button>
      				<button class="form-control common_btn time_detail">13:00</button>
      				<button class="form-control common_btn time_detail">15:00</button>
      				<button class="form-control common_btn time_detail">17:00</button>
      				<button class="form-control common_btn time_detail">20:00</button>
           		</div>
           </section>
       </div>
	</section>
<!-- 	
	<h6>상영중인 극장</h6>
	<div>
		<table>
			<tr>
				<td><button type="button" class="btn btn-light btn-sm seoul">서울(25)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>인천(8)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>경기(50)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>대전(6)</button></td>
			</tr>
			<tr>
				<td><button type="button" class="btn btn-light btn-sm" disabled>충청(15)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>강원(4)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>광주(7)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>전라(14)</button></td>
			</tr>
			<tr>
				<td><button type="button" class="btn btn-light btn-sm" disabled>부산(11)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>대구(7)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>경상(20)</button></td>
				<td><button type="button" class="btn btn-light btn-sm" disabled>제주(2)</button></td>
			</tr>
		</table>
	</div>
	<div class="seoul_detail">
		<table>
			<tr>
				<td><button type="button" class="btn btn-sm">강남</button></td>
				<td><button type="button" class="btn btn-sm">압구정</button></td>
				<td><button type="button" class="btn btn-sm">송파</button></td>
				<td><button type="button" class="btn btn-sm">천호</button></td>
				<td><button type="button" class="btn btn-sm">미아</button></td>	
			</tr>
			<tr>
				<td><button type="button" class="btn btn-sm">수유</button></td>
				<td><button type="button" class="btn btn-sm">등촌</button></td>
				<td><button type="button" class="btn btn-sm">강변</button></td>
				<td><button type="button" class="btn btn-sm">건대입구</button></td>
				<td><button type="button" class="btn btn-sm">구로</button></td>			
			</tr>
			<tr>
				<td><button type="button" class="btn btn-sm">중계</button></td>
				<td><button type="button" class="btn btn-sm">하계</button></td>
				<td><button type="button" class="btn btn-sm">홍대</button></td>
				<td><button type="button" class="btn btn-sm">신촌아트레온x미래소년</button></td>
				<td><button type="button" class="btn btn-sm">왕십리</button></td>			
			</tr>
			<tr>
				<td><button type="button" class="btn btn-sm">성신여대입구</button></td>
				<td><button type="button" class="btn btn-sm">목동</button></td>
				<td><button type="button" class="btn btn-sm">여의도</button></td>
				<td><button type="button" class="btn btn-sm">영등포</button></td>
				<td><button type="button" class="btn btn-sm">용산아이파크몰</button></td>			
			</tr>
			<tr>
				<td><button type="button" class="btn btn-sm">불광</button></td>
				<td><button type="button" class="btn btn-sm">피카디리1958</button></td>
				<td><button type="button" class="btn btn-sm">동대문</button></td>
				<td><button type="button" class="btn btn-sm">명동</button></td>
				<td><button type="button" class="btn btn-sm">상봉</button></td>			
			</tr>
		</table>
	</div>
-->
</body>
<script>
	$('.piece_detail').click(function() {
		if($('.time').css("display") == "block") {
			$('.time').css("display", "none");
			$('.date').css("display", "none");
			$('.reg').css("display", "none");
		} else if ($('.date').css("display", "block")){
			$('.date').css("display", "none");
			$('.reg').css("display", "none");
		} else if ($('.reg').css("display", "block")) {
			$('.reg').css("display", "none");
		}
		$('.reg').css("display", "block");
	})

	$('.reg_detail').click(function() {
		if($('.date').css("display") == "none") {
			$('.date').css("display", "block");
		}
	})

	$('.date_detail').click(function() {
		if($('.time').css("display") == "none") {
			$('.time').css("display", "block");
		}
	})
	
	//$('.seoul').click(function() {  
	//   if($('.seoul_detail').css("display") == "none"){   
	//       $('.seoul_detail').css("display", "inline-block");
	//    }
	//});    
	    //else {  
	    //    jQuery('.l_detail').hide();  
	    //}
</script>
</html>