<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, Register.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/register.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<%@ include file="/WEB-INF/module/register_link.jsp" %>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<section class="register">
		<form action="./register" method="post" name="register" onsubmit="retuern check()">
		<h1 class="title">회원가입</h1>
		<hr>
			<div><lable>아이디</lable> <p>4~12자의 영문 소문자와 숫자만 사용할 수 있습니다.</p></div>
			<div>
					<input type="text" placeholder="아이디를 입력해주세요." class="id-null" name="userid">
					<button type="button" class="bnt" onclick="idCheck(this.form)">중복확인</button>				
			</div>
			<div><lable>비밀번호</lable><p>10자 이상 입력해주세요.</p></div>
			<div>
				<input type="password" placeholder="비밀번호" class="pw" name="userpw1">
			</div>
			<div><lable>비밀번호 확인</lable><p>동일한 비밀번호를 입력해주세요.</p></div>
			<div>
				<input type="password" placeholder="비밀번호확인" class="pw" name="userpw2">
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
				<input type="date" placeholder="생년월일" class="brith_date" name="BrithDate">
			</div>
			<div><lable>본인확인</lable><p>핸드폰 번호를 입력해주세요.</p></div>
			<div>
				<input type="text" placeholder="핸드폰번호" name="userPhone" onKeyup="inputPhoneNumber(this);" maxlength="13" class="phone_number">
				<button class="bnt">본인인증</button>
			</div>
			<div><lable>이메일</lable><p>이메일을 입력해주세요.</p></div>
			<div>
				<input type="email" placeholder="이메일" class="email" name="userEmail">
				<button class="bnt" onclick="emailCheck()">이메일 인증</button>
			</div>
			<button class="register-bnt" type="submit">가입하기</button>
		</form>
	</section>
	<footer>
	
	</footer>
</body>
</html>