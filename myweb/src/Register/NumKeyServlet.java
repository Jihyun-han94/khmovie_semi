package Register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/numkey")
public class NumKeyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public NumKeyServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String numkey = request.getParameter("numkey");
		
		System.out.println(numkey);
		
		if(numkey != null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print("{\"result\" : \"success\"}");
		}
		else {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.print("{\"result\" : \"fail\"}");
		}
	}

}
