package com.kay87.team.vo;

public class MemberInfo {
	private String id;
	private String password;
	private String nameKana;
	private String name;
	private String address;
	private String addrHurikana;
	private long tel;
	private String email;
	private String alarm;
	private String grade;
	private String first;
	private String memberStatus;
	public MemberInfo(String id, String password, String nameKana, String name, String address, String addrHurikana,
			long tel, String email, String alarm, String grade, String first, String memberStatus) {
		super();
		this.id = id;
		this.password = password;
		this.nameKana = nameKana;
		this.name = name;
		this.address = address;
		this.addrHurikana = addrHurikana;
		this.tel = tel;
		this.email = email;
		this.alarm = alarm;
		this.grade = grade;
		this.first = first;
		this.memberStatus = memberStatus;
	}
	public MemberInfo() {
		super();
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
	public String getAddrHurikana() {
		return addrHurikana;
	}
	public void setAddrHurikana(String addrHurikana) {
		this.addrHurikana = addrHurikana;
	}
	public long getTel() {
		return tel;
	}
	public void setTel(long tel) {
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
				+ ", address=" + address + ", addrHurikana=" + addrHurikana + ", tel=" + tel + ", email=" + email
				+ ", alarm=" + alarm + ", grade=" + grade + ", first=" + first + ", memberStatus=" + memberStatus + "]";
	}
	
	
	
	
	
	
}
