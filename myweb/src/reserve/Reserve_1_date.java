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
		CkLogin ckLogin = new CkLogin(request, response);

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
				ArrayList<String> dateList = reserve.getDateList(title);
				ArrayList<String> availList = new ArrayList<>();
				
				// price 받아서 세션에 저장
				int price = reserve.getPrice(title);
				session.setAttribute("price", price);

				// 예매일 기준 오늘날짜 받아오기(String으로 변환)
				Date todayD = new Date();
				final String DATE_PATTERN = "yy-MM-dd";
				SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
				String today = sdf.format(todayD);
				
				// 예매일과 상영일 비교하여 예매가능한 날짜만 추출
				for(String date: dateList) {
					if(date.compareTo(today) >= 0) {
						availList.add(date);
					}
				}
				
				request.setAttribute("availList", availList);
				
				RequestDispatcher dp = request.getRequestDispatcher("/WEB-INF/reserve/selectDate.jsp");
				dp.forward(request, response);
			} else {
				ckLogin.alert();
			}
		} else {
			ckLogin.alert();
		}
	}
}