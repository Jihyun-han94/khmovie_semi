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
	static MemberDAO instance;
	
	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		
		return instance;
	}
	
	MemberDAO(){
		this.conn = new DBConnection("50000", "web_admin", "admin").getConnect();
	}

	public int register(String userid, String userpw1, String username, String usergender, String useremail, String userphonenumber, String userbirthdate) {
		String sql = "INSERT INTO " + table + "(USER_ID, USER_PW, USER_NAME, GENDER, EMAIL, PHONE_NUMBER, BIRTH_DATE)";
		sql += " VALUES (?, ?, ?, ?, ?, ?, ?)";
		
		int result = 0;
		
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, userid);
			pstat.setString(2, userpw1);
			pstat.setString(3, username);
			pstat.setInt(4, Integer.parseInt(usergender));
			pstat.setString(5, useremail);
			pstat.setString(6, userphonenumber);
			pstat.setString(7, userbirthdate);
			
			result = this.pstat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		 return result;
	}

	public MemberVO login(String username, String password) {
		
		return null;
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
					res.getString("user_id"), res.getString("user_pw"), res.getString("user_name"),
					res.getString("email"), res.getString("phone_number"), res.getString("brith_date"),
					res.getInt("gender"), res.getInt("purchase"), res.getInt("grande")
				));
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return records;
	}
	
	public boolean confirmId(String userid) {
		boolean result = false;
		String sql = "SELECT USER_ID FROM " + table + "WHERE USER_ID=?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, userid);
			ResultSet res = this.pstat.executeQuery();
			if(res.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void close() {
		try {
			this.pstat.close();
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void setPreStatement(String sql) throws SQLException {
		this.pstat = this.conn.prepareStatement(sql);
	}

}
