package com.kay87.team;

import java.text.SimpleDateFormat;
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
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FishList;


@Controller
public class BuyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuyController.class);
	
	@Autowired
	SqlSession sql;
	
	
	//구매글쓰기 폼 불러오기
	@RequestMapping(value = "/writeBuyBoardForm", method = RequestMethod.GET)
	public String writeBuyBoardForm(Model model, HttpSession session, 
			BuyList buylistFromHistory) {
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		List<BuyList> buylist=dao.getHistorySellerId((String)session.getAttribute("loginId"));
		model.addAttribute("buylist", buylist);
		model.addAttribute("buylistFromHistory", buylistFromHistory);
		
		return "writeBuyBoardForm";
	}
	//구매글쓰기
	@RequestMapping(value = "/writeBuyBoard", method = RequestMethod.GET)
	public String writeBuyBoard(BuyList buyList, HttpSession session){
//		System.out.println("writeBuyBoard buyList => " + buyList);
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
			@RequestParam(value="period", defaultValue="1") String period) {
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		String id = (String)session.getAttribute("loginId");

		
		Map<String, String> map = new HashMap<String, String>();
	    map.put("period", period);
	    map.put("id", id);
		
		//생선별 구매합계
		List<BuyList> sumPricebyFishName=dao.sumPricebyFishName(map);
	
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
		
		model.addAttribute("period", period);
		model.addAttribute("list", list);
		model.addAttribute("sumPricebyFishName", sumPricebyFishName);
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
		   String page, String rows, HttpSession session) {
		System.out.println("컨트롤러");
		String id =(String)session.getAttribute("loginId");
		List<BuyList> buyListHistory = getBuyListHistory(id, period);
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(buyListHistory) + "}";
		System.out.println(jsonPlace);
		
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
	public String download(String period, HttpSession session, Model model){
		
		String id =(String)session.getAttribute("loginId");
		List<BuyList> buyListHistory = getBuyListHistory(id, period);
		model.addAttribute("list", buyListHistory);
		model.addAttribute("date", "2018-09-06");
		return "listSave";
	}

	
	//판매이력가져오기
	public List<BuyList> getBuyListHistory(String id, String period){
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		Map<String, String> map = new HashMap<String, String>();
	    map.put("period", period);
	    map.put("id", id);
		List<BuyList> buyListHistory = dao.getSuccessBuyList(map);
	
		return buyListHistory;
	}
}
