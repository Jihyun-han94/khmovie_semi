<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
header{ width: auto; height: 150px; }
section{
	margin:0 auto;
	background-color: white;
    border: 3px solid rgb(89, 76, 148);
	border-radius: 1rem;
	width: 500px; height: 800px;
}
p{ font-size: 10px; color: gray; margin: 5px 5px;}
h1{ margin:30px auto;
	text-align: center; }
hr{ margin: 20px; }
lable{ font-weight: bold; margin: 0 5px; }
input{
	border: 0px;
	border-bottom: 2px solid rgb(89, 76, 148);
	width: 350px; height: 30px
}
div{ margin: 10px 20px; }
button{
	margin: 0px 10px;
	padding: 5px;
	border: 2px solid rgb(89, 76, 148);
	border-radius: 5px;
	color: rgb(89, 76, 148);
	background-color: white;
}
.name , .gender{ margin: 10px; width: 100px; height: 30px;}
.brith_date { width: 150px; height: 30px; }
.phone_number , .email{ width: 200px; height: 30px; }
select{ width: 100px; }
.join_but{
	background-color: rgb(89, 76, 148);
	color: white; font-weight: bold;
	margin: 0 20px; float: right;
	padding: 10px;
	font-size: 18pt;
}
.code{ width: 100px; height: 30px;}
</style>
<body>
	<header>
	
	</header>
	<section class="join">
		<h1>회원가입</h1>
		<hr>
		<form action="./joinres" method="post">
		<div><lable>아이디</lable> <p>영문자로 입력해주세요.</p></div>
		<div>
			<form action="./join" method="post">
			<input type="text" placeholder="아이디를 입력해주세요." class="id" required>
			<button class="id_but" type="submit">중복확인</button>
			</form>
		</div>
		<div><lable>비밀번호</lable><p>10자 이상 입력해주세요.</p></div>
		<div>
			<input type="text" placeholder="비밀번호" class="pw" required>
		</div>
		<div><lable>비밀번호 확인</lable><p>동일한 비밀번호를 입력해주세요.</p></div>
		<div>
			<input type="text" placeholder="비밀번호확인" class="pw" required>
		</div>
		<div>
			<lable>이름<input type="text" placeholder="이름" class="name"></lable>
			<lable>성별
			<select class="gender">
			<option value="gender_m">남자</option>
			<option value="gender_w">여자</option>
			</select></lable>
		</div>
		<div><lable>생년월일</lable><p>생년월일을 입력해주세요.</p></div>
		<div>
			<input type="date" placeholder="생년월일" class="brith_date" required>
		</div>
		<div><lable>본인확인</lable><p>핸드폰 번호를 입력해주세요.</p></div>
		<div>
			<form action="./join">
				<input type="text" placeholder="핸드폰번호" onKeyup="inputPhoneNumber(this);" maxlength="13" class="phone_number">
				<button class="phone_but" type="submit">본인인증</button>
			</form>
		</div>
		<div><lable>이메일</lable><p>이메일을 입력해주세요.</p></div>
		<div>
			<form action="./join" method="post">
			<input type="email" placeholder="이메일" class="email" required>
			<button class="email_but">이메일 인증</button>
			</form>
		</div>
		<button class="join_but" type="submit">가입하기</button>
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
</script>
</html>