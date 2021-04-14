package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(filename);
		System.out.println("moviereviewservlet B_TITLE"+B_TITLE);
		BoardDAO board = new BoardDAO();
		BoardVO data = board.getRecord(B_TITLE);
		request.setAttribute("data", data);
		request.setAttribute("filename", filename);
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/Movie.jsp");
		dp.forward(request, response);
		System.out.println("movie.jsp로 forward완료");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
