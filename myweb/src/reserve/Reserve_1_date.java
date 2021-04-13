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
		HttpSession session = request.getSession();

		if(session.getAttribute("login") != null) {
			if(session.getAttribute("login").equals("true")) {

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

				session.setAttribute("title", title);
						
				ReserveDAO reserve = new ReserveDAO();
				String availStart = reserve.getAvailStart(title);
				String availEnd = reserve.getAvailEnd(title);
				
				// price 받아서 세션에 저장
				int price = reserve.getPrice(title);
				session.setAttribute("price", price);

				ArrayList<String> dateList = new ArrayList<>();
				
				final String DATE_PATTERN = "yy-MM-dd";
				SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
				Date availStart_Date = new Date();
				Date availEnd_Date = new Date();
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
				
				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/selectDate.jsp");
				dp.forward(request, response);
			}
		} else {
			
		}
	}
}