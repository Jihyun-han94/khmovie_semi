package Member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UserRegisterServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/member/register.jsp");
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String userpw1 = request.getParameter("userpw1");
		String userpw2 = request.getParameter("userpw2");
		String username = request.getParameter("username");
		String BrithDate = request.getParameter("BrithDate");
		String usergender = request.getParameter("usergender");
		String userPhone = request.getParameter("userPhone");
		String userEmail = request.getParameter("userEmail");
		
		MemberDAO dao = new MemberDAO();
		
		int idcheck = dao.registerCheck(userid);
		
		if(idcheck == 1) {
			request.setAttribute("userid", userid);
			request.setAttribute("msg", "가입 가능한 아이디");
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/member/registerres.jsp");
			dp.forward(request, response);
		}
		else {
			request.setAttribute("userid", userid);
			request.setAttribute("msg", "가입 불가능한 아이디");
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/member/registerres.jsp");
			dp.forward(request, response);
		}
		
		int result = dao.register(userid, userpw1, username, usergender, userEmail, userPhone, BrithDate);
		
		if(result == 1) {
			request.setAttribute("userid", userid);
			request.setAttribute("msg", "성공");
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/member/registerres.jsp");
			dp.forward(request, response);
		}
		else {
			request.setAttribute("userid", userid);
			request.setAttribute("msg", "실패");
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/member/registerres.jsp");
			dp.forward(request, response);
		}
		
	}

}
