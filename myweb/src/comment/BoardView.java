package comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.*;

public class BoardView implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		String url = "Movie.jsp";
		String num = request.getParameter("num");

		CommentDAO mDao = CommentDAO.getInstance();
		CommentVO mVo = new CommentVO();
		
		//�Խñ��� Ŭ�������� ������ ������ �������
		//mVo = mDao.selectOneBoard(num);
		request.setAttribute("mVo", mVo);
		request.getRequestDispatcher(url).forward(request, response);

	}
}
