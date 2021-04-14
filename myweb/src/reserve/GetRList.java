package reserve;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/getRList")
public class GetRList extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public GetRList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("UTF-8");
		String date = (String)request.getParameter("date");
		String user_id = (String)session.getAttribute("username");
		
		ReserveDAO reserve = new ReserveDAO();
		ArrayList<TicketVO> RList = reserve.getMyRList(user_id, date);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
				
		JSONObject obj = new JSONObject();
		JSONArray jArray = new JSONArray();
		System.out.println(RList.size());
		for(int i = 0; i < RList.size(); i++) {
			JSONObject sObject = new JSONObject();
			sObject.put("ticketID", RList.get(i).getTicketID());
			sObject.put("title", RList.get(i).getTitle());
			sObject.put("theaterName", RList.get(i).getTheaterName());
			sObject.put("holdDate", RList.get(i).getHoldDate());
			sObject.put("time_schedule", RList.get(i).getTime_schedule());
			sObject.put("seatNum", RList.get(i).getSeatNum());
			sObject.put("user_id", RList.get(i).getUser_id());
			jArray.add(sObject);
			obj.put(i, jArray);
		}
		System.out.println(obj);
		out.print("{\"reserve\": obj}");
		
		
	}
}
