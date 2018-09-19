package com.kay87.team;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kay87.team.dao.BuyMapper;
import com.kay87.team.dao.FaQMapper;
import com.kay87.team.vo.AvgList;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FAQ;
import com.kay87.team.vo.FishList;


@Controller
public class BuyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuyController.class);
	
	@Autowired
	SqlSession sql;
	
	
	//구매글쓰기 폼 불러오기
	@RequestMapping(value = "/writeBuyBoardForm", method = RequestMethod.GET)
	public String writeBuyBoardForm(Model model, HttpSession session, String buyNum, BuyList buylistFromHistory) {
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		List<BuyList> buylist = dao.getHistorySellerId((String)session.getAttribute("loginId"));
		if(buyNum!=null) {
			buylistFromHistory = dao.selectOneBuylist(Integer.parseInt(buyNum));
		}
		model.addAttribute("buylist", buylist);
		model.addAttribute("buylistFromHistory", buylistFromHistory);
		
		return "writeBuyBoardForm";
	}
	//구매글쓰기
	@RequestMapping(value = "/writeBuyBoard", method = RequestMethod.POST)
	public String writeBuyBoard(BuyList buyList, HttpSession session){
		System.out.println("writeBuyBoard buyList => " + buyList);
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		buyList.setBuyerId((String)session.getAttribute("loginId"));
		dao.insertBuyList(buyList);

		return "home";
	}
	
	
	//글쓰기 품목  keyup이벤트
	@RequestMapping(value = "/getFishName", method = RequestMethod.GET)
	public @ResponseBody List<FishList> getFishName(String fishName) {
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		List<FishList> fishlist=dao.getFishName(fishName);
		
		return fishlist;
	}
	
	//구매완료내역출력
	@RequestMapping(value = "/buyListHistory", method = RequestMethod.GET)
	public String buyListHistory(Model model, HttpSession session,
			@RequestParam(value="period", defaultValue="1") String period,
			@RequestParam(value="startDay", defaultValue="") String startDay,
			@RequestParam(value="endDay", defaultValue="") String endDay  ) {
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		String id = (String)session.getAttribute("loginId");

		//월별 구매합계
		List<BuyList> sumPricebyMonth= dao.sumPricebyMonth(id);
		int[] list = new int[12];
		int month=0;

		for(int j=0;j<sumPricebyMonth.size();j++) {
			for(int i=0;i<list.length;i++) {
				month = Integer.parseInt(sumPricebyMonth.get(j).getFishName());
				
				if((i+1)==month) {
					list[i]=sumPricebyMonth.get(j).getPrice();
				}
					
			}
		}
		
		model.addAttribute("startDay", startDay);
		model.addAttribute("endDay", endDay);
		model.addAttribute("period", period);
		model.addAttribute("list", list);
		//생선별합계
		model.addAttribute("sumPricebyFishName", sumPrice(id, period, startDay, endDay));
		
		return "buyListHistory";
	}
	
	//수취확인
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public @ResponseBody int confirm(String buyNum) {
		
		System.out.println(buyNum);
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		int result =dao.saleComplete(buyNum);
		
		return result ;
	}
	//환불
	@RequestMapping(value = "/refund", method = RequestMethod.GET)
	public @ResponseBody int refund(String buyNum) {
		
		System.out.println(buyNum);
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		int result =dao.refund(buyNum);
		
		return 0;
	}

	@RequestMapping(value = "/jqgrid_R", method = RequestMethod.GET, produces = "application/text; charset=utf8")

	public @ResponseBody String jqgrid(
		   @RequestParam(value="period", defaultValue="1") String period,
		   String startDay, String endDay, String page, String rows, HttpSession session) {

		String id =(String)session.getAttribute("loginId");
		List<BuyList> buyListHistory = getBuyListHistory(id, period,startDay,endDay);
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(buyListHistory) + "}";
		System.out.println(jsonPlace);
		
		return jsonPlace;
	}
	
	//생선별 합계 표
	@RequestMapping(value = "/sumList", method = RequestMethod.GET, produces = "application/text; charset=utf8")

	public @ResponseBody String sumList(
		   @RequestParam(value="period", defaultValue="1") String period,
		   String startDay, String endDay, String page, String rows, HttpSession session) {
		System.out.println("생선별합계");
		String id =(String)session.getAttribute("loginId");
		List<BuyList> sumPricebyFishName = sumPrice(id, period,startDay,endDay);
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(sumPricebyFishName) + "}";
		System.out.println("여기"+jsonPlace);
		
		return jsonPlace;
	}
	
	//환불리스트
	@RequestMapping(value = "/refundList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String refundList(String page, String rows, HttpSession session) {
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		List<BuyList> refundBuyList= dao.getRefundsBuyList((String)session.getAttribute("loginId"));		

		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(refundBuyList) + "}";
		System.out.println(jsonPlace);
		
		return jsonPlace;
	}
	
	//엑셀로 다운로드
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public String download(
			String period,String startDay, String endDay, HttpSession session, Model model){
		
		String id =(String)session.getAttribute("loginId");
		List<BuyList> buyListHistory = getBuyListHistory(id, period, startDay, endDay);
		model.addAttribute("list", buyListHistory);
		model.addAttribute("date", "2018-09-06");
		return "listSave";
	}

	
	@RequestMapping(value = "/getMarketPrice", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getMarketPrice(HttpSession session, Model model){		
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);	
		List<AvgList> list = dao.getMarketPrice();
		System.out.println(list);
			
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(list) + "}";
		System.out.println(jsonPlace);		
		return jsonPlace;
		}
	
	
	
	//판매이력가져오기
	public List<BuyList> getBuyListHistory(String id, String period, String startDay, String endDay){
		System.out.println(startDay);
		System.out.println(endDay);
		System.out.println(period);
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		Map<String, String> map = new HashMap<String, String>();

	    map.put("period", period);
	    map.put("id", id);
	    if(startDay.length()!=0) {
	    	map.put("startDay", startDay);
	    	map.put("endDay", endDay);
	    }
		List<BuyList> buyListHistory = dao.getSuccessBuyList(map);
	
		return buyListHistory;
	}
	//생선별 구매합계
	public List<BuyList> sumPrice(String id, String period, String startDay, String endDay){
			
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("period", period);
	    map.put("id", id);
	    if(startDay.length()!=0) {
	    	map.put("startDay", startDay);
	    	map.put("endDay", endDay);
	    }
		
		List<BuyList> sumPricebyFishName=dao.sumPricebyFishName(map);
		return sumPricebyFishName;
}
	
}
