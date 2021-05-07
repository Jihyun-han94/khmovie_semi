package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/board")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    public BoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");		
		BoardDAO board = new BoardDAO();
		ArrayList<BoardVO> datas = board.getAll();
		ArrayList<BoardVO> filedatas = board.getfiles();
 		board.close();
		request.setAttribute("datas", datas);
		request.setAttribute("filedatas", filedatas);
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/Board.jsp");
		dp.forward(request, response);
		System.out.println("forward완료");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}