package comment.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import comment.model.*;

public class CommentWrite implements Action {
	 //��� �ۼ��� �α��� �Ǿ��ִ� ���� ������ ���̵� ���� ��������
	// ��۳����� ������.
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    	CommentVO mVo = new CommentVO();
        HttpSession session = request.getSession();
        mVo = (CommentVO) session.getAttribute("sessionId");
        
      //mVo.setCid(mVo.getId());//���̵� ���������� 
        mVo.setCcontent(request.getParameter("c_content"));
        mVo.setCparentnum(Integer.parseInt(request.getParameter("pnum")));
        
        
        CommentDAO mDao = CommentDAO.getInstance();
        mDao.hitDown(request.getParameter("pnum"));
        mDao.commentWrite(mVo);
        
        response.sendRedirect("BoardServlet?command=board_view&num="+ request.getParameter("pnum"));
    }
 
}
