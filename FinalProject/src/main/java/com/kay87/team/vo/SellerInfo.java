package com.kay87.team.vo;

public class SellerInfo {
	private String id;
	private String star;
	private String name;
	private String nameKana;
	private String address;
	private String wish;
	
	public SellerInfo(String id, String star, String name, String nameKana, String address, String wish) {
		super();
		this.id = id;
		this.star = star;
		this.name = name;
		this.nameKana = nameKana;
		this.address = address;
		this.wish = wish;
	}

	public SellerInfo() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameKana() {
		return nameKana;
	}

	public void setNameKana(String nameKana) {
		this.nameKana = nameKana;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWish() {
		return wish;
	}

	public void setWish(String wish) {
		this.wish = wish;
	}

	@Override
	public String toString() {
		return "SellerInfo [id=" + id + ", star=" + star + ", name=" + name + ", nameKana=" + nameKana + ", address="
				+ address + ", wish=" + wish + "]";
	}
	
	
	
}
