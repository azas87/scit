package com.kay87.team.dao;

import java.util.List;
import java.util.Map;

import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FishList;

public interface BuyMapper {
	
	public List<FishList> getFishName(String fishName);

	public void insertBuyList(BuyList buyList);

	public List<BuyList> getHistorySellerId(String attribute);

	public List<BuyList> getSuccessBuyList(Map<String, String> map);
	
	
		
	public List<BuyList> allBuyList();
	
	public List<BuyList> myBuyList(String userId);

	public int GetTotalListCount(String string);
	
	public int GetTotalRefundListCount(String search);
	
	public List<BuyList> sumPricebyFishName(Map<String, String> map);

	public List<BuyList> sumPricebyMonth(String userid);

	public int saleComplete(String buyNum);

	public List<BuyList> getRefundsBuyList(String attribute);

	public int refund(String buyNum);



}
