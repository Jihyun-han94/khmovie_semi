package reserve;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

import main.DBConnection;

public class ReserveDAO {
	private Connection conn = null;
	private PreparedStatement pstat = null;

	public ReserveDAO() {
		this.conn = new DBConnection().getConnect();
	}
	
	public ArrayList<ReserveVO> getAll() {
		ArrayList<ReserveVO> movieList = new ArrayList<>();
		String sql = "";
		sql += "SELECT * FROM movie";
		try {
			Statement stat = this.conn.createStatement();
			ResultSet res = stat.executeQuery(sql);
			while(res.next()) {
				ReserveVO movie = new ReserveVO();
				movie.setPiece(res);
				movieList.add(movie);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return movieList;
	}
	
	public ArrayList<String> getDateList(String title) {
		String date = "";
		ArrayList<String> dateList = new ArrayList<>();
		String sql = "";
		sql += "SELECT * FROM";
		sql += " (SELECT distinct holdDate FROM ticket WHERE title = ?";
		sql += " ORDER BY holdDate ASC)";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				dateList.add(res.getString("holdDate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dateList;
	}
	
	public int getPrice(String title) {
		int price = 0;
		String sql = "";
		sql += "SELECT price FROM movie WHERE title = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				price = res.getInt("price");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return price;
	}
	
	public ArrayList<String> getTheater(String title, String date) {
		ArrayList<String> theaterList = new ArrayList<>();
		String sql = "";
		sql += "SELECT distinct ts.theaterName";
		sql += " FROM theater_schedule ts, ticket ti WHERE ts.scheduleID = ti.scheduleID";
		sql += " AND ti.title = ? AND ti.holdDate = ?";
		sql += " ORDER BY ts.theaterName ASC";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			pstat.setString(2, date);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				theaterList.add(res.getString("theaterName"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return theaterList;
	}
	
	public ArrayList<String> getTime(String title, String date, String theaterName) {
		ArrayList<String> timeList = new ArrayList<>();
		String sql = "";
		sql += "SELECT distinct ts.time_schedule";
		sql += " FROM theater_schedule ts, ticket ti WHERE ts.scheduleID = ti.scheduleID";
		sql += " AND ti.title = ? AND ti.holdDate = ? AND ts.theaterName = ?";
		sql += "ORDER BY ts.time_schedule ASC";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			pstat.setString(2, date);
			pstat.setString(3, theaterName);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				timeList.add(res.getString("time_schedule"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return timeList;
	}
	
	public ArrayList<String> getSeatNum(String title, String date, String theaterName, String time) {
		ArrayList<String> seatNumList = new ArrayList<>();
		String sql = "";
		sql += "SELECT ts.seatNum";
		sql += " FROM theater_schedule ts, ticket ti WHERE ts.scheduleID = ti.scheduleID";
		sql += " AND ti.booked IS NULL";
		sql += " AND ti.title = ? AND ti.holdDate = ? AND ts.theaterName = ? AND ts.time_schedule = ?";
		sql += "ORDER BY ts.seatNum ASC";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			pstat.setString(2, date);
			pstat.setString(3, theaterName);
			pstat.setString(4, time);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				seatNumList.add(res.getString("seatNum"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return seatNumList;
	}
	
	public int ckBooked(String title, String date, String theaterName, String time, String[] seatNumArr) {
		int res = 0;
		String sql = "";
		sql += "UPDATE (SELECT ti.booked";
		sql += " FROM ticket ti JOIN theater_schedule ts ON ti.scheduleID = ts.scheduleID";
		sql += " WHERE ti.title = ?";
		sql += " AND ti.holdDate = ?";
		sql += " AND ts.theaterName = ?";
		sql += " AND ts.time_schedule = ?";
		sql += " AND ts.seatNum IN (";
		sql += "'" + seatNumArr[0] + "'";
		for(int i = 1; i < seatNumArr.length; i++) {
			sql += ", " + "'" + seatNumArr[i] + "'";
		}
		sql += ")) ticket";
		sql += " SET ticket.booked = 'Y'";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			pstat.setString(2, date);
			pstat.setString(3, theaterName);
			pstat.setString(4, time);
			res = pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public ArrayList<String> getTicketID(String title, String date, String theaterName, String time, String[] seatNumArr) {
		ArrayList<String> ticketIdList = new ArrayList<>();
		String sql = "";
		sql += "SELECT ti.ticketID";
		sql += " FROM theater_schedule ts, ticket ti WHERE ts.scheduleID = ti.scheduleID";
		sql += " AND ti.title = ?";
		sql += " AND ti.holdDate = ?";
		sql += " AND ts.theaterName = ?";
		sql += " AND ts.time_schedule = ?";
		sql += " AND ts.seatNum IN (";
		sql += "'" + seatNumArr[0] + "'";
		for(int i = 1; i < seatNumArr.length; i++) {
			sql += ", " + "'" + seatNumArr[i] + "'";
		}
		sql += ")";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			pstat.setString(2, date);
			pstat.setString(3, theaterName);
			pstat.setString(4, time);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				ticketIdList.add(res.getString("ticketID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ticketIdList;
	}
	
	public int setTicketStatus(String ticketID, String user_id) {
		int res = 0;
		String sql = "";
		sql += "INSERT INTO ticket_status (ticketID, user_id)";
		sql += " VALUES (?, ?)";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, ticketID);
			pstat.setString(2, user_id);
			res = pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public ArrayList<TicketVO> getRList(String user_id, String date) {
		ArrayList<TicketVO> reserveList = new ArrayList<>();
		String sql = "";
		sql += "SELECT ts.ticketID, tt.title, tt.theaterName, tt.holdDate, tt.time_schedule, tt.seatNum, ts.user_id";
		sql += "	FROM";
		sql += "	(SELECT Btime, user_id, ticketID FROM (SELECT TO_CHAR(Btime, 'yyyymmdd') AS Btime, user_id, ticketID FROM ticket_status)) ts, "; 
		sql += "	(SELECT ti.ticketID, ti.title, ths.theaterName, ti.holdDate, ths.time_schedule, ths.seatNum";
		sql += "		FROM ticket ti, theater_schedule ths WHERE ti.scheduleID = ths.scheduleID) tt";
		sql += " WHERE ts.ticketID = tt.ticketID";
		sql += " AND ts.user_id = ?";
		sql += " AND ts.Btime LIKE '%" + date + "%'";
		sql += " ORDER BY ts.ticketID DESC";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user_id);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				TicketVO ticket = new TicketVO();
				ticket.setInfo(res);
				reserveList.add(ticket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reserveList;
	}
}

