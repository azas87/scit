package com.kay87.team.vo;

import java.util.Date;

public class BuyList {
	private String buyNum;
	private String fishName;
	private String buyerId;
	private String registDate;
	private String uploadDate;
	private String deadline;
	private int weight;
	private String saleStatus;
	private int price;
	private String successSellerId;
	private String buyListComment;
	private String location;
	public BuyList(String buyNum, String fishName, String buyerId, String registDate, String uploadDate, String deadline,
			int weight, String saleStatus, int price, String successSellerId, String buyListComment, String location) {
		super();
		this.buyNum = buyNum;
		this.fishName = fishName;
		this.buyerId = buyerId;
		this.registDate = registDate;
		this.uploadDate = uploadDate;
		this.deadline = deadline;
		this.weight = weight;
		this.saleStatus = saleStatus;
		this.price = price;
		this.successSellerId = successSellerId;
		this.buyListComment = buyListComment;
		this.location = location;
	}
	public BuyList() {
		super();
	}
	public String getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(String buyNum) {
		this.buyNum = buyNum;
	}
	public String getFishName() {
		return fishName;
	}
	public void setFishName(String fishName) {
		this.fishName = fishName;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "BuyList [buyNum=" + buyNum + ", fishName=" + fishName + ", buyerId=" + buyerId + ", registDate="
				+ registDate + ", uploadDate=" + uploadDate + ", deadline=" + deadline + ", weight=" + weight
				+ ", saleStatus=" + saleStatus + ", price=" + price + ", successSellerId=" + successSellerId
				+ ", buyListComment=" + buyListComment + ", location=" + location + "]";
	}
	
	

}
