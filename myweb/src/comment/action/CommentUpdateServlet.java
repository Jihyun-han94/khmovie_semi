package comment.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommentUpdateAction implements Action
{
    @Override
    public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        
        // 파라미터를 가져온다.
        int comment_num = Integer.parseInt(request.getParameter("comment_num"));
        String comment_content = request.getParameter("comment_content");
        
        CommentDAO dao = CommentDAO.getInstance();
        
        CommentBean comment = new CommentBean();
        comment.setComment_num(comment_num);
        comment.setComment_content(comment_content);
        
        boolean result = dao.updateComment(comment);
        
        response.setContentType("text/html;charset=euc-kr");
        PrintWriter out = response.getWriter();
        
        // 정상적으로 댓글을 수정했을경우 1을 전달한다.
        if(result) out.println("1");
        
        out.close();
        
        return null;
    }
}
