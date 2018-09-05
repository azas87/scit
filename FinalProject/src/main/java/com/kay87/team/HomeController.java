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

import com.kay87.team.dao.BuyMapper;
import com.kay87.team.util.PageNavigator;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.MemberInfo;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	final int countPerPage = 3;
	final int pagePerGroup = 5;
	@Autowired
	SqlSession sql;	
	
	//회원가입 폼 불러오기
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinForm() {
	
	
	}
	
	//회원가입 폼 불러오기
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
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		
		int total = mapper.getTotal(searchText);
		//System.out.println(total);
		//System.out.println(searchText);
			
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
				
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
			
		List<BuyList> allbuylist = mapper.allBuyList(searchText, rb);
		model.addAttribute("allbuylist", allbuylist);
		model.addAttribute("searchText", searchText);
		model.addAttribute("navi", navi);                            
		model.addAttribute("startGroup", navi.getStartPageGroup()); 
		model.addAttribute("endGroup", navi.getEndPageGroup());      
		model.addAttribute("endpage", navi.getTotalPageCount()); 
		return "home";
	}	
	
	
	@RequestMapping(value = "/allBuyList")
	public String allBuyList(
			@RequestParam(value = "searchText", defaultValue="") String searchText
			,@RequestParam(value = "page", defaultValue="1") int page
			,Model model) {				
		System.out.println("qq");
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		
		int total = mapper.getTotal(searchText);
		//System.out.println(total);
		//System.out.println(searchText);
			
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
				
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
			
		List<BuyList> allbuylist = mapper.allBuyList(searchText, rb);
		model.addAttribute("allbuylist", allbuylist);
		model.addAttribute("searchText", searchText);
		model.addAttribute("navi", navi);                            
		model.addAttribute("startGroup", navi.getStartPageGroup()); 
		model.addAttribute("endGroup", navi.getEndPageGroup());      
		model.addAttribute("endpage", navi.getTotalPageCount()); 
		return "home";
	}	
	
	//첫 메인화면에서 나의구매리스트+검색
	@RequestMapping(value = "/myBuyList", method = RequestMethod.GET)
	public String myBuyList(
			@RequestParam(value = "page", defaultValue="1") int page
			,Model model, HttpSession session) {				
		System.out.println("ww");
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		
		String userId = (String) session.getAttribute("loginId");	
				
		int total = mapper.mygetTotal(userId);
		System.out.println(total);
		//System.out.println(searchText);
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		
		
		List<BuyList> mybuylist = mapper.myBuyList(userId, rb);
		System.out.println(mybuylist);
		
		model.addAttribute("mybuylist", mybuylist);
		//model.addAttribute("searchText", searchText);
		model.addAttribute("navi", navi);                            
		model.addAttribute("startGroup", navi.getStartPageGroup()); 
		model.addAttribute("endGroup", navi.getEndPageGroup());      
		model.addAttribute("endpage", navi.getTotalPageCount()); 
		return "home";
	}
	
}
