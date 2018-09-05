package com.kay87.team.dao;

import java.util.List;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FishList;

public interface BuyMapper {
	
	public List<FishList> getFishName(String fishName);

	public void insertBuyList(BuyList buyList);

	public List<BuyList> getHistorySellerId(String attribute);

	public List<BuyList> getSuccessBuyList(String search);
	
	
		
	public List<BuyList> allBuyList();
	
	public List<BuyList> allBuyList(String searchText);	
	
	public int getTotal(String searchText);
	
	public List<BuyList> myBuyList(String userId);

	public int mygetTotal(String userId);

	
	public int GetTotalListCount(String search);
	
	public List<BuyList> sumPricebyFishName(String userid);

	public List<BuyList> sumPricebyMonth(String userid);

	public int saleComplete(String buyNum);

}
