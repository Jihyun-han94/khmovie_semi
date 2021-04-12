package Register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register/idcheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IdCheckServlet() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/register/idcheck.jsp");
		dp.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		
		MemberDAO dao = new MemberDAO();
		int result = dao.checkId(userid);
		
		if(userid.length() > 3 && userid.length() < 13) {
			if(result == 0) {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.print("{\"result\" : \"fail\"}");
			}
			else {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("application/json");
				PrintWriter out = response.getWriter();
				out.print("{\"result\" : \"success\"}");
			}
		}
		else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print("{\"result\" : \"fail\"}");
		}
	}

}
