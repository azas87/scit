package com.kay87.team;



import java.util.HashMap;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kay87.team.dao.BuyMapper;
import com.kay87.team.dao.ReviewMapper;
import com.kay87.team.util.PageNavigator;
import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.WeekAvgList;
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
	
	
	//첫 메인화면에서 전체구매리스트+검색
	@RequestMapping(value = "/")
	public String home(
			@RequestParam(value = "searchText", defaultValue="") String searchText
			,@RequestParam(value = "page", defaultValue="1") int page
			,Model model) {				
		System.out.println("qq");
		
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		List<WeekAvgList> list = mapper.getWeekAvgList();
		
		
		for(WeekAvgList l: list)
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
	
	//첫 메인화면에서 나의구매리스트+검색
	@RequestMapping(value = "/myBuyList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String myBuyList(HttpSession session) {
		System.out.println("myBuyList");
		BuyMapper mapper = sql.getMapper(BuyMapper.class);		
		String userId = (String) session.getAttribute("loginId");		
		
		List<BuyList> mybuylist = mapper.myBuyList(userId);
		System.out.println(mybuylist);		
		
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(mybuylist) + "}";
		System.out.println(jsonPlace);
		return jsonPlace;
	}
	
	//첫 메인화면에서 나의 모든 리스트
	@RequestMapping(value = "/myAllList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String myAllList(HttpSession session) {			
		System.out.println("myAllList");
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		String userId = (String) session.getAttribute("loginId");	
		List<BuyList> myAllList = mapper.myAllList(userId);			
		System.out.println(myAllList);
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(myAllList) + "}";
		System.out.println(jsonPlace);		
		
		return jsonPlace;
	}	

	//판매자선택
	@RequestMapping(value = "/selectSeller", method = RequestMethod.GET)
	public String selectSeller(String SellerId, String buyNum, Model model){
		
		BuyMapper dao = sql.getMapper(BuyMapper.class);				
		Map<String, String> map = new HashMap<String, String>();
	    map.put("SellerId", SellerId);
	    map.put("buyNum", buyNum);
	    dao.selectSeller(map);
	    
		return "home";
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
}
