package com.kay87.team.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FishList;

public interface BuyMapper {
	
	public List<FishList> getFishName(String fishName);

	public void insertBuyList(BuyList buyList);

	public List<BuyList> getHistorySellerId(String attribute);

	public List<BuyList> getSuccessBuyList(String id);
	
	
	
	public List<BuyList> allBuyList(String searchText, RowBounds rb);	
	
	public int getTotal(String searchText);
	
	public List<BuyList> myBuyList(String userId, RowBounds rb);

	public int mygetTotal(String userId);
}
