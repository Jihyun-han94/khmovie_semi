package comment.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import comment.model.*;

public class BoardView implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "/board/BoardDetailForm.jsp";
		String num = request.getParameter("num");

		CommentDAO mDao = CommentDAO.getInstance();
		CommentVO mVo = new CommentVO();
		
		//�Խñ��� Ŭ�������� ������ ������ �������
		//mVo = mDao.selectOneBoard(num);
		mDao.hitUp(num);
		
		
		request.setAttribute("mVo", mVo);
		
		//����� �����ϴ��� Ȯ��
		int result = mDao.commentCheck(num);
		if (result == 1) {
			//ArrayList<SoccerVO> list = sDao.commentView(num);
			
			//��� ��ü���� ��ȸ�Ͽ� ���������ڸ� �����ϴ� �ڵ�
			int totalCount = mDao.commentTotalCount(num);
			
			int countPageView = totalCount/5;
			//����� 6���� �Ǿ����� ������������ ���ܾ� �ϹǷ� �������� 0���� ũ�� �������� �߰���
			if(totalCount % 5 > 0) {
				countPageView++;
			}
			//����� 5�� �̸��϶��� �������� ������������
			if(totalCount > 5) {
			request.setAttribute("totalCount", countPageView);
			}
			//�������� �Ű������� �������ϱ⿡ Nullüũ�� �ؼ� ������ ������ ���� �־���
			int page = (request.getParameter("page") == null)? 1: Integer.parseInt(request.getParameter("page"));
			
			//�Խñ� ��ȣ�� ��������ȣ�� �Ű������� ���� ����� 5���� �ܾ���� �ڵ�
			ArrayList<CommentVO> list = mDao.commentView(num, page);

			request.setAttribute("list", list);
			
		}else if(result == 0) {
			request.setAttribute("message", "���� ���䰡 �����ϴ�.");
		}

		request.getRequestDispatcher(request.getContextPath()+url).forward(request, response);

	}
}
