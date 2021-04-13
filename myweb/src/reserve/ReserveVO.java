package reserve;

import java.sql.*;

public class ReserveVO {
	// movie 테이블 컬럼
	private String title;
	private String start_date;
	private String end_date;
	private int price;
	private int limit;
	private String direct;
	private String artist;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
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
			this.start_date = res.getString("start_date");
			this.end_date = res.getString("end_date");
			this.price = res.getInt("price");
			this.limit = res.getInt("limit");
			this.direct = res.getString("direct");
			this.artist = res.getString("artist");
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
}
