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
import com.kay87.team.dao.FaQMapper;

import com.kay87.team.vo.FAQ;


@Controller
public class FAQController {
	
	private static final Logger logger = LoggerFactory.getLogger(FAQController.class);
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping(value = "/faqForm", method = RequestMethod.GET)
	public String faqForm(){
		
		return "faqForm";
	}

	@RequestMapping(value = "/getFaqList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getfaqList(HttpSession session, Model model){		
		System.out.println(222);	
		FaQMapper dao = sql.getMapper(FaQMapper.class);	
		List<FAQ> faqList = dao.getfaqList();
		System.out.println(faqList);
			
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(faqList) + "}";
		System.out.println(jsonPlace);		
		return jsonPlace;
		}
		
	@RequestMapping(value = "/writeFaqForm", method = RequestMethod.GET)
	public String writeBoardForm(){
		
		return "writeFaqForm";
	}
	
	@RequestMapping(value = "/writeFaq", method = RequestMethod.POST)
	public String writeBoard(FAQ faq, HttpSession session){
		System.out.println(faq);

		faq.setId((String) session.getAttribute("loginId"));
		FaQMapper dao = sql.getMapper(FaQMapper.class);
		dao.writeFaq(faq);
		
		return "faqForm";
	}
	
	//게시판 내용 불러오기
	@RequestMapping(value="/FAQDetail", method=RequestMethod.GET)
	public void boardDetail(String FAQNum, Model model, HttpSession session) {
		
		FaQMapper dao = sql.getMapper(FaQMapper.class);
		FAQ faq=getBoard(FAQNum);
		//조회수 증가
		
		int cnt=faq.getHitcount();
		cnt++;
		faq.setHitcount(cnt);
		dao.hitBoardCount(faq);
		System.out.println("2"+faq);
		model.addAttribute("faq", faq);
			
		}

		
		@RequestMapping(value="/updateFaqForm", method=RequestMethod.GET)
		public String update(Model model,String FAQNum) {
			
			model.addAttribute("faq", getBoard(FAQNum));
			
			return "updateFaqForm";
			}
		
		@RequestMapping(value="/updateFaq", method=RequestMethod.GET)
		public String updatedb(FAQ faq, Model model) {
			System.out.println("update"+faq);
			FaQMapper dao = sql.getMapper(FaQMapper.class);
			dao.updatefaq(faq);
		
			return "redirect:/faqForm";
			}

		
		@RequestMapping(value="/deleteFaq", method=RequestMethod.GET)
		public String deleteBoard(int FAQNum, Model model) {
			FaQMapper dao = sql.getMapper(FaQMapper.class);
			dao.deletefaq(FAQNum);
			System.out.println("디비 다녀온후");
			return "redirect:/faqForm";
			}
		
		
	
	public FAQ getBoard(String faqNum){
			
		FaQMapper dao = sql.getMapper(FaQMapper.class);
		FAQ faq=dao.getBoard(Integer.parseInt(faqNum));
				
		return faq;
			}
		

}