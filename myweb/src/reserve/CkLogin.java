package reserve;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CkLogin {
	private HttpServletResponse response;
	private HttpServletRequest request;
	private PrintWriter out;
	private String str = "";
	private String contextPath;
	
	public CkLogin(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html charset=UTF-8");
		this.getWriter();
	}
	
	public void getWriter() {
		contextPath = this.request.getContextPath();
		this.str += "<script>alert('로그인이 필요한 페이지 입니다.');";
		this.str += "location.href='";
		this.str += contextPath + "/login';</script>";
		try {
			this.out = this.response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void alert() {
		this.out.print(str);		
	}
}