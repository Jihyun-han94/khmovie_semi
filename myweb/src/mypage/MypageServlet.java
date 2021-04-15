package mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Member.MemberVO;
import reserve.TicketVO;


@WebServlet("/mypage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("username");
		
		MypageDAO member = new MypageDAO();
		MypageVO mv = member.getRecord(userid);
		TicketVO tv = member.getReserve(userid);
		
		member.close();
		
	    request.setAttribute("name", mv.getUserName());
	    request.setAttribute("grade", mv.getGrade());
	    
	    request.setAttribute("ticketid", tv.getTicketID());
	    request.setAttribute("title", tv.getTitle());
	    request.setAttribute("theater", tv.getTheaterName());
	    request.setAttribute("holddate", tv.getHoldDate());
	    request.setAttribute("seatnum", tv.getSeatNum());
	    
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/mypage.jsp");
		dp.forward(request, response);
	}

}
