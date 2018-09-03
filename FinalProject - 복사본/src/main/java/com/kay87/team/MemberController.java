package com.kay87.team;


import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kay87.team.dao.MemberMapper;
import com.kay87.team.vo.MemberInfo;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	SqlSession sql;

	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberInfo member) {
		System.out.println(member);
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		dao.joinMember(member);
		
		return "home";
	}
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberInfo member, HttpSession session) {
		System.out.println(member);
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		MemberInfo user=dao.login(member);
		session.setAttribute("loginId", user.getId());
		return "home";
	}
	
	//id중복체크
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	public @ResponseBody String checkId(String userid) {
		
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		String checkedId=dao.getCheckedId(userid);
		
		return checkedId;
	}
	
	
	
	
	
	
	
}
