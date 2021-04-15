package mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/grade")
public class MyGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MyGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("username");
		
		MypageDAO member = new MypageDAO();
		MypageVO mv = member.getRecord(userid);
		
		int grade = mv.getGrade();
		int purchase = mv.getPurchase();
		
	    request.setAttribute("grade", grade);
	    request.setAttribute("purchase", purchase);
	    
	    member.close();
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/mypage/grade.jsp");
		dp.forward(request, response);
	}

}
