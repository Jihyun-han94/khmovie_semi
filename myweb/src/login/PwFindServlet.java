package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Member.MemberDAO;

@WebServlet("/login/findpw")
public class PwFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public PwFindServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/login/findpw.jsp");
		dp.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String phone = request.getParameter("phone");
		
		MemberDAO dao = new MemberDAO();
		String result;
		
		if(phone.length() == 13) {
			result = dao.sendnum(phone);
		}else {
			result = null;
		}
		
		if(result == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print("{\"result\" : \"fail\"}");
		}
		else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print("{\"result\" : " + result + "}");
		}
	}
}