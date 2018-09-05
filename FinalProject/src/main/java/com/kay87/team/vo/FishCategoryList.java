package com.kay87.team.vo;

public class FishCategoryList {
	
	private int fishCategoryNum;
	private String CategoryName;
	
	public FishCategoryList(int fishCategoryNum, String categoryName) {
		super();
		this.fishCategoryNum = fishCategoryNum;
		CategoryName = categoryName;
	}
	
	public FishCategoryList() {
		super();
	}

	public int getFishCategoryNum() {
		return fishCategoryNum;
	}

	public void setFishCategoryNum(int fishCategoryNum) {
		this.fishCategoryNum = fishCategoryNum;
	}

	public String getCategoryName() {
		return CategoryName;
	}

	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}

	@Override
	public String toString() {
		return "FishCategoryList [fishCategoryNum=" + fishCategoryNum + ", CategoryName=" + CategoryName + "]";
	}
	
	
	

}
