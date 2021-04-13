<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script type="text/javascript" src= "script/board.js"></script>
</head>
<body>
<h1>한줄평 수정</h1>
${mVo.cid }<br><br>
<form action = "BoardServlet" method = "get" name = "check">
	<input type = "hidden" name = "command" value = "comment_edit">
	<input type = "hidden" name = "cnum" value = "${param.cnum }">
	<textarea rows="10" cols="30" name = "c_content">${mVo.ccontent }</textarea>
	<input type = "submit" value = "수정" onclick = "return com_check()">
</form>
</body>
</html>