package reserve;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketVO {
	private String bTime;
	private String ticketID;
	private String title;
	private String theaterName;
	private String holdDate;
	private String time_schedule;
	private String seatNum;
	private String user_id;

	public String getBtime() {
		return bTime;
	}
	
	public String getTicketID() {
		return ticketID;
	}

	public String getTitle() {
		return title;
	}

	public String getTheaterName() {
		return theaterName;
	}

	public String getHoldDate() {
		return holdDate;
	}

	public String getTime_schedule() {
		return time_schedule;
	}

	public String getSeatNum() {
		return seatNum;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setInfo(ResultSet res) {
		try {
			this.bTime = res.getString("Btime");
			this.ticketID = res.getString("ticketID");
			this.title = res.getString("title");
			this.theaterName = res.getString("theaterName");
			this.holdDate = res.getString("holdDate");
			this.time_schedule = res.getString("time_schedule");
			this.seatNum = res.getString("seatNum");
			this.user_id = res.getString("user_id");
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}