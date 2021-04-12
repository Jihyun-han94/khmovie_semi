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

@WebServlet("/complete")
public class Reserve_5_complete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Reserve_5_complete() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] seatNumArr = request.getParameterValues("seatNum");

		if(seatNumArr != null) {	// null로 해야 nullPointerException 발생 안함.
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
			
			
			// 티켓ID 가져오기
			ArrayList<String> ticketIdList = reserve.getTicketID(title, date, theaterName, time, seatNumArr);
			// ticket_status 에 넣기
			String user_id = (String)session.getAttribute("username");
			for(String ticketID : ticketIdList) {
				// 인자로 user_id도 넣어줘야 함.
				reserve.setTicketStatus(ticketID);
			}
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/complete.jsp");
			dp.forward(request, response);
			
			// close() 다 해야 함.
		} else {
			// 선택해야 한다는 팝업창 띄우도록.
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    response.sendRedirect("request.getContextPath()");
	}
}
