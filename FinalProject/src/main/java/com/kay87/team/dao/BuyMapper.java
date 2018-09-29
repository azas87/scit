package com.kay87.team.dao;

import java.util.List;
import java.util.Map;

import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FishList;
import com.kay87.team.vo.PriorityList;
import com.kay87.team.vo.SaleList;
import com.kay87.team.vo.SellerInfo;
import com.kay87.team.vo.AvgList;

public interface BuyMapper {
	
	public List<FishList> getFishName(String fishName);

	public void insertBuyList(BuyList buyList);

	public List<BuyList> getHistorySellerId(String attribute);

	public List<BuyList> getSuccessBuyList(Map<String, String> map);
	
	
		
	public List<BuyList> allBuyList();
	
	public List<BuyList> myList_ing_buyer(String userId);
	
	public List<BuyList> myList_ing_seller(String userId);
	
	public List<BuyList> myAllList_buyer(String userId);//구매자 메인화면에서 내글 목록
	
	//public List<BuyList> myAllList_seller(String userId);

	public int GetTotalListCount(String string);
	
	public int GetTotalRefundListCount(String search);
	
	public List<BuyList> sumPricebyFishName(Map<String, Object> map);

	public List<BuyList> sumPricebyMonth(String userid);

	public int saleComplete(String buyNum);

	public List<BuyList> getRefundsBuyList(String attribute);
	
	

	public int selectSeller(Map<String, String> map);//sql문은 update임
	
	public int selectBuyer(SaleList salelist);//sql문은 insert임
	
	public List<SaleList> selectSaleList(String userId);

	public int refund(String buyNum);
	
	public List<AvgList> getWeekAvgList();
	
	public List<AvgList> getTodayAvgList();
	
	public int setWeekAvgList(AvgList weekAvgList);
	
	public List<BuyList> sellerWishList(String userid);
	
	

	public int deleteMyList_buyer(String buyNum);

	public void deleteMyList_seller(Map<String, String> map);//판매자참여리스트취소
	
	public int insertAvgList(AvgList AvgList);

	public BuyList selectOneBuylist(int parseInt);

	public List<AvgList> marketPrice();

	public List<AvgList> getMarketPrice();

	public List<BuyList> getSuccessSellList(Map<String, String> map);

	public List<BuyList> sumPricebyMonthBySeller(String id);

	public List<BuyList> sumPricebyFishNameForSeller(Map<String, Object> map);

	public void insertPriority(PriorityList priorityList);

	public void insertPriority2(PriorityList priorityList);

	public void insertPriority3(PriorityList priorityList);

	public List<PriorityList> getPriorityList(int buyNum);

	public List<SaleList> getSellerId(int buyNum);

	public List<SellerInfo> getSellerStar(int buyNum);

	public int successCount(String string);

	

	

}
