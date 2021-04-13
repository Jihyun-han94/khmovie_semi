package mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyinfoUpdateServlet
 */
@WebServlet("/infoupdate")
public class MyinfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyinfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">>> doPost로 실행");
		
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String afpw = request.getParameter("afpw");
		
		System.out.println(userid+phone+email+afpw);
		
		/*MypageDAO member = new MypageDAO();
		MypageVO info = member.getRecord(userid);
		info.setPhoneNumber(phone);
		info.setEmail(email);
		info.setUserPw(afpw);
		int res = member.updateData(info);
		
		if(res == 0)
			System.out.println("업데이트 실패");*/
		
		response.sendRedirect(request.getContextPath()+"/userinfo");
	}

}
