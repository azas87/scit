package com.kay87.team.vo;

public class FishList {
	private String fishName;
	private int fishCategoryNum;
	private String locations;
	private String seasonInfo;
	private String fishInfo;
	private String unit;
	
	public FishList(String fishName, int fishCategoryNum, String locations, String seasonInfo, String fishInfo,
			String unit) {
		super();
		this.fishName = fishName;
		this.fishCategoryNum = fishCategoryNum;
		this.locations = locations;
		this.seasonInfo = seasonInfo;
		this.fishInfo = fishInfo;
		this.unit = unit;
	}

	public FishList() {
		super();
	}

	public String getFishName() {
		return fishName;
	}

	public void setFishName(String fishName) {
		this.fishName = fishName;
	}

	public int getFishCategoryNum() {
		return fishCategoryNum;
	}

	public void setFishCategoryNum(int fishCategoryNum) {
		this.fishCategoryNum = fishCategoryNum;
	}

	public String getLocations() {
		return locations;
	}

	public void setLocations(String locations) {
		this.locations = locations;
	}

	public String getSeasonInfo() {
		return seasonInfo;
	}

	public void setSeasonInfo(String seasonInfo) {
		this.seasonInfo = seasonInfo;
	}

	public String getFishInfo() {
		return fishInfo;
	}

	public void setFishInfo(String fishInfo) {
		this.fishInfo = fishInfo;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public String toString() {
		return "FishList [fishName=" + fishName + ", fishCategoryNum=" + fishCategoryNum + ", locations=" + locations
				+ ", seasonInfo=" + seasonInfo + ", fishInfo=" + fishInfo + ", unit=" + unit + "]";
	}
	
	
	
}
