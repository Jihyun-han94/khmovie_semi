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
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<section class="register">
		<form action="./register/res" method="post" name="register" onsubmit="return (check() && sendSms())">
		<h1 class="title">회원가입</h1>
		<hr class="register">
			<div class="register"><label>아이디<p>4~12자의 영소문자, 숫자를 혼합하여 사용할 수 있습니다.</p></label>
			<p id="id-check" class="id-check" ></p>
			</div>
			<div class="register">
				<input type="text" placeholder="아이디를 입력해주세요." id="userid" name="userid" onkeyup="idConfirm()">
				<button type="button" class="bnt" id="idcheck" onClick="idCheck()">중복확인</button>				
			</div>
			<div class="register"><label>비밀번호<p class="pw-check" >비밀번호는 6글자~16글자의 영문, 숫자, 특수문자를 혼합하여 사용할 수 있습니다.</p></label>
			<p id="pw1-check" class="pw-check" ></p></div>
			<div class="register">
				<input type = "password" id = "pass1" class="pw1" name="userpw1"
                onkeyup="passwordCheck()">
			</div>
			<div class="register"><label>비밀번호 확인<p id="pw2-check" class="pw-check" ></p></label></div>
			<div class="register">
				<input type = "password" id="pass2" class="pw2" name="userpw2"
                onkeyup="passwordCheck()">
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
			<div class="register"><label>핸드폰번호</label><p id="phone-check">핸드폰 번호를 입력해주세요.</p></div>
			<div class="register">
				<input type="text" placeholder="핸드폰번호" name="userPhone" maxlength="11" class="phone_number"
				oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
			</div>
			<div class="register"><label>이메일</label><p>이메일을 입력해주세요.</p></div>
			<div class="register">
				<input type="email" placeholder="이메일" class="email" name="userEmail">
			</div>
			<button class="register-bnt">가입하기</button>
		</form>
	</section>
	<footer>
	
	</footer>
</body>
<script type="text/javascript">

function check(){
	if(!document.register.userid.value){
		alert("ID를 입력하세요.");
		return false;
	}
	if(!document.register.userpw1.value){
		alert("PASSWORD를 입력하세요.");
		return false;
	}
	if(!document.register.userpw2.value){
		alert("PASSWORD를 입력하세요.");
		return false;
	}
	if(!document.register.username.value){
		alert("이름을 입력하세요.");
		return false;
	}
	if(!document.register.BrithDate.value){
		alert("생년월일을 입력하세요.");
		return false;
	}
	if(!document.register.userPhone.value){
		alert("핸드폰번호를 입력하세요.");
		return false;
	}
	
	if(!document.register.userEmail.value){
		alert("이메일을 입력하세요.");
		return false;
	}
}

function idConfirm(){
	var id = document.getElementById('userid').value;
	
    if (id.length < 4 || id.length > 12) {
    	document.getElementById('id-check').innerHTML='4글자이상 12글자 이하로 입력해주세요.';
        document.getElementById('id-check').style.color='red';
        return false;
    } else {
    	if(!/(?=.*\d)(?=.*[a-z]).{4,12}/.test(id)){
    		document.getElementById('id-check').innerHTML='숫자와 영문자를 혼합하여 입력해주세요.';
            document.getElementById('id-check').style.color='red';
            return false;
   		}
    	else{
    		document.getElementById('id-check').innerHTML='아이디 중복 확인을 해주세요.';
            document.getElementById('id-check').style.color='green';
            return false;
    	}
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
			if(data.result === "success"){
				document.getElementById('id-check').innerHTML='사용 가능한 아이디입니다.';
	            document.getElementById('id-check').style.color='green';
				return true;
			}
			else if(data.result === "fail"){
				document.getElementById('id-check').innerHTML='사용 불가능한 아이디입니다.';
	            document.getElementById('id-check').style.color='red';
				return false;
			}
		}
	});
	
}

function passwordCheck(){
	var pw = document.getElementById('pass1').value;
    var confirmPW = document.getElementById('pass2').value;
    
    var num = pw.search(/[0-9]/g);
    var eng = pw.search(/[a-z]/ig);
    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
    if (pw.length < 6 || pw.length > 16) {
    	document.getElementById('pw1-check').innerHTML='6글자이상 16글자 이하로 입력해주세요.';
        document.getElementById('pw1-check').style.color='red';
        return false;
    } else {
        if(pw.search(/\s/) != -1){
        	document.getElementById('pw1-check').innerHTML='공백없이 입력해주세요.';
            document.getElementById('pw1-check').style.color='red';
            return false;
        }
        else if(num < 0 || eng < 0 || spe < 0){
        	document.getElementById('pw1-check').innerHTML='영문, 숫자, 특수문자를 혼합하여 입력해주세요.';
            document.getElementById('pw1-check').style.color='red';
            return false;
        }
        else {
        	document.getElementById('pw1-check').innerHTML='사용가능한 비밀번호 입니다.';
            document.getElementById('pw1-check').style.color='green';
        	if(pw !='' && confirmPW !='') {
                if(pw == confirmPW) {
                    document.getElementById('pw2-check').innerHTML='비밀번호가 일치합니다.';
                    document.getElementById('pw2-check').style.color='green';
                    return true;
                }
                else {
                    document.getElementById('pw2-check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('pw2-check').style.color='red';
                    return false;
                }
            }
        }
    }
    
}

</script>
</html>