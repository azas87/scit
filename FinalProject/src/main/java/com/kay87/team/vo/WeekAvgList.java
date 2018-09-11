package com.kay87.team.vo;

public class WeekAvgList {
	private int avgListNum;
	private String fishName;
	private int avgPrice;
	private String date;
	public WeekAvgList(int avgListNum, String fishName, int avgPrice, String date) {
		super();
		this.avgListNum = avgListNum;
		this.fishName = fishName;
		this.avgPrice = avgPrice;
		this.date = date;
	}
	public WeekAvgList() {
		super();
	}
	public int getAvgListNum() {
		return avgListNum;
	}
	public void setAvgListNum(int avgListNum) {
		this.avgListNum = avgListNum;
	}
	public String getFishName() {
		return fishName;
	}
	public void setFishName(String fishName) {
		this.fishName = fishName;
	}
	public int getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "WeekAvgList [avgListNum=" + avgListNum + ", fishName=" + fishName + ", avgPrice=" + avgPrice + ", date="
				+ date + "]";
	}
	
}
