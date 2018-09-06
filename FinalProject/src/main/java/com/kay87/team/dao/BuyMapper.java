package com.kay87.team.dao;

import java.util.HashMap;
import java.util.List;

import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FishList;

public interface BuyMapper {
	
	public List<FishList> getFishName(String fishName);

	public void insertBuyList(BuyList buyList);

	public List<BuyList> getHistorySellerId(String attribute);

	public List<BuyList> getSuccessBuyList(String id);

	public List<BuyList> sumPricebyFishName(String userid);

	public List<BuyList> sumPricebyMonth(String userid);

	public int saleComplete(String buyNum);

	public int refund(String buyNum);
}
