package reserve;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TicketVO {
	private String ticketID;
	private String holdDate;
	private String time;
	private String seatNum;
	private String title;
	private String user_id;
	private String bTime;
	
	public String getTicketID() {
		return ticketID;
	}

	public void setTicketID(String ticketID) {
		this.ticketID = ticketID;
	}

	public String getHoldDate() {
		return holdDate;
	}

	public void setHoldDate(String holdDate) {
		this.holdDate = holdDate;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBTime() {
		return bTime;
	}

	public void setBTime(String bTime) {
		this.bTime = bTime;
	}

	

	public void setInfo(ResultSet res) {
		try {
			this.ticketID = res.getString("ticketID");
			this.holdDate = res.getString("holdDate");
			this.time = res.getString("time");
			this.seatNum = res.getString("seatNum");
			this.title = res.getString("title");
			this.user_id = res.getString("user_id");
			this.bTime = String.format("%1$tY-%1$tm-%1$td", res.getDate("Btime"));
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
