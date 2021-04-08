package Register;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/idcheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IdCheckServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO member = new MemberDAO();
		ArrayList<MemberVO> datas = member.getAll();
		
		member.close();
		
		request.setAttribute("datas", datas);
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/register/idcheck.jsp");
		dp.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//String userid = request.getParameter("userid");
		
		String userid = "test";
		request.setAttribute("userid", userid);
		response.sendRedirect("./register");
	}

}
