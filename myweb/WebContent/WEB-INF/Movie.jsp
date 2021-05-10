<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardVO" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="Comment.CommentDAO" %>
<%@ page import="Comment.CommentVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ include file="/WEB-INF/module/top_nav.jsp" %>
<link rel="stylesheet" type ="text/css" href="<%=request.getContextPath() %>/css/Movie.css">    
</head>
<body>
	<
	<% 
		String userid = (String)request.getAttribute("userid");
		System.out.println("userid확인 : "+userid);
		String path =request.getServletContext().getRealPath(File.separator)+"\\upload";
		BoardVO data = (BoardVO)request.getAttribute("data"); 
		String filename = (String)request.getAttribute("filename"); 
		System.out.println(filename);
		String directory = application.getRealPath("/upload/")+filename;
		System.out.println(directory);
	%>
	<div class="large_container">
	
	<div class="container">
	
		<div class="poster"><img id="img" src="upload/<%=filename %>"></div>
		
		<div class="contents">
		<p class="title"><%=data.getB_TITLE() %></p>
		<p class="direct">감독 : <%=data.getB_ARTIST() %></p>
		<p class="actist">출연진 : <%=data.getB_CONTEXT() %></p>
		<p>줄거리</p>
		<p class="context"><%=data.getB_DIRECT() %></p>
		</div>
		
		<div>
		<form action="./movie/delete" method="post">
		<input type="hidden" name="movietitle" value="<%=data.getB_TITLE() %>" readonly>
		<button type="submit">삭제</button>
		</form>
		
		<form action="./movie/update" method="get">
		<input type="hidden" name="movietitle" value="<%=data.getB_TITLE() %>" readonly>
		<button type="submit">수정</button>
		</form>
		</div>
	
	</div>

	<div class="review_container">
       <p class="title" align="center">REVIEW</p>
       <hr align="center" style="border: solid 3px black; width: 100%;">
     
        <table id="listReply">  
            <% 
            	int B_NUM = data.getB_NUM();
            	System.out.println("디버그!!!!"+B_NUM);
            	CommentDAO comment = new CommentDAO();
            	ArrayList<CommentVO> datas_c = comment.getRecord(B_NUM);
            	if(datas_c !=null){
            	for(CommentVO datas : datas_c){%>
            <tr>
                <td ><%=datas.getC_USERID() %> : <%=datas.getC_COMMENT() %></td>
            </tr>
            <%} %>	
            <%}else{%>
            	<tr>
            	<td>한줄 관람평을 입력해주세요!</td>
            	</tr>
            <% }%>      
        </table>
 
                <div class="reply_div">
                <label>관람평</label>
                <textarea class="replyContent" rows="3" cols="40" placeholder="관람평을 작성해주세요."></textarea>
                <button type="button" class="btnReply">등록버튼</button>
                </div>
        </div>
	 
	 </div>
</body>
<script type="text/javascript">

	let btnReply = document.querySelector('.btnReply');
	btnReply.addEventListener('click',function(){
		let content = document.querySelector('.replyContent').value;
		let B_TITLE = "<%=data.getB_TITLE() %>";
		let C_USERID = '<%=userid %>';
		let B_NUM = "<%=data.getB_NUM() %>";
		
	
		$.ajax({
			url : "<%=request.getContextPath()%>/comment",
			type : 'post' , datatype : "json",
			data : {userid : C_USERID , C_COMMENT : content, B_TITLE : B_TITLE , B_NUM : B_NUM},
			success : function(data){
				
				console.log(data);
				var table = document.getElementById('listReply');
				var td = document.createElement("TD");
				td.innerHTML = C_USERID+":"+content;
				var tr = document.createElement("TR");
				tr.appendChild(td);
				table.appendChild(tr);
				
			},
			error : function(){
				alert('ajax 전송 오류입니다....');
			}
		});
	});
</script>

</html>