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
		this.conn = new DBConnection().getConnect();
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
	
	public int updateData(MypageVO info) {
		int result = 0;
		String sql = "";
		sql += "UPDATE user_info";
		sql += "   SET PHONE_NUMBER=?";
		sql += "     , EMAIL=?";
		sql += "     , USER_PW=?";
		sql += " WHERE USER_ID=?";
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, info.getPhoneNumber());
			this.pstat.setString(2, info.getEmail());
			this.pstat.setString(3, info.getUserPw());
			this.pstat.setString(4, info.getUserId());
			
			result = this.pstat.executeUpdate();    // 저장 처리가 완료 되면 1 반환
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
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
