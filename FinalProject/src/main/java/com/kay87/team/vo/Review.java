package com.kay87.team.vo;

public class Review {
	
	private int reviewNum;
	private int buyNum;
	private int star;
	private String sellerId;
	private String reviewComment;
	public Review() {
		super();
	}
	public Review(int reviewNum, int buyNum, int star, String sellerId, String reviewComment) {
		super();
		this.reviewNum = reviewNum;
		this.buyNum = buyNum;
		this.star = star;
		this.sellerId = sellerId;
		this.reviewComment = reviewComment;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getBuyNum() {
		return buyNum;
	}
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	@Override
	public String toString() {
		return "Review [reviewNum=" + reviewNum + ", buyNum=" + buyNum + ", star=" + star + ", sellerId=" + sellerId
				+ ", reviewComment=" + reviewComment + "]";
	}
	
	

}
