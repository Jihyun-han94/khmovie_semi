package reserve;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/reserve")
public class ReserveMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ReserveMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CkLogin ckLogin = new CkLogin(request, response);
		
		if(session.getAttribute("login") != null) {
			if(session.getAttribute("login").equals("true")) {
				
				ReserveDAO reserve = new ReserveDAO();
				ArrayList<ReserveVO> movieList = reserve.getAll();
				ArrayList<String> titleList = new ArrayList<>();
				
				for(ReserveVO movie : movieList) {
					titleList.add(movie.getTitle());
				}
				
				request.setAttribute("titleList", titleList);
				
				request.setCharacterEncoding("UTF-8");
				
				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/selectMovie.jsp");
				dp.forward(request, response);
			} else {
				ckLogin.alert();
			}
		} else {
			ckLogin.alert();
		}
	}
}
