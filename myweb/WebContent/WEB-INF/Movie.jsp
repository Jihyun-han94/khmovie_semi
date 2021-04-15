<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO" %>
<%@page import="board.BoardDAO" %>
<%@page import="java.io.File" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
    href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/module/top_nav.jsp" %>
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/Movie.css">    
</head>
<body>
	<% String path =request.getServletContext().getRealPath(File.separator)+"\\upload"; %>
	<% BoardVO data = (BoardVO)request.getAttribute("data"); %>
	<% String filename = (String)request.getAttribute("filename"); 
		System.out.println(filename);
		String directory = application.getRealPath("/upload/")+filename;
		System.out.println(directory);
	%>
	
	<div class="container">
	<div class="poster"><img id="img" src="upload/<%=filename %>"></div>
	<div class="contents">
	<p class="title"><%=data.getB_TITLE() %></p>
	<p class="direct">감독 : <%=data.getB_ARTIST() %></p>
	<p class="acctist">출연진 : <%=data.getB_CONTEXT() %></p>
	<p>줄거리</p>
	<p class="context"><%=data.getB_DIRECT() %></p>
	</div>
	</div>
	<!-- 댓글 화면을 만들기 위한 영역 시작 -->
	<%--
	<table>
    	<tr>
        	<th colspan="4">REVIEW</th>
    	</tr>
    	<% if(message != null) { %>
    		<tr>
    			<td colspan="4"><%=message %></td>
    		</tr>
    	<% } else { %>
    	<!-- 관람자명 | 작성일 | 관람평 내용 | 수정삭제버튼 -->
    		<% for(CommentVO comment: list) { %>
	    		<tr>
	    			<td><%=comment.getUserID() %></td>
	    			<td><%=comment.getCDate() %></td>
	    			<td>
	    				<%=comment.getComment() %>
	    			</td>
	    			<td>
	    				<% if(comment.getUserID() == session.getAttribute("username")) { %>
	    					<a href="#">수정</a>
	    					<a href="<%=request.getContextPath() %>/comment/delete?id=<%=comment.getCNum() %>">삭제</a>
	    				<% } %>
	    			</td>
	    		</tr>
    		<% } %>
    	<% } %>
	</table>
	<form action="BoardServlet" method="post" name="check">
		<input type="hidden" name="command" value="<%=session.getAttribute("username") %>">
		<input type="hidden" name= pnum" value="<%=data.getB_NUM() %>">
		<table>
	    	<tr>
	        	<th>한줄평</th>
	        	<td><textarea rows="3" cols="40" name="c_content"></textarea></td>
	        	<td><input type="submit" value="입력" onclick="return com_check()"></td>
	    	</tr>
		</table>
	</form>
	--%>
	<div align="center">
       <p class="title">REVIEW</p>
        <hr align="center" style="border: solid 3px black; width: 50%;">
        <table>
            <tr>
                <th width="10%" align="left">ID</th>
                <th width="60%">관람평</th>    
            </tr>
        </table>
        <table>  
            <tr>
                <td width="10%" align="center">userid1</td>
                <td width="60%">즐거웠습니다.</td>
                <td width="10%"><input type="button"value="수정"></td>
                <td><input type="button"value="삭제"></td>
            </tr>
        </table>
        <table>  
            <tr>
                <td width="10%" align="center">userid2</td>
                <td width="60%">감명깊었습니다.</td>
                <td width="10%"><input type="button"value="수정"></td>
                <td><input type="button"value="삭제"></td>
            </tr>
        </table>
        <table>  
            <tr>
                <td width="10%" align="center">userid3</td>
                <td width="60%">즐거웠습니다.</td>
                <td width="10%"><input type="button"value="수정"></td>
                <td><input type="button"value="삭제"></td>
            </tr>
        </table>
        <table>
            <tr>
                <th>관람평</th>
                <td><textarea rows="3" cols="40"></textarea></td>
                <td class="cbtn"><input type="button" value="등록" ></td>
            </tr>
        </table>
    </div>
	<!-- 댓글 화면을 만들기 위한 영역 끝 -->
	<footer class="footer"></footer>
</body>
</html>