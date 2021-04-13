<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList,Member.MemberVO" %>
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
		<form action="./register/res" method="post" name="register" onsubmit="return check()">
		<h1 class="title">회원가입</h1>
		<hr class="register">
			<div class="register"><label>아이디<p>4~12자의 영소문자, 숫자만 사용할 수 있습니다.</p></label>
			<p id="id-check" class="id-check" ></p>
			</div>
			<div class="register">
				<input type="text" placeholder="아이디를 입력해주세요." id="userid" name="userid" onkeyup="idConfirm()" maxlength="12">
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
				<input type = "password" id="pass2" class="pw2" name="userpw2" onkeyup="passwordCheck()" maxlength="16">
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
			<div class="register"><label>핸드폰번호 인증</label><p id="phone-check" class="phone-check" ></p></div>
			<div class="register">
				<input type="text" name="userPhone" class="phone_number"
				oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="13" placeholder="예) 010-1234-5678"
				onKeyup="inputPhoneNumber(this)">
				<input type="button" class="send-bnt" onclick="PhoneCheck()" value="인증번호 전송">
			</div>
			<div class="register"><label>인증번호</label></div>
			<div class="register">
				<input class="phone_number" type="text" placeholder="인증번호를 입력해주세요." name="numkey" maxlength="5" class="numkey"
				oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				<input type="button" class="send-bnt" onclick="keyCheck()" value="인증번호 확인">
			</div>
			<p class="ps">인증번호 전송 어려움으로 alert로 대체 구현.</p>
			<div class="register"><label>이메일</label>
				<button class="register">가입하기</button>
				<p>이메일을 입력해주세요.</p>
			</div>
			<div class="register">
				<input type="email" placeholder="ex)abc@gmail.com" id="email"class="email" name="userEmail")>
			</div>
		</form>
	</section>
	<footer>
	
	</footer>
</body>
<script type="text/javascript">
var numkey;
function idConfirm(){
	var id = document.getElementById('userid').value;
	
    if (id.length < 4 || id.length > 12) {
    	document.getElementById('id-check').innerHTML='4글자이상 12글자 이하로 입력해주세요.';
        document.getElementById('id-check').style.color='red';
        return false;
    } else {
    	if(!/(?=.*\d)(?=.*[a-z]).{4,12}/.test(id)){
    		document.getElementById('id-check').innerHTML='숫자와 영소문자만 입력해주세요.';
            document.getElementById('id-check').style.color='red';
            return false;
   		}
    	else {
    		document.getElementById('id-check').innerHTML='아이디 중복 확인을 해주세요.';
            document.getElementById('id-check').style.color='green';
            return true;
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
    } else if(number.length < 14){
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    
    obj.value = phone;
}
function PhoneCheck(){
	$.ajax({
		url: "<%=request.getContextPath() %>/phone/code/check",
		type: "post",
		datatype: "json",
		data: {
			phone: document.register.userPhone.value
		},
		success: function(data){
			if(data.result === "fail"){
				alert("유효하지 않은 전화번호 입니다.");
				return false;
			}
			else {
				alert(data.result);
				numkey = data.result;
				return numkey;
			}
		}
	});
}
function keyCheck(){
	if(document.register.numkey.value != numkey){
		alert("인증번호가 일치하지 않습니다.");
		return false;
	}
	else{
		alert("인증번호가 일치합니다.");
		return true;
	}
}
function CheckEmail(str){                                                 
     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
     if(!reg_email.test(str)) {                            
          return false;
     }                            
     else {                       
          return true;         
     }                            
}
function check(){
	
	var onId = document.register.userid;
	if(!onId.value){
		alert("ID를 입력하세요.");
		onId.focus();
		return false;
	}
	if(!onId.length > 3 && !onId.length < 13){
		alert("ID 길이가 적절하지 않습니다.");
		onId.focus();
		return false;
	}else{
		if(idConfirm() == false){
			alert("ID 중복을 확인해주세요!");
			onId.focus();
			return false;
		}
	}
	
	var password = document.register.userpw1;
	if(!document.register.userpw1.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if(!document.register.userpw1.length > 5){
		alert("비밀번호의 길이가 적절하지 않습니다.");
		return false;
	}
	if(!document.register.userpw2.value){
		alert("비밀번호를 입력하세요.");
		return false;
	}else{
		if(!passwordCheck()){
			alert("비밀번호를 확인해주세요!");
			password.focus();
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
	
	var phone_number = document.register.userPhone;
	if(!phone_number.value){
		alert("핸드폰번호를 입력하세요.");
		return false;
	}
	if(!phone_number.length > 12){
		alert("유효하지 않은 핸드폰 번호입니다.");
		return false;
	}
	
	var obEmail = document.register.userEmail;
	if (!obEmail.value) {
		alert("이메일을 입력하세요!");
		obEmail.focus();	
		return false;
	}
	else {
		if(!CheckEmail(obEmail.value))	{
			alert("이메일 형식이 잘못되었습니다");
			obEmail.focus();
			return false;
		}                
	}
	
	var keycode = document.register.numkey;
	if(!keycode.value){
		alert("인증번호를 입력해주세요.");
		return false;
	}
	if(keycode.value != numkey){
		alert("인증번호가 일치하지 않습니다.");
		return false;
	}
}
</script>
</html>