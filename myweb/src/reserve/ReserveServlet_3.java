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

@WebServlet("/reserve_3")
public class ReserveServlet_3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReserveServlet_3() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String theaterName = request.getParameter("theaterName");
		
		switch(theaterName) {
			case "gangnam":
				theaterName = "강남"; break;
			case "cheonho":
				theaterName = "천호"; break;
			case "songpa":
				theaterName = "송파";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("theaterName", theaterName);
		String title = (String)session.getAttribute("title");
		String date = (String)session.getAttribute("date");
		
		ReserveDAO reserve = new ReserveDAO();
		ArrayList<String> timeList = reserve.getTime(title, date, theaterName);
		
		request.setAttribute("timeList", timeList);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/selectTime.jsp");
		dp.forward(request, response);
	}
}
