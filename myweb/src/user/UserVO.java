package user;

import java.sql.ResultSet;
import java.sql.SQLException;

// VO(Value Object)
//     데이터베이스에 보내거나 받을 레코드 데이터에 대해 객체로 정의하여 Java 에서
//     다루기 위해 정의 (DTO - Data Transfer Object)
public class UserVO {
	private String userid = null;
	private String password = null;
	private String username = null;
	private int gender = 0;
	private String email = null;
	private String phone = null;
	private int purchase = 0;
	private int grade = 0;
	private String birth = null;
	
	public UserVO() {}
	
	public UserVO(String userid, String password, String username, int gender,
			String email, String phone, int purchase, int grade, String birth) {
		this.userid = userid;
		this.password = password;
		this.username = username;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.purchase = purchase;
		this.grade = grade;
		this.birth = birth;
	}
	
	public void setRecord(ResultSet result) throws SQLException {
		
		this.password = result.getString("password");
		this.email = result.getString("email");
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	
	
}
