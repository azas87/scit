package com.kay87.team.vo;

public class MemberInfo {
	private String id;
	private String password;
	private String nameKana;
	private String name;
	private String address;
	private int tel;
	private String email;
	private String alarm;
	private int wish1;
	private int wish2;
	private int wish3;
	private int wish4;
	private int wish5;
	private String grade;
	private String first;
	private String memberStatus;
	
	public MemberInfo() {
		super();
	}

	public MemberInfo(String id, String password, String nameKana, String name, String address, int tel,
			String email, String alarm, int wish1, int wish2, int wish3, int wish4, int wish5, String grade,
			String first, String memberStatus) {
		super();
		this.id = id;
		this.password = password;
		this.nameKana = nameKana;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.alarm = alarm;
		this.wish1 = wish1;
		this.wish2 = wish2;
		this.wish3 = wish3;
		this.wish4 = wish4;
		this.wish5 = wish5;
		this.grade = grade;
		this.first = first;
		this.memberStatus = memberStatus;
	}

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

	public String getNameKana() {
		return nameKana;
	}

	public void setNameKana(String nameKana) {
		this.nameKana = nameKana;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTel() {
		return tel;
	}

	public void setTel(int tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAlarm() {
		return alarm;
	}

	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}

	public int getWish1() {
		return wish1;
	}

	public void setWish1(int wish1) {
		this.wish1 = wish1;
	}

	public int getWish2() {
		return wish2;
	}

	public void setWish2(int wish2) {
		this.wish2 = wish2;
	}

	public int getWish3() {
		return wish3;
	}

	public void setWish3(int wish3) {
		this.wish3 = wish3;
	}

	public int getWish4() {
		return wish4;
	}

	public void setWish4(int wish4) {
		this.wish4 = wish4;
	}

	public int getWish5() {
		return wish5;
	}

	public void setWish5(int wish5) {
		this.wish5 = wish5;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", password=" + password + ", nameKana=" + nameKana + ", name=" + name
				+ ", address=" + address + ", tel=" + tel + ", email=" + email + ", alarm=" + alarm + ", wish1=" + wish1
				+ ", wish2=" + wish2 + ", wish3=" + wish3 + ", wish4=" + wish4 + ", wish5=" + wish5 + ", grade=" + grade
				+ ", first=" + first + ", memberStatus=" + memberStatus + "]";
	}
	
	
}
