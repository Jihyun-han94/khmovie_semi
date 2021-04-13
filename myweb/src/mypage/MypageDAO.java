package mypage;

import java.sql.*;

import main.DBConnection;

// DAO(Data Access Object)
//     데이터 베이스 접속과 관련된 메서드를 정의
public class MypageDAO {
	private Connection conn = null;
	private Statement stat = null;
	private PreparedStatement pstat = null;
	
	public MypageDAO() {
		this.connect();
	}

	public MypageVO getRecord(String userid) {
		// SQL 질의문 작성
		String sql = "SELECT * FROM User_info WHERE user_id = '" + userid + "'";
		MypageVO m = null;
		try {
			// SQL 질의문 실행 //stat로 sql 불러 올 때 실행되지 않음.
			this.pstat = this.conn.prepareStatement(sql);
			ResultSet res = this.pstat.executeQuery();
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
	
	public int updateData(MypageVO data) {
		int result = 0;
		String sql = "";
		sql += "UPDATE USER_INFO";
		sql += "   SET USER_PW=?";
		sql += "     , EMAIL=?";
		sql += "     , PHONE_NUMBER=?";
		sql += " WHERE USER_ID=?";
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, data.getUserPw());
			this.pstat.setString(2, data.getEmail());
			this.pstat.setString(3, data.getPhoneNumber());
			this.pstat.setString(4, data.getUserId());
			
			result = this.pstat.executeUpdate();    // 저장 처리가 완료 되면 1 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteData(String userid) {

		int result = 0;    // 삭제 처리 유무를 판별
		String sql = "";
		sql += "DELETE FROM user_info";
		sql += " WHERE user_id = ?";
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, userid);
			
			result = this.pstat.executeUpdate();    // 삭제 처리가 완료 되면 1 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	private void connect() {
		try {
			// JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("JDBC 드라이버 로딩 완료!");
			
			// DB 접속 객체 생성 및 접속 시도
			this.conn = new DBConnection().getConnect();
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
			this.pstat.close();
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
