package reserve;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

import main.DBConnection;

public class ReserveDAO {
	private Connection conn = null;
	private PreparedStatement pstat = null;
	private int tbId = 0;
	private String table = "reserve_" + tbId;
	
	public ReserveDAO() {
		this.conn = new DBConnection().getConnect();
		this.tbId = 2104;
	}
	
	public ReserveDAO(String tbId) {
		this.conn = new DBConnection().getConnect();
		this.tbId = Integer.parseInt(tbId);
	}
	
	public ReserveVO getTitle(String id) {
		ReserveVO movie = null;
		String sql = "";
		sql += "SELECT * FROM " + this.table;
		sql += "WHERE id = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			ResultSet res = pstat.executeQuery();
			if(res.next()) {
				movie = new ReserveVO();
				movie.setPiece(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return movie;
	}
	
	/*
	public ArrayList<String> getTitleList() {
		ArrayList<String> titleList = new ArrayList<>();
		String sql = "";
		sql += "SELECT title FROM movie_temp";
		try {
			Statement stat = conn.createStatement();
			ResultSet res = stat.executeQuery(sql);
			while(res.next()) {
				titleList.add(res.getString("title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return titleList;
	}
	*/
	
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
	
	public String getAvailStart(String title) {
		String availStart = "";
		String sql = "";
		//sql += "SELECT start_date, end_date FROM movie WHERE title = ?";
		sql += "SELECT distinct holdDate FROM ticket WHERE title = ? AND ROWNUM = 1";
		sql += " ORDER BY holdDate ASC";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				availStart = res.getString("holdDate");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return availStart;
	}
	
	public String getAvailEnd(String title) {
		String availEnd = "";
		String sql = "";
		//sql += "SELECT start_date, end_date FROM movie WHERE title = ?";
		sql += "SELECT * FROM";
		sql += " (SELECT distinct holdDate FROM ticket WHERE title = ?";
		sql += " ORDER BY holdDate DESC) WHERE ROWNUM = 1";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				availEnd = res.getString("holdDate");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return availEnd;
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
				/* 영화관 중복제거
				if(!theaterList.contains(res.getString("theaterName"))) {
					theaterList.add(res.getString("theaterName"));
				}
				*/
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
				/* 시간 중복제거
				if(!timeList.contains(res.getString("time"))) {
					timeList.add(res.getString("time"));
				}
				*/
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
	
	// 로그인 연결 후 user_id 인자로 추가해야함
	public int setTicketStatus(String ticketID) {
		int res = 0;
		String sql = "";
		sql += "INSERT INTO ticket_status (ticketID, user_id)";
		sql += " VALUES (?, 'iwbapg')";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, ticketID);
			res = pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public ArrayList<TicketVO> getMyTList(String user_id) {
		ArrayList<TicketVO> ticketList = new ArrayList<>();
		String sql = "";
		sql += "SELECT ti.ticketID, ti.holdDate, ti.time, ti.seatNum, ti.title, ts.user_id, ts.Btime";
		sql += " FROM ticket ti, ticket_status ts";
		sql += " WHERE ti.ticketID = ts.ticketID";
		sql += " AND ts.user_id = ?";
		sql += " ORDER BY ts.Btime";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, user_id);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				TicketVO ticket = new TicketVO();
				ticket.setInfo(res);
				ticketList.add(ticket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ticketList;
	}
}
