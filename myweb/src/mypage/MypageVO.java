package mypage;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MypageVO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String email;
	private String phone_number;
	private String birth_date;
	private int gender;
	private int purchase;
	private int grade;
	
	public MypageVO(String user_id) {
		this.user_id = user_id;
	}
	
	public MypageVO() {}

	public MypageVO(String user_id, String user_pw, String user_name, String email, String phone_number, String birth_date,
			int gender, int purchase, int grade) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.email = email;
		this.phone_number = phone_number;
		this.birth_date = birth_date;
		this.gender = gender;
		this.purchase = purchase;
		this.grade = grade;
	}

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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}

	public void setRecord(ResultSet res) throws SQLException {
		this.user_id = res.getString("user_id");
		this.user_pw = res.getString("user_pw");
		this.user_name = res.getString("user_name");
		this.email = res.getString("email");
		this.phone_number = res.getString("phone_number");
		this.birth_date = res.getString("birth_date");
		this.gender = res.getInt("gender");
		this.purchase = res.getInt("purchase");
		this.grade = res.getInt("grade");
	}
	
}
