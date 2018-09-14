package com.kay87.team.vo;

public class AvgList {
	private String fishName;
	private int total;
	private int weight;
	private int avgPrice;
	private String dates;
	public AvgList(String fishName, int total, int weight, int avgPrice, String dates) {
		super();
		this.fishName = fishName;
		this.total = total;
		this.weight = weight;
		this.avgPrice = avgPrice;
		this.dates = dates;
	}
	public AvgList() {
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
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getAvgPrice() {
		return avgPrice;
	}
	public void setAvgPrice(int avgPrice) {
		this.avgPrice = avgPrice;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	@Override
	public String toString() {
		return "AvgList [fishName=" + fishName + ", total=" + total + ", weight=" + weight + ", avgPrice=" + avgPrice
				+ ", dates=" + dates + "]";
	}
	
	
	
}
