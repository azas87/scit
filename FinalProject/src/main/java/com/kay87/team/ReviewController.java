package com.kay87.team;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kay87.team.vo.Review;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	SqlSession sql;

	//구매글쓰기
	@RequestMapping(value = "/reviewForm", method = RequestMethod.GET)
	public String reviewForm(){
		System.out.println(11);
		return "reviewForm";
	}
	

	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReview(Review review){
		System.out.println(review);
		return "home";
	}

}