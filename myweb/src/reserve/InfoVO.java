package reserve;

import java.sql.ResultSet;
import java.sql.SQLException;

public class InfoVO {
	private String theaterName;
	private String time;
	private String seat;
	
	public String getTheaterName() {
		return theaterName;
	}

	public void setTheaterName(String theaterName) {
		this.theaterName = theaterName;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getSeat() {
		return seat;
	}

	public void setSeat(String seat) {
		this.seat = seat;
	}

	public void setInfo(ResultSet res) {
		try {
			this.theaterName = res.getString("theaterName");
			this.time = res.getString("time");
			this.seat = res.getString("seat");
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
