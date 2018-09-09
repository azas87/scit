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

import com.kay87.team.dao.ReviewMapper;
import com.kay87.team.vo.Review;

@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	SqlSession sql;

	//구매글쓰기
	@RequestMapping(value = "/reviewForm", method = RequestMethod.GET)
	public String reviewForm(){
		
		return "reviewForm";
	}
	
	//리뷰등록
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public @ResponseBody String insertReview(Review review){
		System.out.println(review);
		ReviewMapper dao=sql.getMapper(ReviewMapper.class);
		int result = dao.insertReview(review);
		
		return "home";
	}

}