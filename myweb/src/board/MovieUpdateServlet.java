package board;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/update")
public class MovieUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public MovieUpdateServlet() {
        super();
      
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/MovieUpdate.jsp");
		dp.forward(request, response);
		System.out.println("forward완료");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	
		System.out.println(request.getServletContext().getRealPath(File.separator));
		MultipartRequest multi = new MultipartRequest(request, request.getServletContext().getRealPath(File.separator)+"\\upload",
				1024*1024*5,
				"utf-8",
				new DefaultFileRenamePolicy()); 
	   
		String path =request.getServletContext().getRealPath(File.separator)+"\\upload";
		System.out.println(path);
		
		//클라이언트가 전달한 영화 후기 파라메터 추출
		String B_ID = multi.getParameter("B_ID");
		String B_TITLE = multi.getParameter("B_TITLE");
		String B_DIRECT = multi.getParameter("B_DIRECT");
		String B_ARTIST = multi.getParameter("B_ARTIST");
		String B_CONTEXT = multi.getParameter("B_CONTEXT");
		
		
		String fileRealName = multi.getFilesystemName("file");
		String fileName = multi.getOriginalFileName("file");
		
		
		BoardVO filedata = new BoardVO(B_TITLE,fileName, fileRealName);
		
		new BoardDAO().upload(filedata);
		
		
		//확인
		System.out.println(B_ID);
		System.out.println(B_TITLE);
		System.out.println(B_DIRECT);
		System.out.println(B_ARTIST);
		System.out.println(B_CONTEXT);
		
		//사용자 요청 값을 객체로 저장
		BoardVO data = new BoardVO(B_ID, B_TITLE, B_DIRECT, B_ARTIST, B_CONTEXT);
		
		//BoardDAO를 생성 한 후, 만든 BoardVO 를 전달 후 저장.
		BoardDAO board = new BoardDAO();
		board.saveData(data);
		System.out.println("savedata로 넘겨줌");
		
		
		board.close();
		
		String encodedTitle = URLEncoder.encode(B_TITLE, "UTF-8");
		String encodedName = URLEncoder.encode(fileRealName,"UTF-8");
		
		
		//MovieReviewServlet으로 redirect
		response.sendRedirect("./moviereview?B_TITLE="+encodedTitle+"&filename="+encodedName);
	}

}
