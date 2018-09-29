package com.kay87.team;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kay87.team.dao.BuyMapper;
import com.kay87.team.dao.MemberMapper;
import com.kay87.team.dao.ReviewMapper;
import com.kay87.team.vo.AvgList;
import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.PriorityList;
import com.kay87.team.vo.SaleList;
import com.kay87.team.vo.SellerInfo;
import com.kay87.team.vo.WishAvgList;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sql;	
	
	

	
	//회원가입 폼 불러오기
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinForm() {
	
	
	}

	//로그인 폼 불러오기
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String login() {
		
		return "loginForm";
		
	}
	
	//시세 
	@RequestMapping(value = "/marketPrice", method = RequestMethod.GET)
	public String marketPrice() {
	
		return "marketPrice";
		
	}
	
	
	
	//첫 메인화면에서 전체구매리스트+검색
	@RequestMapping(value = "/")
	public String home() {				
		System.out.println("qq");
		
		int buyNum = 1;
		String seller = selectSeller(buyNum);
		System.out.println(seller);
		return "home";
	}	
	
	//첫 메인화면에서 전체 리스트
	@RequestMapping(value = "/allBuyList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String allBuyList() {			
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		System.out.println("allBuyList");
		List<BuyList> allbuylist = mapper.allBuyList();			
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(allbuylist) + "}";
		System.out.println(jsonPlace);		
		
		return jsonPlace;
	}	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String main(Model model)
	{
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		List<AvgList> list = mapper.getWeekAvgList();
		
		for(AvgList l: list)
		{
			System.out.println(l);
		}
		List<WishAvgList> WishAvgList = new ArrayList<WishAvgList>();
		
		ArrayList<Integer> tempList = new ArrayList<Integer>();
		WishAvgList wish = new WishAvgList();
		for(int i = 0; i<7; i++)
		{
			wish.setFishName(list.get(i).getFishName());
			wish.setDates(list.get(i*5).getDates());
			for(int j = 0; j<5; j++)
			{
				tempList.add(list.get(i+j).getAvgPrice());
			}
			wish.setAvgList(tempList);
			WishAvgList.add(wish);
			
			wish = new WishAvgList();
			tempList = new ArrayList<Integer>();
		}
		
		for(WishAvgList v : WishAvgList)
		{
			System.out.println(v);
		}
		model.addAttribute("list",WishAvgList);
		
		return "main";
	}
	
	//구매자 메인화면에서 나의진행중인리스트
	@RequestMapping(value = "/myList_ing_buyer", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String myList_ing_buyer(HttpSession session) {
		System.out.println("myList_ing_buyer");
		BuyMapper mapper = sql.getMapper(BuyMapper.class);		
		String userId = (String) session.getAttribute("loginId");		
		
		List<BuyList> myList_ing_buyer = mapper.myList_ing_buyer(userId);
		System.out.println(myList_ing_buyer);		
		
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(myList_ing_buyer) + "}";
		System.out.println(jsonPlace);
		return jsonPlace;
	}
	
	
	//판매자 메인화면에서 나의진행중인리스트=참여리스트
	@RequestMapping(value = "/myList_ing_seller", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String myList_ing_seller(HttpSession session) {
		System.out.println("myList_ing_seller");
		BuyMapper mapper = sql.getMapper(BuyMapper.class);		
		String userId = (String) session.getAttribute("loginId");		
		
		List<BuyList> myList_ing_seller = mapper.myList_ing_seller(userId);
		System.out.println(myList_ing_seller);		
		
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(myList_ing_seller) + "}";
		System.out.println(jsonPlace);
		return jsonPlace;
	}
	
	
	//구매자 메인화면에서 내글 목록
	@RequestMapping(value = "/myAllList_buyer", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String myAllList_buyer(HttpSession session) {			
		System.out.println("myAllList_buyer");
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		String userId = (String) session.getAttribute("loginId");	
		List<BuyList> myAllList_buyer = mapper.myAllList_buyer(userId);			
		System.out.println(myAllList_buyer);
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(myAllList_buyer) + "}";
		System.out.println(jsonPlace);		
		
		return jsonPlace;
	}
	
	/*//판매자 메인화면에서 나의 모든 리스트
	@RequestMapping(value = "/myAllList_seller", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String myAllList_seller(HttpSession session) {			
		System.out.println("myAllList_seller");
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		String userId = (String) session.getAttribute("loginId");	
		List<BuyList> myAllList_seller = mapper.myAllList(userId);			
		System.out.println(myAllList_seller);
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(myAllList_seller) + "}";
		System.out.println(jsonPlace);		
		
		return jsonPlace;
	}	*/

	//판매자선택
	@RequestMapping(value = "/selectSeller", method = RequestMethod.GET)
	public String selectSeller(String SellerId, String buyNum, Model model){
		
		BuyMapper dao = sql.getMapper(BuyMapper.class);				
		Map<String, String> map = new HashMap<String, String>();
	    map.put("SellerId", SellerId);
	    map.put("buyNum", buyNum);
	    dao.selectSeller(map);
	    
		return "redirect:/main";
	}
	
	//구매자선택
	@RequestMapping(value = "/selectBuyer", method = RequestMethod.GET)
	public String selectBuyer(SaleList salelist, HttpSession session){
		System.out.println(salelist);
		salelist.setSellerId((String)session.getAttribute("loginId"));  		
		
	    BuyMapper dao = sql.getMapper(BuyMapper.class);			
		dao.selectBuyer(salelist);
	    
		return "redirect:/";
	}
	
	//bestSeller
	@RequestMapping(value = "/bestSeller", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String bestSeller(HttpSession session, Model model){		
		
		ReviewMapper dao = sql.getMapper(ReviewMapper.class);			
		List<BestSeller> bestSeller = dao.bestSeller();
		//System.out.println(bestSeller);
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(bestSeller) + "}";
		System.out.println(jsonPlace);		
		return jsonPlace;
	}
	
	//제철정보
	@RequestMapping(value = "/seasonInfo", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String seasonInfo(String season, HttpSession session, Model model){		
		System.out.println(season);
		ReviewMapper dao = sql.getMapper(ReviewMapper.class);			
		List<BestSeller> seasonInfo = dao.seasonInfo(season);
		//System.out.println(seasonInfo);
		
		for(BestSeller info : seasonInfo) {
			System.out.println(info);
		}
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(seasonInfo) + "}";
		System.out.println(jsonPlace);		
		return jsonPlace;
	}
	
	//구매자 글 삭제(구매자 내글 목록)
	@RequestMapping(value = "/deleteMyList_buyer", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String deleteMyList_buyer(String buyNum){
		System.out.println("deleteMyList_buyer");
		System.out.println(buyNum);
		BuyMapper dao = sql.getMapper(BuyMapper.class);	
		dao.deleteMyList_buyer(buyNum);
		
		return "redirect:/main";		
	}
	

	
	// 판매자 참여리스트에서의 취소(삭제)
	@RequestMapping(value = "/deleteMyList_seller", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public String deleteMyList(String buyNum,HttpSession session){
		System.out.println("deleteMyList_seller");
		System.out.println(buyNum);		
		String userId = (String) session.getAttribute("loginId");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("buyNum", buyNum);
	    map.put("userId", userId);
	    
	    BuyMapper dao = sql.getMapper(BuyMapper.class);			
		dao.deleteMyList_seller(map);
		
		return "redirect:/main";		
	}
	
	// 판매자 메인화면에서 선호 목록_k
		@RequestMapping(value = "/sellerWishList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
		public @ResponseBody String sellerWishList(HttpSession session) {			
			System.out.println("sellerWishList");
			BuyMapper mapper = sql.getMapper(BuyMapper.class);
			String userId = (String) session.getAttribute("loginId");	
			List<BuyList> myWishList_seller = mapper.sellerWishList(userId);			
			for(BuyList i : myWishList_seller) {
				System.out.println(i);
			}
			
			System.out.println("");
			
			List<SaleList> salelist  = mapper.selectSaleList(userId);
			//System.out.println(salelist);   //salelist에 정보가 안들어 있으면 결과:[]
			if(salelist.size()==0) {
				System.out.println("salelist없네!");
			}else {
				for(SaleList i : salelist) {
					System.out.println(i);
				}
			}
			
			//System.out.println(myWishList_seller.get(0).getBuyNum());
			for(int i=0; i<myWishList_seller.size() ;i++) {			
				System.out.println(myWishList_seller.get(i).getBuyNum());
				for(int j=0;j<salelist.size();j++) {
					System.out.println(salelist.get(j).getBuyNum());
					if(Integer.parseInt(myWishList_seller.get(i).getBuyNum())==salelist.get(j).getBuyNum()) {
						myWishList_seller.get(i).setSuccessSellerId(userId);
						break;//가장가까이 있는 반복문 빠져나감
					}
				}				
			}
			
			for(BuyList i : myWishList_seller) {
				System.out.println(i);
			}			
			
			Gson gson = new Gson();
			//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
			String jsonPlace = "{\"rows\":"+ gson.toJson(myWishList_seller) + "}";
			System.out.println(jsonPlace);		
			
			return jsonPlace;
		}
		
		public String selectSeller(int buyNum) {
			
			BuyMapper mapper = sql.getMapper(BuyMapper.class);
			List<PriorityList> list=mapper.getPriorityList(buyNum);
			System.out.println("선호"+list);
			List<SaleList> sellerList = mapper.getSellerId(buyNum);
			System.out.println("판매자"+sellerList);
			
			//우선순위 판매자를 등록한경우
			String successSeller="";
			for(PriorityList p :list) {
				for(int i=1;i<=3;i++) {
				if(p.getOrders()==i) {
					for(SaleList s:sellerList){
						if(s.getSellerId().equals(p.getPriorityId())) {
							successSeller = p.getPriorityId();
							/*return successSeller;*/
						}
					}
				}
					
			}
			}
			
			//별점 순서대로  판매자  결정
			List<SellerInfo> starList=mapper.getSellerStar(buyNum);/////별점리스트로 뽑아와야 하는데 안됨
			//별점 최대값들의 리스트를 뽑는 쿼리 필요
			System.out.println("별점리스트"+starList);
			if(starList.size()==1) {
				successSeller = starList.get(0).getId();
				return successSeller;
			}
			
			//판매수 숫자대로 판매자 결정
			int max=0;
			for(SellerInfo s: starList) {
				int count =mapper.successCount(s.getId());
				if(max<count) {
					max = count;
					successSeller=s.getId();
				}
			}
			
			return successSeller;
		}
	
}
