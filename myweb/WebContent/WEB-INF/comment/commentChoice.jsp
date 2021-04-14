<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "script/board.js"></script>
</head>
<style>
	body {
   		background-color: #1D2316;
    	font-family: '나눔스퀘어_ac';
	}

	section {
		width: 17%;
		height: 220px;
		margin: 70px auto 0px;
		background-color: white;
		border-radius: 5px;
		text-align: center;
	}

	#caption {
		text-align: center;
		display: inline-block;
		margin-top: 20px;
		font-size: large;
		font-weight: bold;
	}
	
	.radio {
		margin-top: 30px;
	
	label {
		color: black;
	}
</style>
<body>
	<header>
		<%-- <%@ include file="/WEB-INF/module/top_nav.jsp" @%> --%>
	</header>
	<section>
		<div id="caption">한줄평 관리</div>
		<hr>
		<form action = "BoardServlet" method = "get">
			<input type = "hidden" name = "cnum" value = "${param.cnum }">
			<div class = "form-group radio">
				<label for = "modify">수정</label>
				<input type = "radio" name = "command" value = "comment_edit_form">
				<label for = "delete">삭제</label>
				<input type = "radio" name = "command" value = "comment_delete">
			</div>
			<div class="form-group submit">
				<input type = "submit" class="btn btn-primary btn-sm" value = "확인">&nbsp;
				<input type = "button" class="btn btn-primary btn-sm" value = "취소" onclick = "cancel_ok()">
			</div>
	</form>
</section>
</body>
</html>
