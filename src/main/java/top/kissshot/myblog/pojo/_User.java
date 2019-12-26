package top.kissshot.myblog.pojo;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

//@JsonIgnoreProperties({ "handler", "jibernateLazyInitializer" })
public class _User {
	private int uid;
	private int role;
	private String name;
	private String pwd;
	private int age;
	private String gender;
	private String email;
	private String motto;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMotto() {
		return motto;
	}

	public void setMotto(String motto) {
		this.motto = motto;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", role=" + role + ", name=" + name + ", pwd=" + pwd + ", age=" + age + ", gender="
				+ gender + ", email=" + email + ", motto=" + motto + "]";
	}

}