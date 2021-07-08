package com.test.dto;

public class MemberVO {
	private String id;
	   private String password;
	   private String name;
	   private String gender;
	   private String birthday;
	   private String email;
	   private String phone;
	   private String address;
	   private String question;
	   private String answer;
	   private String ent_name;
	   private String ent_num;
	   private String ent_phone;
	   private String ent_address;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getEnt_name() {
		return ent_name;
	}
	public void setEnt_name(String ent_name) {
		this.ent_name = ent_name;
	}
	public String getEnt_num() {
		return ent_num;
	}
	public void setEnt_num(String ent_num) {
		this.ent_num = ent_num;
	}
	public String getEnt_phone() {
		return ent_phone;
	}
	public void setEnt_phone(String ent_phone) {
		this.ent_phone = ent_phone;
	}
	public String getEnt_address() {
		return ent_address;
	}
	public void setEnt_address(String ent_address) {
		this.ent_address = ent_address;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", password=" + password + ", name=" + name + ", gender=" + gender + ", birthday="
				+ birthday + ", email=" + email + ", phone=" + phone + ", address=" + address + ", question=" + question
				+ ", answer=" + answer + ", ent_name=" + ent_name + ", ent_num=" + ent_num + ", ent_phone=" + ent_phone
				+ ", ent_address=" + ent_address + "]";
	}
}
