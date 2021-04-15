package comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommentUpdate implements Action{
	 
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String url = "board/commentChoice.jsp";
        
        String command = request.getParameter("command");
        String cnum = request.getParameter("cnum");
        
        if(command.equals("comment_edit_form")) {
            
            url = "board/commentUpdate.jsp";
            CommentDAO mDao = CommentDAO.getInstance();
            CommentVO mVo = new CommentVO();
            mVo = mDao.selectComment(cnum);
            
            request.setAttribute("mVo", mVo);
            
            
        }else if (command.equals("comment_edit")) {
            
            String ccontent = request.getParameter("c_content");
            
            CommentDAO mDao = CommentDAO.getInstance();
            mDao.commentUpdate(cnum, ccontent);
            CommentVO mVo = new CommentVO();
            mVo = mDao.selectComment(cnum);
            request.setAttribute("mVo", mVo);
            
            
            url = "board/commentOk.jsp";
                    
        }
        
        request.getRequestDispatcher(url).forward(request, response);      
        
    }

}
