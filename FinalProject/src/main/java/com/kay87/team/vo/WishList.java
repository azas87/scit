package com.kay87.team.vo;

public class WishList {
	
	private int wishNum;
	private String id;
	private String wish;
	public WishList(int wishNum, String id, String wish) {
		super();
		this.wishNum = wishNum;
		this.id = id;
		this.wish = wish;
	}
	public WishList() {
		super();
	}
	public int getWishNum() {
		return wishNum;
	}
	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWish() {
		return wish;
	}
	public void setWish(String wish) {
		this.wish = wish;
	}
	@Override
	public String toString() {
		return "WishList [wishNum=" + wishNum + ", id=" + id + ", wish=" + wish + "]";
	}
	
	

}
