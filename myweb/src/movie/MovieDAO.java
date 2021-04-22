package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import main.DBConnection;


public class MovieDAO {
	private final String table = "movie";
	private Connection conn = null;
	private PreparedStatement pstat = null;
	private Statement stat = null;

	public MovieDAO() {
		this.conn = new DBConnection().getConnect();
	}
	
	public ArrayList<MovieVO> getAll(){
		ArrayList<MovieVO> movieList = new ArrayList<>();
		
		String sql = "SELECT * FROM " + table;
		
		try {
			this.pstat = this.conn.prepareStatement(sql);
			ResultSet res = this.pstat.executeQuery();
			while(res.next()) {
				movieList.add(new MovieVO(
					res.getString("title"),
					res.getInt("price"),
					res.getString("direct"),
					res.getString("artist")
					
				));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return movieList;
	}
}
