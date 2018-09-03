package com.kay87.team;

import java.util.HashMap;
import java.util.List;

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

import com.kay87.team.dao.BuyMapper;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FishList;
import com.kay87.team.vo.MemberInfo;


@Controller
public class BuyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuyController.class);
	
	@Autowired
	SqlSession sql;
	
	//구매글쓰기 폼 불러오기
	@RequestMapping(value = "/writeBuyBoardForm", method = RequestMethod.GET)
	public String writeBuyBoardForm(Model model, HttpSession session, 
			@RequestParam(value="fishName", defaultValue="") String fishName,
			@RequestParam(value="fishNum", defaultValue="") String fishNum,
			@RequestParam(value="buyLocation", defaultValue="") String buyLocation,
			@RequestParam(value="sellerId", defaultValue="") String sellerId) {
		System.out.println("1");
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		List<BuyList> buylist=dao.getHistorySellerId((String)session.getAttribute("loginId"));
		model.addAttribute("buylist", buylist);
		model.addAttribute("fishName", fishName);
		model.addAttribute("fishNum", fishNum);
		model.addAttribute("buyLocation", buyLocation);
		model.addAttribute("sellerId", sellerId);
		System.out.println(fishNum);
		
		return "writeBuyBoardForm";
	}
	//구매글쓰기
	@RequestMapping(value = "/writeBuyBoard", method = RequestMethod.GET)
	public String writeBuyBoard(BuyList buyList, HttpSession session){
		System.out.println(buyList.getUploadDate());
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
	public String buyListHistory(Model model, HttpSession session) {
	
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		List<HashMap<String, Object>> buyListHistory=dao.getSuccessBuyList((String)session.getAttribute("loginId"));
		model.addAttribute("buyListHistory", buyListHistory);
		
		return "buyListHistory";
	}
		
	/*List<HashMap<String, Object>> bestseller = repository.selectBestseller();*/
}
