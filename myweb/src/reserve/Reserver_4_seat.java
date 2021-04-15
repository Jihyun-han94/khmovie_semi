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

@WebServlet("/selectSeat")
public class Reserver_4_seat extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Reserver_4_seat() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CkLogin ckLogin = new CkLogin(request, response);

		if(session.getAttribute("login") != null) {
			if(session.getAttribute("login").equals("true")) {
		
				String time = request.getParameter("time");
				
				session.setAttribute("time", time);
				String title = (String)session.getAttribute("title");
				String date = (String)session.getAttribute("date");
				String theaterName = (String)session.getAttribute("theaterName");
		
				ReserveDAO reserve = new ReserveDAO();
				ArrayList<String> seatNumList = reserve.getSeatNum(title, date, theaterName, time);
						
				request.setAttribute("seatNumList", seatNumList);
				
				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/selectSeat.jsp");
				dp.forward(request, response);
			} else {
				ckLogin.alert();
			}
		} else {
			ckLogin.alert();
		}
	}
}