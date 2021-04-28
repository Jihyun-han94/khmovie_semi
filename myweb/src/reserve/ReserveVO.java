package reserve;

import java.sql.*;

public class ReserveVO {
	// movie 테이블 컬럼
	private String title;
	private int price;
	private String direct;
	private String artist;

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

	public void setPiece(ResultSet res) {
		try {
			this.title = res.getString("title");
			this.price = res.getInt("price");
			this.direct = res.getString("direct");
			this.artist = res.getString("artist");
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}