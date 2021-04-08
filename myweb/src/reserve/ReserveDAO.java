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
		this.conn = new DBConnection("50000").getConnect();
		this.tbId = 2104;
	}
	
	public ReserveDAO(String tbId) {
		this.conn = new DBConnection("50000").getConnect();
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
	
	public ArrayList<String> getDateNprice(String title) {
		ArrayList<String> getDateNprice = new ArrayList<>();
		String sql = "";
		sql += "SELECT start_date, end_date, price FROM movie WHERE title = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				getDateNprice.add(res.getString("start_date"));
				getDateNprice.add(res.getString("end_date"));
				getDateNprice.add(res.getString("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getDateNprice;
	}
	
	public ArrayList<String> getTheater(String title, String date) {
		ArrayList<String> theaterList = new ArrayList<>();
		String sql = "";
		sql += "SELECT th.theaterName";
		sql += " FROM theater th, ticket ti WHERE th.theaterID = ti.theaterID";
		sql += " AND title = ? AND holdDate = ?";
		sql += " ORDER BY th.theaterName ASC";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			pstat.setString(2, date);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				// 영화관 중복제거
				if(!theaterList.contains(res.getString("theaterName"))) {
					theaterList.add(res.getString("theaterName"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return theaterList;
	}
	
	public ArrayList<String> getTime(String title, String date, String theaterName) {
		ArrayList<String> timeList = new ArrayList<>();
		String sql = "";
		sql += "SELECT ti.time";
		sql += " FROM ticket ti, theater th WHERE ti.theaterID = th.theaterID";
		sql += " AND ti.title = ? AND ti.holdDate = ? AND th.theaterName = ?";
		sql += "ORDER BY ti.time ASC";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, title);
			pstat.setString(2, date);
			pstat.setString(3, theaterName);
			ResultSet res = pstat.executeQuery();
			while(res.next()) {
				// 시간 중복제거
				if(!timeList.contains(res.getString("time"))) {
					timeList.add(res.getString("time"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return timeList;
	}
	
	public ArrayList<String> getSeatNum(String title, String date, String theaterName, String time) {
		ArrayList<String> seatNumList = new ArrayList<>();
		String sql = "";
		sql += "SELECT ti.seatNum";
		sql += " FROM ticket ti, theater th WHERE ti.theaterID = th.theaterID";
		sql += " AND ti.booked IS NULL";
		sql += " AND ti.title = ? AND ti.holdDate = ? AND th.theaterName = ? AND ti.time = ?";
		sql += "ORDER BY ti.seatNum ASC";
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
		sql += " FROM ticket ti JOIN theater th ON ti.theaterID = th.theaterID";
		sql += " WHERE ti.title = ?";
		sql += " AND ti.holdDate = ?";
		sql += " AND th.theaterName = ?";
		sql += " AND ti.time = ?";
		sql += " AND ti.seatNum IN (";
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
}
