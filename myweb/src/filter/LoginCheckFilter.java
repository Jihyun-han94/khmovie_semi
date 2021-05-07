package filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(urlPatterns = {
		"/update"
})
public class LoginCheckFilter implements Filter {


    public LoginCheckFilter() {
    
    }

	
	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		
	    String userid = (String)session.getAttribute("username"); 
	    	
    	 if(userid == null){
    		 
    		
    		 response.setContentType("text/html; charset=UTF-8");
    		 
    		 PrintWriter out = response.getWriter();
    		  
    		 out.println("<script>alert('로그인 후 이용가능합니다.'); location.href='/myweb/login';</script>");
    		  
    		 out.flush();

    		 //resp.sendRedirect(path);
    	 }else {
    			request = (ServletRequest)req;
				response = (ServletResponse)resp;	
				chain.doFilter(request, response);	
    	 }
		
	}


	public void init(FilterConfig fConfig) throws ServletException {
	
	}

}
