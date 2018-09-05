package com.kay87.team;


import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kay87.team.vo.MemberInfo;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	SqlSession sql;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
	
		return "home";
	}
	

	
	//회원가입 폼 불러오기
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public void joinForm() {
	
	
	}
	
	//회원가입 폼 불러오기
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public void login() {
		
		
	}
	
	@RequestMapping(value = "/jqgrid", method = RequestMethod.GET)
	public void jqgrid() {
		
		
	}
}
