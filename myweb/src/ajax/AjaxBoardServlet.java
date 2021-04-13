package ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.BoardVO;
import board.BoardDAO;
import java.io.File;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
@WebServlet("/ajax/board/list")

public class AjaxBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AjaxBoardServlet() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String value = request.getParameter("value");
		
		System.out.println(name);
		System.out.println(value);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("{\"res\" : \"지원을 완료했습니다!\"}");
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/Movie.jsp");
		dp.forward(request, response);
		System.out.println("ajaxforward완료");
		
		
		
	}
		//전달 받은 데이터에 대한 처리 로직 구현 끝
		
}
