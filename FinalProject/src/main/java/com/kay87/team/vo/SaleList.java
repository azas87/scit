package com.kay87.team.vo;

public class SaleList {
	private int saleNum;
	private int buyNum;
	private String sellerId;
	public SaleList(int saleNum, int buyNum, String sellerId) {
		super();
		this.saleNum = saleNum;
		this.buyNum = buyNum;
		this.sellerId = sellerId;
	}
	public SaleList() {
		super();
	}
	public int getSaleNum() {
		return saleNum;
	}
	public void setSaleNum(int saleNum) {
		this.saleNum = saleNum;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	@Override
	public String toString() {
		return "SaleList [saleNum=" + saleNum + ", buyNum=" + buyNum + ", sellerId=" + sellerId + "]";
	}
	
	

}
