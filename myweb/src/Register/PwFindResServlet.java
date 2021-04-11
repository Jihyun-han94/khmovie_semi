package Register;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/findpw/res")
public class PwFindResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public PwFindResServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("userName");
		String phone = request.getParameter("userPhone");
		String userid = request.getParameter("userid");
		
		MemberDAO member = new MemberDAO();
		String userpw = member.findPw(username, userid, phone);
		
		request.setAttribute("userpw", userpw);
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/login/findpwres.jsp");
		dp.forward(request, response);
	}

}
