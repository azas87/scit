package com.kay87.team.vo;

public class PriorityList {
	
	private int priorityNum;
	private int buyNum;
	private String priorityId;
	public PriorityList(int priorityNum, int buyNum, String priorityId) {
		super();
		this.priorityNum = priorityNum;
		this.buyNum = buyNum;
		this.priorityId = priorityId;
	}
	public PriorityList() {
		super();
	}
	public int getPriorityNum() {
		return priorityNum;
	}
	public void setPriorityNum(int priorityNum) {
		this.priorityNum = priorityNum;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public String getPriorityId() {
		return priorityId;
	}
	public void setPriorityId(String priorityId) {
		this.priorityId = priorityId;
	}
	@Override
	public String toString() {
		return "PriorityList [priorityNum=" + priorityNum + ", buyNum=" + buyNum + ", priorityId=" + priorityId + "]";
	}
	

}
