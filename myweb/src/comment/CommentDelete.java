package comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommentDelete implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String cnum = request.getParameter("cnum");
        
        CommentDAO mDao = CommentDAO.getInstance();
        
        CommentVO mVo = new CommentVO();
        mVo = mDao.selectComment(cnum);
        mDao.commentDelete(cnum);
        request.setAttribute("mVo", mVo);
        
        request.getRequestDispatcher("board/commentOk.jsp").forward(request, response);
        
    }

}
