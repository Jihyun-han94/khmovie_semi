package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLRecoverableException;
import java.sql.Statement;

import user.UserVO;

//DAO(Data Access Object)
//  데이터 베이스 접속과 관련된 메서드를 정의
public class UserDAO {
	private final String table = "User_info";
	private Connection conn = null;
	private Statement stat = null;
	private PreparedStatement pstat = null;
	
	public UserDAO() {
		this.connect();
	}
	
	public UserVO login(String userid, String password) {
		UserVO m = new UserVO();
		
		String sql = "";
		sql += "SELECT * FROM " + this.table;
		sql += " WHERE userid = ?";
		sql += "   AND password = ?";
		System.out.println(sql);
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, userid);
			this.pstat.setString(2, password);
			ResultSet res = this.pstat.executeQuery();
			if(res.next()) {
				m.setRecord(res);
			}
			res.close();
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return m;
	}
	
	public UserVO getRecord(String userid) {
		// SQL 질의문 작성
		String sql = "SELECT * FROM member_t WHERE userid = '" + userid + "'";
		UserVO m = null;
		try {
			// SQL 질의문 실행
			ResultSet res = this.stat.executeQuery(sql);
			if(res.next()) {
				m = new UserVO(
					res.getString("user_id"), res.getString("user_pw"),
					res.getString("user_name"),	res.getInt("gender"),
					res.getString("email"), res.getString("phone_number"),
					res.getInt("purchase"), res.getInt("grade"), res.getString("birth_date")
				);
			}
			res.close();
		} catch (SQLException e) {
			System.out.println("UserVO.java -> getRecord() : " + e.getMessage());
		}
		
		return m;
	}
	
	private void connect() {
		try {
			// JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("JDBC 드라이버 로딩 완료!");
			
			// 접속 정보 작성
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String user = "maweb";
			String password = "admin";
			
			// DB 접속 객체 생성 및 접속 시도
			this.conn = DriverManager.getConnection(url, user, password);
			System.out.println("Oracle DB 접속 완료!");
			
			// SQL 구문 작업용 객체 생성
			this.stat = this.conn.createStatement();
			
		} catch (ClassNotFoundException e) {
			System.out.println("MemberDAO.java -> connect() : " + e.getMessage());
		} catch (SQLRecoverableException e) {    // 접속 IP/Port 오류
			System.out.println("MemberDAO.java -> connect() : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("MemberDAO.java -> connect() : " + e.getMessage());
		}
	}
	
	public void close() {
		// 모든 JDBC 관련 생성 객체 정보 close()
		try {
			this.stat.close();
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
