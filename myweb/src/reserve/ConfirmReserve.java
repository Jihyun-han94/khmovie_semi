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

@WebServlet("/reserve/confirm")
public class ConfirmReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ConfirmReserve() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("username");
		
		ReserveDAO reserve = new ReserveDAO();

		ArrayList<TicketVO> ticketList = reserve.getMyTList(user_id);
		
		request.setAttribute("ticketList", ticketList);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/myTicketList.jsp");
		dp.forward(request, response);
	}
}
