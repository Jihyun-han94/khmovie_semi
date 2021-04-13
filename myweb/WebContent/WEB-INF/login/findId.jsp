<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/main.css">
	<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/find.css">
	<%@ include file="/WEB-INF/module/css_js.jsp" %>
<title>아이디 찾기</title>
</head>
<body>
	<header>
		<%@ include file="/WEB-INF/module/top_nav.jsp" %>
	</header>
	<section class="find">
		<h3>아이디 찾기</h3>
		<hr>
		<form action="./findid/res" method="post" name="findid" onsubmit="return check()">
			<label class="find-label">회원 정보에 등록한 휴대전화로 인증</label>
			<div class="info">
				<span class="info-name">이  름</span>
				<input class="userinfo" type="text" name="userName">
			</div>
			<div class="info">
				<span class="info-phone">핸드폰 번호</span>
				<input class="userinfo" type="text" name="userPhone" maxlength="13" class="phone_number"
				oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
				placeholder="예) 010-1234-5678" onKeyup="inputPhoneNumber(this)">
				<input type="button" class="send-bnt" onclick="PhoneCheck()" value="인증번호 전송">
			</div>
			<div class="info">
				<span class="info-numkey">인증 번호</span>
				<input class="userinfo" type="text" name="numkey" maxlength="5" class="numkey"
				oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
				<input type="button" class="send-bnt" onclick="keyCheck()" value="인증번호 확인">
			</div>
			<p class="ps">인증번호 전송 어려움으로 alert로 대체 구현.</p>
			<div class="info-check">
				<button class="find-bnt">아이디 찾기</button>
			</div>
		</form>
	</section>
</body>
<script>
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

var numkey;

function check(){
	if(!document.findid.userName.value){
		alert("이름를 입력하세요.");
		return false;
	}
	if(!document.findid.userPhone.value){
		alert("핸드폰 번호를 입력하세요.");
		return false;
	}
	if(!document.findid.numkey.value){
		alert("인증번호를 입력해주세요.");
		return false;
	}
	if(document.findid.numkey.value != numkey){
		alert("인증번호가 일치하지 않습니다.");
		return false;
	}
}

function PhoneCheck(){
	$.ajax({
		url: "<%=request.getContextPath() %>/login/findid",
		type: "post",
		datatype: "json",
		data: {
			phone: document.findid.userPhone.value
		},
		success: function(data){
			if(data.result === "fail"){
				alert("실패");
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
	if(document.findid.numkey.value != numkey){
		alert("인증번호가 일치하지 않습니다.");
	}
	else{
		alert("인증번호가 일치합니다.");
	}
}
</script>
</html>