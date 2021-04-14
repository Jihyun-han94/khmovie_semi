package comment;

import java.sql.Timestamp;

public class CommentVO {
	//댓글 VO
	private int cnum;
	private String cid;
	private int cparentnum;
	private String ccontent;
	private Timestamp cdate;
	private int ccount;
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public int getCparentnum() {
		return cparentnum;
	}
	public void setCparentnum(int cparentnum) {
		this.cparentnum = cparentnum;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	public int getCcount() {
		return ccount;
	}
	public void setCcount(int ccount) {
		this.ccount = ccount;
	}
}
