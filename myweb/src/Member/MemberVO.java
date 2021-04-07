package Member;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberVO {
	private String user_id = null;
	private String user_pw = null;
	private String user_name = null;
	private String email = null;
	private String phone_number =null;
	private String birth_date = null;
	private int gender;
	private int purchase;
	private int grande;
	public MemberVO(String user_id) {
		this.user_id = user_id;
	}
	
	public MemberVO() {}

	public String getUserId() {
		return user_id;
	}
	public void setUserId(String user_id) {
		this.user_id = user_id;
	}
	public String getUserPw() {
		return user_pw;
	}
	public void setUserPw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUserName() {
		return user_name;
	}
	public void setUserName(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phone_number;
	}
	public void setPhoneNumber(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getBirthDate() {
		return birth_date;
	}
	public void setBirthDate(String birth_date) {
		this.birth_date = birth_date;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getPurchase() {
		return purchase;
	}
	public void setPurchase(int purchase) {
		this.purchase = purchase;
	}
	public int getGrande() {
		return grande;
	}
	public void setGrande(int grande) {
		this.grande = grande;
	}

	public void setRecord(ResultSet res) throws SQLException {
		this.user_id = res.getString("userId");
		this.user_pw = res.getString("userPw");
		this.user_name = res.getString("userName");
		this.email = res.getString("userEmail");
		this.phone_number = res.getString("phoneNumber");
		this.birth_date = res.getString("birthDate");
		this.gender = res.getInt("userGender");
		this.purchase = res.getInt("purchase");
		this.grande = res.getInt("grande");
	}
	
}
