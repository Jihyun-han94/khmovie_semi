package comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.model.*;

public class CommentDelete implements Action {
	// 댓글 삭제 처리 
	// CommentVO 부분 다른분들거랑 같이 합쳐서 값 읽어오기.(CommentDTO)포함
	 
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
