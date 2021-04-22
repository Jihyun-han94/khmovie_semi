package movie;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MovieVO {
	private String title;
	private int price;
	private String direct;
	private String artist;
	
	public MovieVO(String title) {
		this.title = title;
	}
	
	public MovieVO(String title, int price, String direct, String artist) {
		this.title = title;
		this.price = price;
		this.direct = direct;
		this.artist = artist;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDirect() {
		return direct;
	}
	public void setDirect(String direct) {
		this.direct = direct;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	
	public void setRecord(ResultSet res) throws SQLException {
		this.title = res.getString("title");
		this.price = res.getInt("price");
		this.direct = res.getString("direct");
		this.artist = res.getString("artist");
	}
}
