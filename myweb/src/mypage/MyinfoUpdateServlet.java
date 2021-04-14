package mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/infoupdate")
public class MyinfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyinfoUpdateServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userid = request.getParameter("userid");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String afpw = request.getParameter("afpw");
		String bfpw = request.getParameter("userpw");
		
		System.out.println(">>> doPost로 실행");
		
		MypageDAO member = new MypageDAO();
		MypageVO data = member.getRecord(userid);
		
		data.setPhoneNumber(phone);
		data.setEmail(email);
		
		if(afpw.equals(""))
			data.setUserPw(bfpw);
		else
			data.setUserPw(afpw);
		
		int res = member.updateData(data);
		
		member.close();
		
		if(res == 0)
			System.out.println("업데이트 실패");
	
		response.sendRedirect("/mypage");
	}

}
