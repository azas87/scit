package com.kay87.team.vo;

public class FishList {
	private int fishNum;
	private int fishCategoryNum;
	private String fishName;
	private String gender;
	private String location;
	private String fishInfo;
	private String seasonInfo;
	
	public FishList() {
		super();
	}

	public FishList(int fishNum, int fishCategoryNum, String fishName, String gender, String location, String fishInfo,
			String seasonInfo) {
		super();
		this.fishNum = fishNum;
		this.fishCategoryNum = fishCategoryNum;
		this.fishName = fishName;
		this.gender = gender;
		this.location = location;
		this.fishInfo = fishInfo;
		this.seasonInfo = seasonInfo;
	}

	public int getFishNum() {
		return fishNum;
	}

	public void setFishNum(int fishNum) {
		this.fishNum = fishNum;
	}

	public int getFishCategoryNum() {
		return fishCategoryNum;
	}

	public void setFishCategoryNum(int fishCategoryNum) {
		this.fishCategoryNum = fishCategoryNum;
	}

	public String getFishName() {
		return fishName;
	}

	public void setFishName(String fishName) {
		this.fishName = fishName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getFishInfo() {
		return fishInfo;
	}

	public void setFishInfo(String fishInfo) {
		this.fishInfo = fishInfo;
	}

	public String getSeasonInfo() {
		return seasonInfo;
	}

	public void setSeasonInfo(String seasonInfo) {
		this.seasonInfo = seasonInfo;
	}

	@Override
	public String toString() {
		return "FishList [fishNum=" + fishNum + ", fishCategoryNum=" + fishCategoryNum + ", fishName=" + fishName
				+ ", gender=" + gender + ", location=" + location + ", fishInfo=" + fishInfo + ", seasonInfo="
				+ seasonInfo + "]";
	}
	
	
}
