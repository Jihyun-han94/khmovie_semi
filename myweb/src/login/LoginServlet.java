package login;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/login/login.jsp");
		dp.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String userpw = request.getParameter("userpw");
		String remember = request.getParameter("remember");
		
		MemberDAO member = new MemberDAO();
		MemberVO data = member.login(userid, userpw);
		
		HttpSession session = request.getSession();
		
		if(data.getUserId() != null) {
			session.setAttribute("login", "true");
			session.setAttribute("username", data.getUserId());
			session.setAttribute("usernickname", data.getUserName());
			
			if(remember != null) {
				Cookie cookie = new Cookie("username", userid);
				cookie.setMaxAge(60*60*24);
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("username", userid);
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);
			}
			response.sendRedirect(request.getContextPath()+"/main");
		} else {
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("loginchek", "???????????? ??????????????? ??????????????????.");
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/login/login.jsp");
			dp.forward(request, response);
		}
		
	}

}
