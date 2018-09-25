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
import com.kay87.team.vo.WishList;


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
		
		return "redirect:/";
	}
	
	//판매자회원가입
		@RequestMapping(value = "/joinSeller", method = RequestMethod.POST)
		public String joinSeller(MemberInfo member) {
			System.out.println("회원가입"+member);
			MemberMapper dao=sql.getMapper(MemberMapper.class);
			dao.joinSeller(member);
			
			return "redirect:/";
		}
	@RequestMapping(value = "/updateWishList", method = RequestMethod.GET)
	public String updateWishList(Model model, HttpSession session) {
		
		session.setAttribute("updateWishList", "updateWishList");
		FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
		List<FishCategoryList> categoryList = mapper.getCategory();
		model.addAttribute("categoryList", categoryList);
		
		return "selectWishList";
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
			
			return "redirect:/main";
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
	public @ResponseBody int setWishList(String fishName, HttpSession session) {
		
		String id = (String)session.getAttribute("loginId");
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		
		WishList w = new WishList();
		w.setId(id);
		w.setWish(fishName);
		
		WishList wishlist = dao.checkWishList(w);
		int wishCount = dao.getwishListCount(id);
		if(wishCount<5) {
		dao.setWishList(w);
		}
		if(wishlist!=null) {
			wishCount=10;
		}
		return wishCount;
	}
	
	@RequestMapping(value = "/getWishList", method = RequestMethod.GET)
	public @ResponseBody List<WishList> getWishList(String fishName, HttpSession session) {
		
		String id = (String)session.getAttribute("loginId");
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		List<WishList> list = dao.getWishList(id);
		
		return list;
	}
	@RequestMapping(value = "/deleteWishList", method = RequestMethod.GET)
	public @ResponseBody int deleteWishList(String fishName, HttpSession session) {
		
		String id = (String)session.getAttribute("loginId");
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		WishList w = new WishList();
		w.setId(id);
		w.setWish(fishName);
		int result = dao.deleteWishList(w);
		
		return result;
	}
	
	@RequestMapping(value = "/setNotFirst", method = RequestMethod.GET)
	public String setNotFirst(HttpSession session) {
		
		String id = (String)session.getAttribute("loginId");
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		dao.updateUserFirst(id);
		
		if(session.getAttribute("updateWishList")!=null) {
			return "redirect:/main";
		}
		
		return "redirect:/";
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
		return "redirect:/";
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
	//회원정보수정form호출
	@RequestMapping(value = "/updateUser", method = RequestMethod.GET)
	public String updateUser(HttpSession session, Model model) {
		
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		String userid = (String) session.getAttribute("loginId");
		String userMode= (String)session.getAttribute("userMode");
		MemberInfo m = dao.getUserInfo(userid);
		model.addAttribute("member", m);
		
		if(userMode.equals("seller")) {	
	
			return "updateSellerForm";
		}
		else
			
			return "updateBuyerForm";
		}
	
	
	@RequestMapping(value = "/sellerDetail", method = RequestMethod.GET)
	public String sellerDetail() {

		return "sellerDetail";
	}
	
	@RequestMapping(value = "/getSellerInfo", method = RequestMethod.POST)
	public @ResponseBody  List<SellerInfo> getSellerInfo(String sellerId) {
		System.out.println(sellerId);
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		List<SellerInfo> sellerInfo = dao.getSellerInfo(sellerId);
		System.out.println(sellerInfo);
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
		else if(member.getGrade().equals("seller")) {
			return "joinForm";
			
		}else {
			model.addAttribute("grade", "buyer");
			return "joinFormBuyer";
		}
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
		
		return "redirect:/main";
	}
	
	//회원정보수정
	@RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
	public String  updateUserInfo(MemberInfo member,HttpSession session) {
		
		String userid = (String) session.getAttribute("loginId");
		member.setId(userid);
		MemberMapper dao=sql.getMapper(MemberMapper.class);
		dao.updateUserInfo(member);
		
		return "redirect:/";
	}
	
	
	
}
