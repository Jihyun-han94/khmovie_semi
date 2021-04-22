package movie;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mypage.MypageDAO;
import mypage.MypageVO;

@WebServlet("/movie")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public MovieServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("username");
		
		MovieDAO mdao = new MovieDAO();
		ArrayList<MovieVO> movielist = mdao.getAll();
		ArrayList<String> titleList = new ArrayList<>();
		
		for(MovieVO movie : movielist) {
			titleList.add(movie.getTitle());
		}
		
		if(userid != null) {
			request.setAttribute("userid", userid);
		}
		request.setAttribute("titleList", titleList);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/Movie/movie.jsp");
		dp.forward(request, response);
	}

}
