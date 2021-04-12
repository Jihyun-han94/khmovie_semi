package reserve;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/selectDate")
public class Reserve_1_date extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Reserve_1_date() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id = request.getParameter("id");
//		String[] arr = id.split("-");	// 예매하기 누를 때 name으로 '2104_1' 이런 식의 파라미터 받아와야함. 이것도 되도록 안 받고 하는 방법으로 바꾸기. 아니 그것도 DB랑 연결하는 쪽으로.
//		ReserveDAO reserve = new ReserveDAO(arr[0]);
//		ReserveVO piece = reserve.getPiece(id);
//		
//		if(piece != null) {
//			request.setAttribute("piece", piece);
//			
//			if(piece.getType().equals("stand")) {
//				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve_stand.jsp");
//				dp.forward(request, response);
//			} else {
//				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve_sit.jsp");
//				dp.forward(request, response);
//			}
//		} else {
//			RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve_error.jsp");
//			dp.forward(request, response);
//		}
		
		
		// 영화마다 예매하기 버튼 마다로도 해두기
		
		
		HttpSession session = request.getSession();
		/*
		if(session.getAttribute("login") != null) {
			if(session.getAttribute("login").equals("true")) {     // 이걸 매 페이지 마다 넣어야 하나?
		*/
				ReserveDAO reserve = new ReserveDAO();
				ArrayList<ReserveVO> movieList = reserve.getAll();
				ArrayList<String> titleList = new ArrayList<>();
				
				for(ReserveVO movie : movieList) {
					titleList.add(movie.getTitle());
				}
				
				request.setAttribute("titleList", titleList);
				
				request.setCharacterEncoding("UTF-8");
				
				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/selectMovie.jsp");
				dp.forward(request, response);
		/*
			}
		} else {
			//로그인이 필요한 페이지입니다. 팝업창 띄워주기 처리 후 확인 누르면 아래 처리되도록.
			//response.sendRedirect("메인페이지");
		}
		*/
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		request.setCharacterEncoding("UTF-8");
		
		switch(title) {
			case "cold":
				title = "감기";	break;
			case "minari":
				title = "미나리";	break;
			case "secretGarden":
				title = "비밀의 정원"; break;
			case "veteran":
				title = "베테랑";	break;
			case "tenet":
				title = "테넷";
		}

		HttpSession session = request.getSession();
		session.setAttribute("title", title);
				
		ReserveDAO reserve = new ReserveDAO();
		String availStart = reserve.getAvailStart(title);
		String availEnd = reserve.getAvailEnd(title);
		int price = reserve.getPrice(title);

		ArrayList<String> dateList = new ArrayList<>();
		session.setAttribute("price", price);
		
		final String DATE_PATTERN = "yy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date availStart_Date = new Date(); //
		Date availEnd_Date = new Date();	//
		try {
			availStart_Date = sdf.parse(availStart);
			availEnd_Date = sdf.parse(availEnd);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		dateList.clear();
		// 예매일 기준 오늘날짜 받아오기
		Date today_Date = new Date();
		String today = sdf.format(today_Date);
		try {
			today_Date = sdf.parse(today);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date curr_date = availStart_Date;
		while(curr_date.compareTo(availEnd_Date) <= 0) {
			// 오늘 날짜 이후의 상영일만 추출
			if(curr_date.compareTo(today_Date) >= 0 ) {
				dateList.add(sdf.format(curr_date));
			}
			Calendar c = Calendar.getInstance();
			c.setTime(curr_date);
			c.add(Calendar.DAY_OF_MONTH, 1);
			curr_date = c.getTime();
		}
		
		request.setAttribute("dateList", dateList);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/selectDate.jsp");
		dp.forward(request, response);
	}
}
