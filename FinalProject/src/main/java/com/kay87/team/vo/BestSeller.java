package com.kay87.team.vo;

import java.util.Date;

public class BestSeller {
	private String fishName;
	private String location;
	private String unit;
	private int price;	
	private int cnt;
	public BestSeller(String fishName, String location, String unit, int price, int cnt) {
		super();
		this.fishName = fishName;
		this.location = location;
		this.unit = unit;
		this.price = price;
		this.cnt = cnt;
	}
	public BestSeller() {
		super();
	}
	public String getFishName() {
		return fishName;
	}
	public void setFishName(String fishName) {
		this.fishName = fishName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "BestSeller [fishName=" + fishName + ", location=" + location + ", unit=" + unit + ", price=" + price
				+ ", cnt=" + cnt + "]";
	}
}