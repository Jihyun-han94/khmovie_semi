<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

function check(){
	if(!document.register.userid.value){
		alert("ID�� �Է��ϼ���.");
		return false;
	}
	if(!document.register.userpw1.value){
		alert("PASSWORD�� �Է��ϼ���.");
		return false;
	}
	if(document.register.userpw1.value != document.register.userpw2.value){
		alert("PASSWORD�� �ٸ��ϴ�.");
		return false;
	}
	if(!document.register.username.value){
		alert("�̸��� �Է��ϼ���.");
		return false;
	}
	if(!document.register.BrithDate.value){
		alert("��������� �Է��ϼ���.");
		return false;
	}
	if(!document.register.userEmail.value){
		alert("�̸����� �Է��ϼ���.");
		return false;
	}
}

function idCheck(){
	if(document.register.userid.value = ""){
		alter("ID�� �Է����ּ���.");
		return;
	}
	else{
		var url = "idcheck?userid="+document.register.userid.value;
		open(url, "confirm", "toolbar=no, location=no, stat=no, scrollbars=ne, resizable=no, width=300, height=200");
	}
}
</script>