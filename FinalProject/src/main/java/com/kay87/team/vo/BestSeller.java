package com.kay87.team.vo;

import java.util.Date;

public class BestSeller {
	private String fishName;
	private String location;
	private String unit;
	private int total;	
	public BestSeller(String fishName, String location, String unit, int total) {
		super();
		this.fishName = fishName;
		this.location = location;
		this.unit = unit;
		this.total = total;
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
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "BestSeller [fishName=" + fishName + ", location=" + location + ", unit=" + unit + ", total=" + total
				+ "]";
	}		
}
