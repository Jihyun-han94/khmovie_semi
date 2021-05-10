package Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import board.BoardVO;
import main.DBConnection;

public class CommentDAO {
	private Connection conn = null;
	private PreparedStatement pstat = null;
	
	public CommentDAO() {
		this.connect();
	}
	private void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		System.out.println("JDBC 드라이버 로딩 완료!");
		
		this.conn = new DBConnection().getConnect();
		System.out.println("Oracle DB 접속 완료!");
	}
	
	public ArrayList<CommentVO> getAll(){
		String sql ="";
	    sql += "SELECT * FROM COMMENT_t";
	      sql += " ORDER BY C_NUM DESC";
		ArrayList<CommentVO> records = new ArrayList<CommentVO>();
	    
		try {
			this.pstat = this.conn.prepareStatement(sql);
			ResultSet res = this.pstat.executeQuery();
		    
			while(res.next()) {
				records.add(new CommentVO(
						res.getInt("B_NUM"), res.getString("B_TITLE"),
						res.getInt("C_NUM"),res.getString("C_USERID"),
						res.getString("C_COMMENT"),
						res.getDate("CREATEDATE"),res.getDate("UPDATEDATE")
						));
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getall완료");
		return records;
	}
	
	public ArrayList<CommentVO> getRecord(int B_NUM) {
		
		String sql = "SELECT * FROM COMMENT_t WHERE B_NUM=?";
		ArrayList<CommentVO> record = new ArrayList<CommentVO>();
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setInt(1,B_NUM);
			ResultSet res = this.pstat.executeQuery();
			
			while(res.next()) {
				record.add(new CommentVO(
						res.getInt("B_NUM"), res.getString("B_TITLE"),
						res.getInt("C_NUM"),res.getString("C_USERID"),
						res.getString("C_COMMENT"),
						res.getDate("CREATEDATE"),res.getDate("UPDATEDATE")
						));
			
			}
			res.close();
		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return record;
	}
	
	
	
	public int saveData(CommentVO data) {
		int result = 0;
		
		String sql="";
		sql +="INSERT INTO COMMENT_T(B_NUM, B_TITLE, C_NUM, C_USERID, C_COMMENT)";	
		sql += "     VALUES(?, ?,comment_seq.NEXTVAL, ?, ?)";
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setInt(1, data.getB_NUM());
			this.pstat.setString(2, data.getB_TITLE());
			this.pstat.setString(3, data.getC_USERID());
			this.pstat.setString(4, data.getC_COMMENT());
			
			result = this.pstat.executeUpdate();
			System.out.println("댓글 쿼리문 저장완료"+result);
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
}
