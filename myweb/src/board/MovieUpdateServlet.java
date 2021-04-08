package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		//클라이언트가 전달한 영화 후기 파라메터 추출
		String B_ID = request.getParameter("B_ID");
		String B_TITLE = request.getParameter("B_TITLE");
		String B_DIRECT = request.getParameter("B_DIRECT");
		String B_ARTIST = request.getParameter("B_ARTIST");
		String B_CONTEXT = request.getParameter("B_CONTEXT");
		
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
		
		//BoardDAO를 생성한 후, 영화제목으로 데이터 조회
		BoardDAO board2 = new BoardDAO();
		BoardVO data2 = board2.getRecord(B_NUM);
		request.setAttribute("data2", data2);
		
		//Movie.jsp로 forward
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/Movie.jsp");
		dp.forward(request, response);
	}

}
