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

import com.kay87.team.dao.BuyMapper;
import com.kay87.team.dao.FishInfoListMapper;
import com.kay87.team.dao.MemberMapper;
import com.kay87.team.dao.ReviewMapper;
import com.kay87.team.vo.FishCategoryList;
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
			
			if(user.getFirst().equals("first")) {
				
				FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
				List<FishCategoryList> categoryList = mapper.getCategory();
				model.addAttribute("categoryList", categoryList);
				
				return "selectWishList";
			}
			else {
				return "redirect:/";
			}
		}
		else
		{
			model.addAttribute("msg", "로그인 실패");
			return "loginForm";
		}
	}
	
	
	@RequestMapping(value = "/setWishList", method = RequestMethod.GET)
	public String setWishList() {
		
		MemberMapper dao=sql.getMapper(MemberMapper.class);

		return "setWishList";
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
	@RequestMapping(value = "/cancel", method = RequestMethod.POST)
	public @ResponseBody int cancel(HttpSession session, Model model, MemberInfo member) {
		
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		String userid = (String) session.getAttribute("loginId");
		member.setId(userid);
		int result = dao.cancel(member);
		
		return result;
	}
	
	
	@RequestMapping(value = "/sellerDetail", method = RequestMethod.GET)
	public String sellerDetail() {

		return "sellerDetail";
	}
	
	@RequestMapping(value = "/getSellerInfo", method = RequestMethod.POST)
	public @ResponseBody  List<SellerInfo> getSellerInfo(String sellerId) {
	
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		List<SellerInfo> sellerInfo = dao.getSellerInfo(sellerId);
		
		return sellerInfo;
	}
	
	@RequestMapping(value = "/checkingStatus", method = RequestMethod.GET)
	public String checkingStatus(MemberInfo member, Model model) {
		System.out.println(member);
		if(member.getGrade().equals("seller")&&member.getMemberStatus().equals("reentrance")) {
			model.addAttribute("grade", "seller");
			return "reentrance";
		}
		else if(member.getGrade().equals("buyer")&&member.getMemberStatus().equals("reentrance")) {
			model.addAttribute("grade", "buyer");
			return "reentrance";
		}
		else if(member.getMemberStatus().equals("seller")) {
			
		}else {
			model.addAttribute("grade", "buyer");
			return "joinForm";
		}
		return "joinForm";
	}
	
	@RequestMapping(value = "/checkingEmail", method = RequestMethod.POST)
	public @ResponseBody MemberInfo  checkingEmail(MemberInfo member) {

		MemberMapper dao=sql.getMapper(MemberMapper.class);
		MemberInfo m = dao.checkingEmail(member);
		System.out.println("null"+m);
		return m;
	}
	

	@RequestMapping(value = "/reenterance", method = RequestMethod.POST)
	public String  reenterance(MemberInfo member) {
	
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		dao.reenterance(member);
		
		return "home";
	}
	
	
	
}
