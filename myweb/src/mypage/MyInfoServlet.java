package mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/userinfo")
public class MyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("username");
		MypageDAO member = new MypageDAO();
		MypageVO mv = member.getRecord(userid);
		member.close();
		
		request.setAttribute("userinfo", mv);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/mypage/userinfo.jsp");
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String afpw = request.getParameter("afpw");
		
		MypageDAO member = new MypageDAO();
		MypageVO info = member.getRecord(id);
		info.setPhoneNumber(phone);
		info.setEmail(email);
		info.setUserPw(afpw);
		member.updateData(info);
		
		response.sendRedirect("./userinfo");
	}

}
