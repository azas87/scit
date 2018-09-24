package com.kay87.team;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kay87.team.dao.BoardMapper;
import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.QnA;
import com.kay87.team.vo.QnAreply;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping(value = "/qnaForm", method = RequestMethod.GET)
	public String qnaForm(){
		System.out.println("qnaForm");
		return "qnaForm";
	}
	
	@RequestMapping(value = "/getQnaList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getQnaList(HttpSession session, Model model){		
		System.out.println(1);	
		BoardMapper dao = sql.getMapper(BoardMapper.class);			
		List<QnA> QnaList = dao.getQnaList();
		System.out.println(QnaList);
		/*List<HashMap<String, String>> list = dao.getJoinList();	*/
		List<QnAreply> replyList = dao.getRelplyList();
		for(QnA q:QnaList) {
				q.setContent("未処理");
			for(QnAreply r:replyList) {
				if(q.getQnaNum()==r.getQnaNum()) {
					q.setContent("回答済み");
				}
			}
		}
		
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
	
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	public String writeBoard(QnA qna, HttpSession session){

		qna.setId((String) session.getAttribute("loginId"));
		BoardMapper dao = sql.getMapper(BoardMapper.class);
		dao.writeBoard(qna);
		
		return "qnaForm";
	}
	
	//게시판 내용 불러오기
		@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
		public void boardDetail(String qnaNum, Model model, HttpSession session) {
	
			BoardMapper dao = sql.getMapper(BoardMapper.class);
			QnA qna=getBoard(qnaNum);
			//조회수 증가
			int cnt=qna.getHitcount();
			cnt++;
			qna.setHitcount(cnt);
			dao.hitBoardCount(qna);
			
			model.addAttribute("qna", qna);
			
			List<QnAreply> replyList=dao.getReplyList(Integer.parseInt(qnaNum));
			model.addAttribute("replyList",replyList);
		}
		
		
		@RequestMapping(value="/updateQnaForm", method=RequestMethod.GET)
		public String update(Model model,String qnaNum) {
			
			model.addAttribute("qna", getBoard(qnaNum));
			
			return "updateQnaForm";
			}
		
		@RequestMapping(value="/updateQna", method=RequestMethod.GET)
		public String updatedb(QnA qna, Model model) {
			
			BoardMapper dao = sql.getMapper(BoardMapper.class);
			dao.updateQna(qna);
		
			return "redirect:/qnaForm";
			}
		
		@RequestMapping(value="/insertReply", method=RequestMethod.GET)
		public @ResponseBody String insertReply( String content, String qnaNum, HttpSession session) {
			
			QnAreply reply = new QnAreply();
			reply.setId((String)session.getAttribute("loginId"));
			reply.setQnaNum(Integer.parseInt(qnaNum));
			reply.setReplyContent(content);
			BoardMapper dao = sql.getMapper(BoardMapper.class);
			dao.insertReply(reply);
		
			return "ok";
			}
		
		@RequestMapping(value="/updateReply", method=RequestMethod.GET)
		public @ResponseBody String updateReply(String replyNum, String replyContent, Model model) {
			System.out.println("수정후내용"+replyContent);
			QnAreply reply = new QnAreply();
			reply.setReplyNum(Integer.parseInt(replyNum));
			reply.setReplyContent(replyContent);
			BoardMapper dao = sql.getMapper(BoardMapper.class);
			dao.updateReply(reply);
		
			return "ok";
			}
		
		@RequestMapping(value="/deleteReply", method=RequestMethod.GET)
		public @ResponseBody String deleteReply(String replyNum, String replyContent, Model model) {
	
			BoardMapper dao = sql.getMapper(BoardMapper.class);
			dao.deleteReply(Integer.parseInt(replyNum));
		
			return "ok";
			}
		
		@RequestMapping(value="/deleteQna", method=RequestMethod.GET)
		public String deleteBoard(int qnaNum, Model model) {
			BoardMapper dao = sql.getMapper(BoardMapper.class);
			dao.deleteQna(qnaNum);
			
			return "redirect:/qnaForm";
			}
		
		
		
		
		@RequestMapping(value="/selectAllRelpy", method=RequestMethod.POST)
		public @ResponseBody List<QnAreply> selectAllRelpy(String qnaNum) {
	
			BoardMapper dao = sql.getMapper(BoardMapper.class);
			List<QnAreply> replyList=dao.getReplyList(Integer.parseInt(qnaNum));
		
			return replyList;
			}
		
	
		public QnA getBoard(String qnaNum){
			
			BoardMapper dao = sql.getMapper(BoardMapper.class);
			QnA qna=dao.getBoard(Integer.parseInt(qnaNum));
				
			return qna;
			}
		
		
	
}