package com.kay87.team;


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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kay87.team.dao.MemberMapper;
import com.kay87.team.dao.ReviewMapper;
import com.kay87.team.vo.MemberInfo;
import com.kay87.team.vo.Review;
import com.kay87.team.vo.SellerInfo;


@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	SqlSession sql;

	//구매자회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(MemberInfo member) {
		System.out.println(member);
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		dao.joinMember(member);
		
		return "home";
	}
	
	//판매자회원가입
		@RequestMapping(value = "/sellerJoin", method = RequestMethod.POST)
		public String sellerJoin(MemberInfo member) {
			System.out.println(member);
			MemberMapper dao=sql.getMapper(MemberMapper.class);
			/*dao.joinMember(member);*/
			ReviewMapper reviewMapper=sql.getMapper(ReviewMapper.class);
			Review r = new Review();
			r.setStar(3);
			r.setSellerId(member.getId());
			reviewMapper.insertReview(r);
			
			return "home";
		}
	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberInfo member, HttpSession session, Model model) {
		System.out.println(member);
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		MemberInfo user=dao.login(member);


		if(user!=null) 
		{
			session.setAttribute("loginId", user.getId());
			session.setAttribute("userMode", user.getGrade());
			System.out.println("userMode : " + session.getAttribute("userMode"));
			return "home";
		}
		else
		{
			model.addAttribute("msg", "로그인 실패");
			return "loginForm";
		}
	}
	
	//id중복체크
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	public @ResponseBody String checkId(String userid) {
		
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		String checkedId=dao.getCheckedId(userid);
		
		return checkedId;
	}
	
	// logOut
	@RequestMapping(value = "/logOut", method = RequestMethod.GET)
	public String LogOut(HttpSession session, Model model) {

		session.invalidate();
		return "home";
	}


	// 회원탈퇴
	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancel(HttpSession session, Model model) {
		
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		String userid = (String) session.getAttribute("loginId");
		dao.cancel(userid);
		
		return "home";
	}
	

	@RequestMapping(value = "/sellerDetail", method = RequestMethod.GET)
	public String sellerDetail() {

		return "sellerDetail";
	}
	
	@RequestMapping(value = "/getSellerInfo", method = RequestMethod.POST)
	public @ResponseBody  List<SellerInfo> getSellerInfo(String sellerId) {
		System.out.println(1);
		
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		List<SellerInfo> sellerInfo = dao.getSellerInfo(sellerId);
		
		return sellerInfo;
	}
	
	
}
