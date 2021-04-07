package Member;

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
	
	MemberDAO(){
		this.conn = new DBConnection("50000", "web_admin", "admin").getConnect();
	}
	
	public int registerCheck(String userId) {
		ResultSet res = null;
		
		String sql = "SELECT * FROM " + table + " WHERE User_Id = ?";
		try {
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, userId);
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

	public MemberVO login(String username, String password) {
		
		return null;
	}

}
