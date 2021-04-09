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
</head>
<body>
	<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	<section class="register">
		<form action="./register/res" method="post" name="register" onsubmit="return check()">
		<h1 class="title">회원가입</h1>
		<hr class="register">
			<div class="register"><label>아이디</label><p>4~12자 사용할 수 있습니다.</p></div>
			<div class="register">
				<input type="text" placeholder="아이디를 입력해주세요." id="userid" name="userid">
				<button type="button" class="bnt" id="idcheck" onClick="idCheck()">중복확인</button>				
			</div>
			<div class="register"><label>비밀번호</label><p class="pw1-basic">10자 이상 입력해주세요.</p></div>
			<div class="register">
				<input type="password" placeholder="비밀번호" class="pw1" name="userpw1" id="pw1"
				onchange="pwCheck(this, document.getElementById('pw2'))">
			</div>
			<div class="register"><label>비밀번호 확인</label><p class="pw2-basic">동일한 비밀번호를 입력해주세요.</p></div>
			<div class="register">
				<input type="password" placeholder="비밀번호확인" class="pw2" name="userpw2" id="pw2"
				onchange="pwCheck(document.getElementById('pw1'),this)">
			</div>
			<div class="register">
				<label>이름<input type="text" placeholder="이름" class="name" name="username" ></label>
				<label>성별
				<select class="gender" name="usergender">
				<option value="1">남자</option>
				<option value="2">여자</option>
				</select></label>
			</div class="register">
			<div class="register"><label>생년월일</label><p>생년월일을 입력해주세요.</p></div>
			<div class="register">
				<input type="date" placeholder="생년월일" class="brith_date" name="BrithDate">
			</div>
			<div class="register"><label>본인확인</label><p>핸드폰 번호를 입력해주세요.</p></div>
			<div class="register">
				<input type="text" placeholder="핸드폰번호" name="userPhone" onKeyup="inputPhoneNumber(this);" maxlength="13" class="phone_number">
				<button class="bnt">본인인증</button>
			</div>
			<div class="register"><label>이메일</label><p>이메일을 입력해주세요.</p></div>
			<div class="register">
				<input type="email" placeholder="이메일" class="email" name="userEmail">
				<button class="bnt" onclick="emailCheck()">이메일 인증</button>
			</div class="register">
			<button class="register-bnt">가입하기</button>
		</form>
	</section>
	<footer>
	
	</footer>
</body>
<script type="text/javascript">
function inputPhoneNumber(obj) {
    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

function check(){
	if(!document.register.userid.value){
		alert("ID를 입력하세요.");
		return false;
	}
	if(!document.register.userpw1.value){
		alert("PASSWORD를 입력하세요.");
		return false;
	}
	if(document.register.userpw1.length > 10){
		if(document.register.userpw1.value != document.register.userpw2.value){
			alert("PASSWORD가 다릅니다.");
			return false;
		}
	}
	if(!document.register.username.value){
		alert("이름을 입력하세요.");
		return false;
	}
	if(!document.register.BrithDate.value){
		alert("생년월일을 입력하세요.");
		return false;
	}
	if(!document.register.userEmail.value){
		alert("이메일을 입력하세요.");
		return false;
	}
}

function idCheck(){
	$.ajax({
		url: "<%=request.getContextPath() %>/register/idcheck",
		type: "post",
		datatype: "json",
		data: {
			userid: document.register.userid.value
		},
		success: function(data){
			alert(data.Idres);
		}
	});
}
</script>
</html>