package login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberDAO;

@WebServlet("/login/findid/res")
public class IdFindResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public IdFindResServlet() {
        super();
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("userName");
		String phone = request.getParameter("userPhone");
		
		MemberDAO member = new MemberDAO();
		String userid = member.findId(username, phone);
		
		request.setAttribute("userid", userid);
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/login/findidres.jsp");
		dp.forward(request, response);
	}

}
