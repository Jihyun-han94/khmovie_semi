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

@WebServlet("/reserve_1")
public class ReserveServlet_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReserveServlet_1() {
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
		HttpSession session = request.getSession();
		
		ReserveDAO reserve = new ReserveDAO();
		ArrayList<ReserveVO> reserveVO = reserve.getAll();
		ArrayList<String> titleList = new ArrayList<>();
		for(ReserveVO title : reserveVO) {
			titleList.add(title.getTitle());
		}
		
		
		
		request.setAttribute("titleList", titleList);
		
		request.setCharacterEncoding("UTF-8");
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/selectMovie.jsp");
		dp.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		request.setCharacterEncoding("UTF-8");
		
		switch(title) {
			case "veteran":
				title = "베테랑"; break;
			case "villans":
				title = "범죄도시"; break;
			case "cold":
				title = "감기";
		}

		HttpSession session = request.getSession();
		session.setAttribute("title", title);
				
		ReserveDAO reserve = new ReserveDAO();
		ArrayList<String> getDateNprice = reserve.getDateNprice(title);

		String start_date_str = getDateNprice.get(0);
		String end_date_str = getDateNprice.get(1);
		session.setAttribute("price", Integer.parseInt(getDateNprice.get(2)));
		
		final String DATE_PATTERN = "yy-MM-dd";
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		Date start_date = new Date(); //
		Date end_date = new Date();	//
		try {
			start_date = sdf.parse(start_date_str);
			end_date = sdf.parse(end_date_str);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		getDateNprice.clear();	
		Date curr_date = start_date;
		while(curr_date.compareTo(end_date) <= 0) {
			getDateNprice.add(sdf.format(curr_date));
			Calendar c = Calendar.getInstance();
			c.setTime(curr_date);
			c.add(Calendar.DAY_OF_MONTH, 1);
			curr_date = c.getTime();
		}
		
		request.setAttribute("getDate", getDateNprice);
		
		RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/selectDate.jsp");
		dp.forward(request, response);
	}

}
