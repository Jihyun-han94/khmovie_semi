<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "script/board.js"></script>
</head>
<body>
<h1>댓글 관리</h1>
<form action = "BoardServlet" method = "get">
<input type = "hidden" name = "cnum" value = "${param.cnum }">
수정<input type = "radio" name = "command" value = "comment_edit_form">
삭제<input type = "radio" name = "command" value = "comment_delete">
<br><br>
<input type = "submit" value = "확인">
<input type = "button" value = "취소" onclick = "cancel_ok()">

</form>
</body>
</html>