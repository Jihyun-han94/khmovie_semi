package mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/userinfo")
public class MyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("username");
		MypageDAO member = new MypageDAO();
		MypageVO mv = member.getRecord(userid);
		member.close();
		
		request.setAttribute("userinfo", mv);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/mypage/userinfo.jsp");
		dp.forward(request, response);
	}
}
