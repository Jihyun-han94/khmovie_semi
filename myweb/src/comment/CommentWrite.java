package comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.*;

public class CommentWrite implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    	CommentVO mVo = new CommentVO();
        HttpSession session = request.getSession();
        mVo = (CommentVO) session.getAttribute("sessionId");
        
        //mVo.setCid(mVo.getId());//아이디 값 받아오기
        mVo.setCcontent(request.getParameter("c_content"));
        
        CommentDAO mDao = CommentDAO.getInstance();
        mDao.hitDown(request.getParameter("pnum"));
        mDao.commentWrite(mVo);
        
        response.sendRedirect("BoardServlet?command=board_view&num="+ request.getParameter("pnum"));
    }
 
}
