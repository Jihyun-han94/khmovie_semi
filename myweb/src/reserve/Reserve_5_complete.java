package reserve;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/reserve_5")
public class ReserveServlet_5 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReserveServlet_5() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] seatNumArr = request.getParameterValues("seatNum");

		if(seatNumArr.length != 0) {	// null로 해도 되나?
			HttpSession session = request.getSession();
			session.setAttribute("seatNumArr", seatNumArr);
			String title = (String)session.getAttribute("title");
			String date = (String)session.getAttribute("date");
			String theaterName = (String)session.getAttribute("theaterName");
			String time = (String)session.getAttribute("time");
			
			ReserveDAO reserve = new ReserveDAO();
			int res = reserve.ckBooked(title, date, theaterName, time, seatNumArr);
			
			int price = (Integer)session.getAttribute("price");
			price = price * seatNumArr.length;
			session.setAttribute("totalPrice", price);
			
			// sale_data 에 넣기 -- info session에 넣었나 묻고.

			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/complete.jsp");
			dp.forward(request, response);
		} else {
			// 전화면으로 돌아가게?
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.sendRedirect("request.getContextPath()");
	}
}
