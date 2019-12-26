package top.kissshot.myblog.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class User {
	private Integer uid;

	private Integer role;

	private String name;

	private String pwd;

	private String email;

	private Integer age;

	private String gender;

	private String motto;

	private Date date;

	private String easyDate;

	public User(String name, String pwd) {
		this.name = name;
		this.pwd = pwd;
	}

	public User() {
		super();
//		transEasyDate();
	}

	public String getSimpleDate() {
		return easyDate;
	}

	public void setSimpleDate(String easyDate) {
		this.easyDate = easyDate;
	}

	public void transEasyDate() {
		this.easyDate = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(date);
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd == null ? null : pwd.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender == null ? null : gender.trim();
	}

	public String getMotto() {
		return motto;
	}

	public void setMotto(String motto) {
		this.motto = motto == null ? null : motto.trim();
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", role=" + role + ", name=" + name + ", pwd=" + pwd + ", email=" + email + ", age="
				+ age + ", gender=" + gender + ", motto=" + motto + ", date=" + date + ", easyDate=" + easyDate + "]";
	}

}