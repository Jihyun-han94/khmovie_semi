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
	
	public int checkId(String userid) {
		ResultSet res = null;
		String sql = "SELECT * FROM " + table;
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
	
	
	public void close() {
		try {
			this.pstat.close();
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public MemberVO login(String userid, String userpw) {
		return null;
	}
	
	private void setPreStatement(String sql) throws SQLException {
		this.pstat = this.conn.prepareStatement(sql);
	}

}
