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

@WebServlet("/reserve_2")
public class ReserveServlet_2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReserveServlet_2() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("date");
		
		HttpSession session = request.getSession();
		session.setAttribute("date", date);
		String title = (String)session.getAttribute("title");
		
		ReserveDAO reserve = new ReserveDAO();
		ArrayList<String> theaterList = reserve.getTheater(title, date);
	
		request.setAttribute("theaterList", theaterList);
				
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/selectTheater.jsp");
		dp.forward(request, response);
	}
}
