<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList,
				 java.util.Collection,
				 java.util.Arrays" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH무비</title>
<%@ include file="/WEB-INF/module/css_js.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/reserve.css">
</head>
<style>
	div.reserveStatus>span:first-child {
		font-size: small;
		color: rgb(157, 157, 157);
	}
	
	div.reserveStatus>span:last-child {
		font-size: large;
		color: skyblue;
	}
	
	#screen {
		display: block;
		background-color: #1D2316;
		color: rgb(109, 109, 109);
		border: 1px solid rgb(109, 109, 109);
		border-radius: 3px;
		width: 300px;
		height: 30px;
		font-size: large;
		text-align: center;
	}
	
	#submit {
		display: block;
		margin-top: 20px;
		margin-left: 223px;
	}
	
	.ckbox {
		margin-left: 100px;
	}
	
	.seatLine {
		color: rgb(109, 109, 109);
		font-size: x-small;
	}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<%
		ArrayList<String> seatNumList = (ArrayList<String>)request.getAttribute("seatNumList");
	%>
	<section>
		<div class="reserveStatus">
			<span>영화 선택 > 날짜 선택 > 극장 선택 > 시간 선택 ></span><span> 좌석 선택</span>
		</div>
		<br>
		<div class="container">
			<span id="screen">screen</span>
			<br>
			<form action="./complete" method="post" accept-charset="UTF-8">
				<div class="ckbox">
				<%
				   ArrayList<String> seatNumA = new ArrayList<>();
				   ArrayList<String> seatNumB = new ArrayList<>();
				   ArrayList<String> seatNumC = new ArrayList<>();
				   ArrayList<String> seatNumD = new ArrayList<>();
				   
				   for(String seatNum : seatNumList) {
						if(seatNum.indexOf('A') == 0) {
							seatNumA.add(seatNum);
						} else if(seatNum.indexOf('B') == 0) { 
							seatNumB.add(seatNum);
						} else if(seatNum.indexOf('C') == 0) { 
							seatNumC.add(seatNum);
				 		} else {
				 			seatNumD.add(seatNum);
				 		}
				   }

				   String[] seatArrA = {"A-1", "A-2", "A-3", "A-4"};
				   String[] seatArrB = {"B-1", "B-2", "B-3", "B-4"};
				   String[] seatArrC = {"C-1", "C-2", "C-3", "C-4"};
				   String[] seatArrD = {"D-1", "D-2", "D-3", "D-4"};
				%>
				  
				  <span class="seatLine">A열</span> 
				<%
				   for(int i = 0; i < seatArrA.length; i++) {
					   if(seatNumList.contains(seatArrA[i])) {
				%>
						   <input type="checkbox" name="seatNum" value="<%=seatArrA[i] %>">
				<%	   } else { %>
						   <input type="checkbox" name="seatNum" value="<%=seatArrA[i] %>" disabled>
				<%
					   }
				   }
				%>
					<br>
					<span class="seatLine">B열</span>
				<%			   
				   for(int i = 0; i < seatArrB.length; i++) {
					   if(seatNumList.contains(seatArrB[i])) {
				%>
						   <input type="checkbox" name="seatNum" value="<%=seatArrB[i] %>">
				<%	   } else { %>
						   <input type="checkbox" name="seatNum" value="<%=seatArrB[i] %>" disabled>
				<%
				       }
				   }
				%>
					<br>
					<span class="seatLine">C열</span>
				<%
				   for(int i = 0; i < seatArrC.length; i++) {
					   if(seatNumList.contains(seatArrC[i])) {
				%>
						   <input type="checkbox" name="seatNum" value="<%=seatArrC[i] %>">
				<%	   } else { %>
						   <input type="checkbox" name="seatNum" value="<%=seatArrC[i] %>" disabled>
				<%
					   }
				   }
				%>
					<br>
					<span class="seatLine">D열</span>
				<%
				   for(int i = 0; i < seatArrD.length; i++) {
					   if(seatNumList.contains(seatArrD[i])) {
				%>
						   <input type="checkbox" name="seatNum" value="<%=seatArrD[i] %>">
				<%	   } else { %>
						   <input type="checkbox" name="seatNum" value="<%=seatArrD[i] %>" disabled>
				<%
					   }
				   }
				%>
				</div>
				<br>
				<button id="submit" type="submit" class="btn btn-outline-light btn-sm">예매하기</button>
			</form>
		</div>
	</section>
</body>
</html>