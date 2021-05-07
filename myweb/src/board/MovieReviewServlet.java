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

import Comment.CommentDAO;
import Comment.CommentVO;

@WebServlet("/moviereview")
public class MovieReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MovieReviewServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String B_TITLE = request.getParameter("B_TITLE");
		String filename = request.getParameter("filename");
	
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("username");
		request.setAttribute("userid", userid);
		
		
	    System.out.println("서블릿 userid 확인: "+userid);
	    
		BoardDAO board = new BoardDAO();
		BoardVO data = board.getRecord(B_TITLE);
		
		request.setAttribute("data", data);
		request.setAttribute("filename", filename);
		request.setAttribute("userid", userid);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/Movie.jsp");
		dp.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}