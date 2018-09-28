package com.kay87.team.vo;

public class PriorityList {
	
	private int priorityNum;
	private int buyNum;
	private String priorityId;
	private int orders;
	
	public PriorityList(int priorityNum, int buyNum, String priorityId, int orders) {
		super();
		this.priorityNum = priorityNum;
		this.buyNum = buyNum;
		this.priorityId = priorityId;
		this.orders = orders;
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

	public int getOrders() {
		return orders;
	}

	public void setOrders(int orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "PriorityList [priorityNum=" + priorityNum + ", buyNum=" + buyNum + ", priorityId=" + priorityId
				+ ", orders=" + orders + "]";
	}
	
	
}
