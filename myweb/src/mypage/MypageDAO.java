package mypage;

import java.sql.*;

// DAO(Data Access Object)
//     데이터 베이스 접속과 관련된 메서드를 정의
public class MypageDAO {
	private Connection conn = null;
	private Statement stat = null;
	
	public MypageDAO() {
		this.connect();
	}

	public MypageVO getRecord(String userid) {
		// SQL 질의문 작성
		String sql = "SELECT * FROM User_info WHERE user_id = '" + userid + "'";
		MypageVO m = null;
		try {
			// SQL 질의문 실행
			ResultSet res = this.stat.executeQuery(sql);
			if(res.next()) {
				m = new MypageVO(
						res.getString("user_id"), res.getString("user_pw"), res.getString("user_name"),
						res.getString("email"), res.getString("phone_number"), res.getString("birth_date"),
						res.getInt("gender"), res.getInt("purchase"), res.getInt("grade")
				);
			}
			res.close();
		} catch (SQLException e) {
			System.out.println("MypageDAO.java -> getRecord() : " + e.getMessage());
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
