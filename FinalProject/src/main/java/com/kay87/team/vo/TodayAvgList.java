package com.kay87.team.vo;

public class TodayAvgList {
	private String fishName;
	private int total;
	private int count;
	private int avgPrice;
	public TodayAvgList(String fishName, int total, int count, int avgPrice) {
		super();
		this.fishName = fishName;
		this.total = total;
		this.count = count;
		this.avgPrice = avgPrice;
	}
	
	
	public TodayAvgList() {
		super();
	}


	public String getFishName() {
		return fishName;
	}
	public void setFishName(String fishName) {
		this.fishName = fishName;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getAvgPrice() {
		return avgPrice;
	}
	public void setAverage(int avgPrice) {
		this.avgPrice = avgPrice;
	}


	@Override
	public String toString() {
		return "avgList [fishName=" + fishName + ", total=" + total + ", count=" + count + ", avgPrice=" + avgPrice + "]";
	}
}
