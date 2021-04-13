package reserve;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CkLogin {
	private HttpServletResponse response;
	private HttpServletRequest request;
	
	public CkLogin(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		this.alert();
	}
	
	public void alert() {
		try {
			PrintWriter out = this.response.getWriter();
			String str = "";
			String contextPath = request.getContextPath();
			str += "<script>alert('로그인이 필요한 페이지 입니다.');";
			str += "location.href='";
			str += contextPath + "/login';</script>";
			out.print(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
