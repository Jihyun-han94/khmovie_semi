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

@WebServlet("/selectTime")
public class Reserve_3_time extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Reserve_3_time() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CkLogin ckLogin = new CkLogin(request, response);

		if(session.getAttribute("login") != null) {
			if(session.getAttribute("login").equals("true")) {
		
				String theaterName = request.getParameter("theaterName");
				
				switch(theaterName) {
					case "gangnam":
						theaterName = "강남"; break;
					case "cheonho":
						theaterName = "천호"; break;
					case "songpa":
						theaterName = "송파"; break;
					case "apgujeong":
						theaterName = "압구정"; break;
					case "miah":
						theaterName = "미아"; break;
					case "sooyu":
						theaterName = "소유"; break;
					case "deungchon":
						theaterName = "등촌"; break;
					case "gangbyeon":
						theaterName = "강변"; break;
					case "konUniv":
						theaterName = "건대";
				}
				
				session.setAttribute("theaterName", theaterName);
				
				String title = (String)session.getAttribute("title");
				String date = (String)session.getAttribute("date");
				
				ReserveDAO reserve = new ReserveDAO();
				ArrayList<String> timeList = reserve.getTime(title, date, theaterName);
				
				request.setAttribute("timeList", timeList);
				
				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/selectTime.jsp");
				dp.forward(request, response);
			} else {
				ckLogin.alert();
			}
		} else {
			ckLogin.alert();
		}
	}
}