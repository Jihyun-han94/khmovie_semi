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

@WebServlet("/selectTheater")
public class Reserve_2_theater extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Reserve_2_theater() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CkLogin ckLogin = new CkLogin(request, response);
		
		if(session.getAttribute("login") != null) {
			if(session.getAttribute("login").equals("true")) {
		
				String date = request.getParameter("date");
				
				session.setAttribute("date", date);
				String title = (String)session.getAttribute("title");
				
				ReserveDAO reserve = new ReserveDAO();
				ArrayList<String> theaterList = reserve.getTheater(title, date);
			
				request.setAttribute("theaterList", theaterList);
						
				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/selectTheater.jsp");
				dp.forward(request, response);
			} else {
				ckLogin.alert();
			}
		} else {
			ckLogin.alert();
		}
	}
}