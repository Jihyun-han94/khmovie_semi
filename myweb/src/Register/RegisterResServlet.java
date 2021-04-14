package Register;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Member.MemberVO;


@WebServlet("/register/res")
public class RegisterResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterResServlet() {
        
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw1");
		String username = request.getParameter("username");
		String usergender = request.getParameter("usergender");
		String useremail = request.getParameter("userEmail");
		String userphonenumber = request.getParameter("userPhone");
		String userbirthdate = request.getParameter("BrithDate");
		
		MemberDAO member = new MemberDAO();
		int result = member.register(userid, userpw, username, usergender, useremail, userphonenumber, userbirthdate);
		MemberVO data = member.login(userid, userpw);
		HttpSession session = request.getSession();
		
		if(result == 0) {
			session.setAttribute("login", "true");
			session.setAttribute("username", data.getUserId());
			session.setAttribute("usernickname", data.getUserName());
			
			Cookie cookie = new Cookie("username", userid);
			cookie.setMaxAge(60*60);
			response.addCookie(cookie);
			
			response.sendRedirect(request.getContextPath());
		}
		else {
			request.setAttribute("msg", "회원가입에 실패하였습니다.");
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/register/registerfail.jsp");
			dp.forward(request, response);
			return;
		}
	}

}
