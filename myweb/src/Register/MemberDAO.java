package Register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import main.DBConnection;

public class MemberDAO {
	private final String table = "User_info";
	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;
	static MemberDAO instance;
	
	
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		
		return instance;
	}
	
	public MemberDAO(){
		this.conn = new DBConnection("50000", "web_admin", "admin").getConnect();
	}

	public int register(String userid, String userpw1, String username, String usergender, String useremail, String userphonenumber, String userbirthdate) {
		String sql = "INSERT INTO "+ this.table +" (USER_ID, USER_PW, USER_NAME, GENDER, EMAIL, PHONE_NUMBER, BIRTH_DATE)";
		sql += " VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		ResultSet res = null;
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			pstat.setString(1, userid);
			pstat.setString(2, userpw1);
			pstat.setString(3, username);
			pstat.setInt(4, Integer.parseInt(usergender));
			pstat.setString(5, useremail);
			pstat.setString(6, userphonenumber);
			pstat.setString(7, userbirthdate);
			res = pstat.executeQuery();
			if(res.next()) {
				return 0;
			}
			else {
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		 return -1;
	}

	public ArrayList<MemberVO> getAll() {
		String sql = "SELECT * FROM " + table;
		sql += " ORDER BY USER_ID DESC";
		ArrayList<MemberVO> records = new ArrayList<MemberVO>();
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			ResultSet res = this.pstat.executeQuery();
			while(res.next()) {
				records.add(new MemberVO(
						res.getString("user_id"),
						res.getString("user_pw"),
						res.getString("user_name"),
						res.getInt("gender"),
						res.getString("email"),
						res.getString("phone_number"),
						res.getInt("purchase"),
						res.getInt("grade"),
						res.getString("birth_date")
				));
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return records;
	}
	
	public MemberVO getRecord(String userid) {
		MemberVO userinfo = null;
		String sql = "SELECT * FROM "+ this.table + " WHERE user_id = ?";
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, userid);
			ResultSet res = this.pstat.executeQuery();
			if(res.next()) {	
				userinfo = new MemberVO(
					res.getString("user_id"),
					res.getString("user_pw"),
					res.getString("user_name"),
					res.getInt("gender"),
					res.getString("email"),
					res.getString("phone_number"),
					res.getInt("purchase"),
					res.getInt("grade"),
					res.getString("birth_date")
				);				
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return userinfo;
	}
	
	public int checkId(String userid) {
		ResultSet res = null;
		String sql = "SELECT * FROM " + this.table;
		sql += " WHERE USER_ID=?";
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, userid);
			res = pstat.executeQuery();
			if(res.next()) {
				return 0;
			}
			else {
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public MemberVO login(String userid, String userpw) {
		MemberVO m = new MemberVO();
		
		String sql = "";
		sql += "SELECT * FROM " + this.table;
		sql += " WHERE USER_ID = ?";
		sql += "   AND USER_PW = ?";
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, userid);
			this.pstat.setString(2, userpw);
			ResultSet res = this.pstat.executeQuery();
			if(res.next()) {
				m.setRecord(res);
			}
			res.close();
		} catch(SQLException e) {
			e.getMessage();
		}
		
		return m;
	}

	public String findId(String username, String phone) {
		String userid = null;
		
		String sql = "SELECT USER_ID FROM " + this.table;
		sql += " WHERE USER_NAME = ?";
		sql += " AND PHONE_NUMBER = ?";
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, username);
			this.pstat.setString(2, phone);
			ResultSet res = this.pstat.executeQuery();
			if(res.next()) {
				userid = res.getString("user_id");
			}
			res.close();
		} catch(SQLException e) {
			e.getMessage();
		}
		
		return userid;
	}
	
	public String findPw(String username, String userid, String phone) {
		String userpw = null;
		
		String sql = "SELECT USER_PW FROM " + this.table;
		sql += " WHERE USER_NAME = ?";
		sql += " AND USER_ID = ?";
		sql += " AND PHONE_NUMBER = ?";
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, username);
			this.pstat.setString(2, userid);
			this.pstat.setString(3, phone);
			ResultSet res = this.pstat.executeQuery();
			if(res.next()) {
				userpw = res.getString("user_pw");
			}
			res.close();
		} catch(SQLException e) {
			e.getMessage();
		}
		
		return userpw;
	}
	
	public String sendnum(String phone) {
		int authNo = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
		String numkey = Integer.toString(authNo);
		System.out.println(numkey);
		return numkey;
	}
	
	public void close() {
		try {
			this.pstat.close();
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
