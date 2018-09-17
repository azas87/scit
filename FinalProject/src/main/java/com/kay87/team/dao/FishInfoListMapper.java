package com.kay87.team.dao;

import java.util.List;

import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.FishCategoryList;
import com.kay87.team.vo.FishList;
import com.kay87.team.vo.Review;

public interface FishInfoListMapper {

	public List<FishList> getFishInfo();

	public List<FishCategoryList> getCategory();

	public void newFishInfo(FishList fishInfo);

	public void deleteFishInfo(String fishName);

	public FishList selectOneFish(String fishName);

	public void updateFishInfo(FishList fishInfo);

}
