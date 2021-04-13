package mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Member.MemberDAO;
import Member.MemberVO;


@WebServlet("/mypage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MypageServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("username");
		
		System.out.println(userid);
		MypageDAO member = new MypageDAO();
		MypageVO mv = member.getRecord(userid);
		member.close();
		
		String name = mv.getUserName();
		int grade = mv.getGrade();
		
	    request.setAttribute("name", name);
	    request.setAttribute("grade", grade);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/mypage.jsp");
		dp.forward(request, response);
	}

}
