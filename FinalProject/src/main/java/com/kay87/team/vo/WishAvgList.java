package com.kay87.team.vo;

import java.util.ArrayList;

public class WishAvgList {
	private String fishName;
	private String dates;
	private ArrayList<Integer> avgList;
	public WishAvgList(String fishName, String dates, ArrayList<Integer> avgList) {
		super();
		this.fishName = fishName;
		this.dates = dates;
		this.avgList = avgList;
	}
	public WishAvgList() {
		super();
	}
	public String getFishName() {
		return fishName;
	}
	public void setFishName(String fishName) {
		this.fishName = fishName;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public ArrayList<Integer> getAvgList() {
		return avgList;
	}
	public void setAvgList(ArrayList<Integer> avgList) {
		this.avgList = avgList;
	}
	@Override
	public String toString() {
		return "WishAvgList [fishName=" + fishName + ", dates=" + dates + ", avgList=" + avgList + "]";
	}
	
	
}
