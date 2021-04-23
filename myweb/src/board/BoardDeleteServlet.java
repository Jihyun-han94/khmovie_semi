package board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/movie/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardDeleteServlet() {
        super();

    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	
		String movietitle = request.getParameter("movietitle");
		System.out.println("deleteservlet movie title :"+movietitle);
		BoardDAO board = new BoardDAO();
		board.deleteReview(movietitle);
		board.deleteFile(movietitle);
		board.close();
		response.sendRedirect("../board");

	}

}
