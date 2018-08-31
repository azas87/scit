package com.kay87.team.vo;

public class BuyList {
	private int buyNum;
	private int fishNum;
	private String buyerId;
	private String buyLocation;
	private String registDate;
	private String uploadDate;
	private String deadline;
	private String priority1;
	private String priority2;
	private String priority3;
	private int weight;
	private String saleStatus;
	private int price;
	private String successSellerId;
	private String buyListComment;
	
	public BuyList() {
		super();
	}

	public BuyList(int buyNum, int fishNum, String buyerId, String buyLocation, String registDate, String uploadDate,
			String deadline, String priority1, String priority2, String priority3, int weight, String saleStatus,
			int price, String successSellerId, String buyListComment) {
		super();
		this.buyNum = buyNum;
		this.fishNum = fishNum;
		this.buyerId = buyerId;
		this.buyLocation = buyLocation;
		this.registDate = registDate;
		this.uploadDate = uploadDate;
		this.deadline = deadline;
		this.priority1 = priority1;
		this.priority2 = priority2;
		this.priority3 = priority3;
		this.weight = weight;
		this.saleStatus = saleStatus;
		this.price = price;
		this.successSellerId = successSellerId;
		this.buyListComment = buyListComment;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public int getFishNum() {
		return fishNum;
	}

	public void setFishNum(int fishNum) {
		this.fishNum = fishNum;
	}

	public String getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}

	public String getBuyLocation() {
		return buyLocation;
	}

	public void setBuyLocation(String buyLocation) {
		this.buyLocation = buyLocation;
	}

	public String getRegistDate() {
		return registDate;
	}

	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getDeadline() {
		return deadline;
	}

	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}

	public String getPriority1() {
		return priority1;
	}

	public void setPriority1(String priority1) {
		this.priority1 = priority1;
	}

	public String getPriority2() {
		return priority2;
	}

	public void setPriority2(String priority2) {
		this.priority2 = priority2;
	}

	public String getPriority3() {
		return priority3;
	}

	public void setPriority3(String priority3) {
		this.priority3 = priority3;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public String getSaleStatus() {
		return saleStatus;
	}

	public void setSaleStatus(String saleStatus) {
		this.saleStatus = saleStatus;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSuccessSellerId() {
		return successSellerId;
	}

	public void setSuccessSellerId(String successSellerId) {
		this.successSellerId = successSellerId;
	}

	public String getBuyListComment() {
		return buyListComment;
	}

	public void setBuyListComment(String buyListComment) {
		this.buyListComment = buyListComment;
	}

	@Override
	public String toString() {
		return "BuyList [buyNum=" + buyNum + ", fishNum=" + fishNum + ", buyerId=" + buyerId + ", buyLocation="
				+ buyLocation + ", registDate=" + registDate + ", uploadDate=" + uploadDate + ", deadline=" + deadline
				+ ", priority1=" + priority1 + ", priority2=" + priority2 + ", priority3=" + priority3 + ", weight="
				+ weight + ", saleStatus=" + saleStatus + ", price=" + price + ", successSellerId=" + successSellerId
				+ ", buyListComment=" + buyListComment + "]";
	}
	
	

}
