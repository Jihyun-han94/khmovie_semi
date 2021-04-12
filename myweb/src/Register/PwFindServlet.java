package Register;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/findpw")
public class PwFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public PwFindServlet() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/login/findpw.jsp");
		dp.forward(request, response);
	}

}