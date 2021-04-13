package mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/deleteMember")
public class MYinfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MYinfoDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("username");
		
		System.out.println(">>delete작동");
		
		MypageDAO member = new MypageDAO();
		int res = member.deleteData(userid);
		member.close(); 
		
		if(res != 1) {
			session.invalidate();
			response.sendRedirect("../register");
		}
		else {
			System.out.println(">>delete 실패");
			response.sendRedirect("../mypage");
		}
		
	}

}
