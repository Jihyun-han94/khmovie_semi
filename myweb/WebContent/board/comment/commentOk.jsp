<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	window.opener.parent.location.href="BoardServlet?command=board_view&num=${sVo.parentnum}";
	window.close();
</script>
</body>
</html>