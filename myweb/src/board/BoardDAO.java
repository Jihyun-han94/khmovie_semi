package board;
import java.sql.*;
import java.util.ArrayList;



public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement pstat = null;
	
	public BoardDAO() {
		this.connect();
	}
	private void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		System.out.println("JDBC 드라이버 로딩 완료!");
		
		//접속 정보 작성
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "myweb";
		String password = "admin";
		
		//DB 접속 객체 생성 및 접속 시도
		try {
			this.conn = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Oracle DB 접속 완료!");
	}
	

	public BoardVO getRecord(String B_TITLE) {
		
		String sql = "SELECT * FROM Board_t WHERE B_TITLE=?";
		BoardVO record = null;
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1,B_TITLE);
			ResultSet res = this.pstat.executeQuery();
			
			if(res.next()) {
				record = new BoardVO(
						res.getInt("B_NUM"), res.getString("B_ID"),
						res.getString("B_TITLE"),res.getString("B_CONTEXT"),
						res.getString("B_DIRECT"),res.getString("B_ARTIST"),
						res.getDate("CREATE_DATE"),res.getDate("UPDATE_DATE")
						);
			}
			res.close();
			System.out.println("쿼리문 vo객체에 저장완료, B_NUM"+record.getB_NUM());
			System.out.println(record.getB_TITLE());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return record;
	}
	public ArrayList<BoardVO> getAll(){
		String sql ="";
	    sql += "SELECT * FROM Board_t";
	      sql += " ORDER BY B_NUM DESC";
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();
	    System.out.println("쿼리문완료1");
		try {
			this.pstat = this.conn.prepareStatement(sql);
			ResultSet res = this.pstat.executeQuery();
		    System.out.println("쿼리문완료2");
			while(res.next()) {
				records.add(new BoardVO(
						res.getInt("B_NUM"), res.getString("B_ID"),
						res.getString("B_TITLE"),res.getString("B_CONTEXT"),
						res.getString("B_DIRECT"),res.getString("B_ARTIST"),
						res.getDate("CREATE_DATE"),res.getDate("UPDATE_DATE")
						));
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getall완료");
		return records;
	}
	
	public int upload(BoardVO filedata) {
		String SQL = "INSERT INTO FILE_T VALUES(file_seq.NEXTVAL,?,?,?)";
		try {
			this.pstat = this.conn.prepareStatement(SQL);
			this.pstat.setString(1, filedata.getMovietitle());
			this.pstat.setString(2, filedata.getFileName());
			this.pstat.setString(3, filedata.getFileRealName());
			return pstat.executeUpdate(); //완료되면 1 return
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return -1;
	}
	

	public ArrayList<BoardVO> getfiles(){
		String sql ="";
	    sql += "SELECT * FROM FILE_t";
	      sql += " WHERE filenum<=12";
	      
		ArrayList<BoardVO> records = new ArrayList<BoardVO>();

		try {
			this.pstat = this.conn.prepareStatement(sql);
			ResultSet res = this.pstat.executeQuery();
		
			while(res.next()) {
				records.add(new BoardVO(
						res.getString("movietitle"),
						res.getString("fileName"),res.getString("fileRealName")
						));
			}
			res.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("getall완료");
		return records;
	}

	
	
	public int saveData(BoardVO data) {
		int result =0;
		String sql ="";
		 sql += "INSERT INTO Board_t (B_NUM, B_ID, B_TITLE, B_CONTEXT, B_DIRECT, B_ARTIST)";
	     sql += "     VALUES(board_seq.NEXTVAL, ?, ?, ?, ?, ?)";
		
	     try {
			this.pstat = this.conn.prepareStatement(sql);
			this.pstat.setString(1, data.getB_ID());
			this.pstat.setString(2, data.getB_TITLE());
			this.pstat.setString(3, data.getB_CONTEXT());
			this.pstat.setString(4, data.getB_DIRECT());
			this.pstat.setString(5, data.getB_ARTIST());
			
			result = this.pstat.executeUpdate();
			System.out.println("쿼리문 저장 완료"+result);
			
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
