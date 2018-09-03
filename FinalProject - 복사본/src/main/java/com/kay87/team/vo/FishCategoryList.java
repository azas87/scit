package com.kay87.team.vo;

public class FishCategoryList {
	
	private int fishCategoryNum;
	private String categoryName;
	
	public FishCategoryList(int fishCategoryNum, String categoryName) {
		super();
		this.fishCategoryNum = fishCategoryNum;
		this.categoryName = categoryName;
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
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "FishCategoryList [fishCategoryNum=" + fishCategoryNum + ", categoryName=" + categoryName + "]";
	}
	
	
	
	

}
