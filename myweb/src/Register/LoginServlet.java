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


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		
		for(Cookie c: cookies) {
			if(c.getName().equals("username")) {
				request.setAttribute("username", c.getValue());
				break;
			}
		}
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/member/login.jsp");
		dp.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String remember = request.getParameter("remember");
		
		MemberDAO member = new MemberDAO();
		MemberVO data = member.login(userid, userpw);
		HttpSession session = request.getSession();
		
		if(data.getUserId() != null) {
			session.setAttribute("login", "true");
			session.setAttribute("userid", data.getUserId());
			
			Cookie[] cookies = request.getCookies();
			
			if(remember != null) {
				Cookie cookie = new Cookie("userid", userid);
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			} else {
				for(Cookie c: cookies) {
					if(c.getName().equals("userid")) {
						c.setMaxAge(0);
						response.addCookie(c);
						break;
					}
				}
			}
			
			response.sendRedirect(request.getContextPath());
		} else {
			System.out.println("로그인 실패");
		}
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/main.jsp");
		dp.forward(request, response);
		
		
	}

}
