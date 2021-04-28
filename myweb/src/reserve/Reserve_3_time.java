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
		
		// 로그인이 만료됐을 경우(session null 일 때의 에러) 대비
		if(session != null && session.getAttribute("login").equals("true")) {
			request.setCharacterEncoding("UTF-8");
			String theaterName = request.getParameter("theaterName");
			
			session.setAttribute("theaterName", theaterName);
			
			String title = (String)session.getAttribute("title");
			String date = (String)session.getAttribute("date");
			
			ReserveDAO reserve = new ReserveDAO();
			ArrayList<String> timeList = reserve.getTime(title, date, theaterName);
			
			request.setAttribute("timeList", timeList);
		}
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/selectTime.jsp");
		dp.forward(request, response);
	}
}