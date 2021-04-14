package board;

import java.sql.Date;

public class BoardVO {
	
	private int B_NUM ;
	private String B_ID ;
	private String B_TITLE ;
	private String B_DIRECT ;
	private String B_ARTIST ;
	private String B_CONTEXT ;
	private Date CREATE_DATE ;
	private Date UPDATE_DATE ;
	private String movietitle;
	private String fileName;
	private String fileRealName;
	private int filenum;
	
	public BoardVO(String movietitle, String fileName, String fileRealName) {
		this.filenum = -1;
		this.movietitle = movietitle;
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}
	
	
	
	public BoardVO(int B_NUM, String B_ID, String B_TITLE, String B_DIRECT,String B_ARTIST, String B_CONTEXT, Date CREATE_DATE, Date UPDATE_DATE) {
		this.B_NUM = B_NUM;
		this.B_ID = B_ID;
		this.B_TITLE = B_TITLE;
		this.B_DIRECT = B_DIRECT;
		this.B_ARTIST = B_ARTIST;
		this.B_CONTEXT = B_CONTEXT;
		this.CREATE_DATE = CREATE_DATE;
		this.UPDATE_DATE = UPDATE_DATE;
		
	}
	public BoardVO(String B_ID,String B_TITLE, String B_DIRECT,String B_ARTIST,String B_CONTEXT) {
		this.B_NUM = -1;
		this.B_ID = B_ID;
		this.B_TITLE = B_TITLE;
		this.B_DIRECT = B_DIRECT;
		this.B_ARTIST = B_ARTIST;
		this.B_CONTEXT = B_CONTEXT;
		this.CREATE_DATE = null;
		this.UPDATE_DATE = null;
	}
	public int getB_NUM() {
		return B_NUM;
	}
	public void setB_NUM(int b_NUM) {
		B_NUM = b_NUM;
	}
	public String getB_ID() {
		return B_ID;
	}
	public void setB_ID(String b_ID) {
		B_ID = b_ID;
	}
	public String getB_TITLE() {
		return B_TITLE;
	}
	public void setB_TITLE(String b_TITLE) {
		B_TITLE = b_TITLE;
	}
	public String getB_DIRECT() {
		return B_DIRECT;
	}
	public void setB_DIRECT(String b_DIRECT) {
		B_DIRECT = b_DIRECT;
	}
	public String getB_ARTIST() {
		return B_ARTIST;
	}
	public void setB_ARTIST(String b_ARTIST) {
		B_ARTIST = b_ARTIST;
	}
	public String getB_CONTEXT() {
		return B_CONTEXT;
	}
	public void setB_CONTEXT(String b_CONTEXT) {
		B_CONTEXT = b_CONTEXT;
	}
	public Date getCREATE_DATE() {
		return CREATE_DATE;
	}
	public void setCREATE_DATE(Date cREATE_DATE) {
		CREATE_DATE = cREATE_DATE;
	}
	public Date getUPDATE_DATE() {
		return UPDATE_DATE;
	}
	public void setUPDATE_DATE(Date uPDATE_DATE) {
		UPDATE_DATE = uPDATE_DATE;
	}




	public String getMovietitle() {
		return movietitle;
	}
	
	
	
	public void setMovietitle(String movietitle) {
		this.movietitle = movietitle;
	}
	
	
	
	public String getFileName() {
		return fileName;
	}
	
	
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
	public String getFileRealName() {
		return fileRealName;
	}
	
	
	
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	
	
	public int getFilenum() {
		return filenum;
	}
	
	
	
	public void setFilenum(int filenum) {
		this.filenum = filenum;
	}
}