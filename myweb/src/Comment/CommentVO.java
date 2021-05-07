package Comment;

import java.sql.Date;

public class CommentVO {
	
	private int B_NUM;
	private String B_TITLE;
	private int C_NUM;
	private String C_USERID;
	private String C_COMMENT;
	private Date CREATEDATE;
	private Date UPDATEDATE;
	

	public CommentVO(int B_NUM, String B_TITLE, String C_USERID, String C_COMMENT ) {
		this.B_NUM = B_NUM;
		this.B_TITLE = B_TITLE;
		this.C_USERID  = C_USERID;
		this.C_COMMENT = C_COMMENT;
	}
	
	public CommentVO(int B_NUM, String B_TITLE, int C_NUM , String C_USERID, String C_COMMENT, Date CREATEDATE, Date UPDATEDATE) {
		this.B_NUM = B_NUM;
		this.B_TITLE = B_TITLE;
		this.C_USERID  = C_USERID;
		this.C_COMMENT = C_COMMENT;
		this.UPDATEDATE = null;
		this.CREATEDATE = null;
	}
	
	public int getB_NUM() {
		return B_NUM;
	}

	public void setB_NUM(int b_NUM) {
		B_NUM = b_NUM;
	}

	public String getB_TITLE() {
		return B_TITLE;
	}

	public void setB_TITLE(String b_TITLE) {
		B_TITLE = b_TITLE;
	}

	public int getC_NUM() {
		return C_NUM;
	}

	public void setC_NUM(int c_NUM) {
		C_NUM = c_NUM;
	}

	public String getC_USERID() {
		return C_USERID;
	}

	public void setC_USERID(String c_USERID) {
		C_USERID = c_USERID;
	}

	public String getC_COMMENT() {
		return C_COMMENT;
	}

	public void setC_COMMENT(String c_COMMENT) {
		C_COMMENT = c_COMMENT;
	}

	public Date getCREATEDATE() {
		return CREATEDATE;
	}

	public void setCREATEDATE(Date cREATEDATE) {
		CREATEDATE = cREATEDATE;
	}

	public Date getUPDATEDATE() {
		return UPDATEDATE;
	}

	public void setUPDATEDATE(Date uPDATEDATE) {
		UPDATEDATE = uPDATEDATE;
	}
	
}
