package Register;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/register/res")
public class RegisterResServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public RegisterResServlet() {
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/register/registerres.jsp");
		dp.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String userpw1 = request.getParameter("userpw1");
		String username = request.getParameter("username");
		String usergender = request.getParameter("usergender");
		String useremail = request.getParameter("userEmail");
		String userphonenumber = request.getParameter("userPhone");
		String userbirthdate = request.getParameter("BrithDate");
		
		MemberDAO member = new MemberDAO();
		int result = member.checkId(userid);
		
		if(result == 0) {
			request.setAttribute("msg", "회원가입에 실패하였습니다.");
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/register/registerres.jsp");
			dp.forward(request, response);
			return;
		}
		else {
			member.register(userid, userpw1, username, usergender, useremail, userphonenumber, userbirthdate);
			request.setAttribute("msg", "회원가입에 성공하였습니다.");
			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/register/registerres.jsp");
			dp.forward(request, response);
		}
	}

}