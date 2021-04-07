<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/join.css">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
	<%@ include file="/script/join_script.jsp" %>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<section class="join">
		<form action="./register" method="post">
		<h1 class="title">회원가입</h1>
		<hr>
			<div><lable>아이디</lable> <p>4~12자의 영문 소문자와 숫자만 사용할 수 있습니다.</p></div>
			<div>
				<input type="text" placeholder="아이디를 입력해주세요." class="id" name="userid" required>
				<div class="check_font" id="check_id"></div>
				<button type="button" class="id_but" onclick="idcheck()">중복확인</button>
			</div>
			<div><lable>비밀번호</lable><p>10자 이상 입력해주세요.</p></div>
			<div>
				<input type="password" placeholder="비밀번호" class="pw" name="userpw1" required>
			</div>
			<div><lable>비밀번호 확인</lable><p>동일한 비밀번호를 입력해주세요.</p></div>
			<div>
				<input type="password" placeholder="비밀번호확인" class="pw" name="userpw2" required>
			</div>
			<div>
				<lable>이름<input type="text" placeholder="이름" class="name" name="username"></lable>
				<lable>성별
				<select class="gender" name="usergender">
				<option value="1">남자</option>
				<option value="2">여자</option>
				</select></lable>
			</div>
			<div><lable>생년월일</lable><p>생년월일을 입력해주세요.</p></div>
			<div>
				<input type="date" placeholder="생년월일" class="brith_date" name="BrithDate" required>
			</div>
			<div><lable>본인확인</lable><p>핸드폰 번호를 입력해주세요.</p></div>
			<div>
				<input type="text" placeholder="핸드폰번호" name="userPhone" onKeyup="inputPhoneNumber(this);" maxlength="13" class="phone_number">
				<button class="phone_but">본인인증</button>
			</div>
			<div><lable>이메일</lable><p>이메일을 입력해주세요.</p></div>
			<div>
				<input type="email" placeholder="이메일" class="email" name="userEmail" required>
				<button class="email_but" onclick="emailCheck()">이메일 인증</button>
			</div>
			<button class="join_but" type="submit">가입하기</button>
		</form>
	</section>
	<footer>
	
	</footer>
</body>
</html>