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

import com.google.gson.Gson;
import com.kay87.team.dao.BoardMapper;
import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.QnA;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping(value = "/qnaForm", method = RequestMethod.GET)
	public String qnaForm(){
		
		return "qnaForm";
	}
	
	@RequestMapping(value = "/getQnaList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getQnaList(HttpSession session, Model model){		
		System.out.println(1);	
		BoardMapper dao = sql.getMapper(BoardMapper.class);			
		List<QnA> QnaList = dao.getQnaList();
		System.out.println(QnaList);
			
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(QnaList) + "}";
		System.out.println(jsonPlace);		
		return jsonPlace;
		}
		
	@RequestMapping(value = "/writeBoardForm", method = RequestMethod.GET)
	public String writeBoardForm(){
		
		return "writeBoardForm";
	}
	
	@RequestMapping(value = "/writeBoard", method = RequestMethod.GET)
	public String writeBoard(QnA qna, HttpSession session){
		System.out.println(qna);
		qna.setId((String) session.getAttribute("loginId"));
		BoardMapper dao = sql.getMapper(BoardMapper.class);
		dao.writeBoard(qna);
		
		return "qnaForm";
	}
}