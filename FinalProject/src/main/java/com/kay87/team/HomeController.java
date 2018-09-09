package com.kay87.team;


import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
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
import com.kay87.team.util.PageNavigator;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.MemberInfo;


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
	public void login() {
		
		
	}
	
	//첫 메인화면에서 전체구매리스트+검색
	@RequestMapping(value = "/")
	public String home(
			@RequestParam(value = "searchText", defaultValue="") String searchText
			,@RequestParam(value = "page", defaultValue="1") int page
			,Model model) {				
		System.out.println("qq");
		
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
	

	//판매자선택
	@RequestMapping(value = "/selectSeller", method = RequestMethod.GET)
	public String selectSeller(String buyNum, HttpSession session, Model model){
		BuyMapper dao = sql.getMapper(BuyMapper.class);		
		dao.selectSeller(buyNum);
		return "home";
	}

}
