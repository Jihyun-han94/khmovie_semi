<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.ArrayList,board.BoardVO,board.BoardDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH무비</title>
<link type="text/css" rel="stylesheet"
    href="<%=request.getContextPath() %>/static/bootstrap-4.6.0/css/bootstrap.min.css">
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/jquery/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
    src="<%=request.getContextPath() %>/static/bootstrap-4.6.0/js/bootstrap.min.js"></script>
<%@ include file="/WEB-INF/module/top_nav.jsp" %>
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/board.css">   
</head>
<body>
<% 		BoardDAO dao = new BoardDAO();
		//전체 게시물 수
		int count = dao.selectCnt("FILE_T");
		String tempStart = request.getParameter("page");
		int startPage = 0;
		int lastPage = 12;
		int onePageCnt = 12;
		
		//전체 페이지 수 
		count = (int)Math.ceil((double)count/(double)onePageCnt);
		
		if(tempStart !=null){ //처음에는 실행되지 않는다.
			startPage = (Integer.parseInt(tempStart)-1)*onePageCnt+1;	
			System.out.println("startpage:"+startPage);
			lastPage = Integer.parseInt(tempStart)*12;
		}
		ArrayList<BoardVO> records = dao.selectPage(startPage,lastPage);
				
	%>
	
	<h2 id="text2">kh무비에 없는 영화를 등록해주세요!</h2>
	<form action="./update" method ="get">
	<button id="btn" type="submit">등록하기</button>
	</form>
 	<h2 id="text">관람후기</h2>
    <hr id="hr">

	
	<div class="container">
	
	<% 
		ArrayList<BoardVO> filedatas = (ArrayList<BoardVO>)request.getAttribute("filedatas");
		for(BoardVO filedata: records){%>
	
	<div class=item><a href="<%=request.getContextPath() %>/moviereview?B_TITLE=<%=filedata.getMovietitle()%>&filename=<%=filedata.getFileName() %>"><img width="200px" height="287px" src="upload/<%=filedata.getFileRealName() %>"></a></div>
	
	<% }%>
	
	</div>	
	<div class="pagenum">
	<%for(int i = 1; i<=count; i++){ %>
		<a href = "./BoardPage?page=<%=i %>">[<%=i %>]</a>
	<%} %>
	</div>
	<footer class="footer"></footer>
</body>
</html>