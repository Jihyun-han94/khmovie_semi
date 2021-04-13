<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기존 게시판에 댓글 추가</title>
</head>
<body>
<table>
    <tr>
        <th colspan="2">REVIEW</th>
    </tr>
    <c:choose>
        <c:when test="${message != null }">
            <tr>
                <td>${message }</td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach var="list" items="${list }">
                <tr>
                    <td><font size="1.5"><b>${list.cid }</b>
                        ${list.cdate }
                        <c:if test = "${sessionId.id == list.cid }">
                            <b>
                                <a href="javascript:open_win('BoardServlet?command=comment_edit_delete&cnum=${list.cnum }','noname')">[수정/삭제]</a>
                            </b>
                        </c:if>
                        </font>
                        <br>
                            ${list.ccontent }
                    </td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</table>
<form action = "BoardServlet" method = "post" name = "check">
<input type = "hidden" name = "command" value = "comment_write">
<input type = "hidden" name = "pnum" value = "${param.num }">
<table>
    <tr>
        <th>한줄평</th>
        <td><textarea rows="3" cols="40" name = "c_content"></textarea></td>
    
        <td><input type = "submit" value = "입력" onclick = "return com_check()"></td>
    </tr>
</table>
</form>

<c:forEach var="i" begin = "1" end ="${totalCount }" step="1">
    <a href="BoardServlet?command=board_view&num=${param.num }&page=${i}">[${i}]</a>
</c:forEach>
</body>
</html>