package com.kay87.team;

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
import com.kay87.team.dao.NoticeMapper;
import com.kay87.team.dao.NoticeMapper;
import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.Notice;
import com.kay87.team.vo.Notice;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	SqlSession sql;
	
	@RequestMapping(value = "/noticeForm", method = RequestMethod.GET)
	public String NoticeForm(){
		System.out.println("noticeForm");
		return "noticeForm";
	}
	
	@RequestMapping(value = "/getNoticeList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String getNoticeList(HttpSession session, Model model){		
		System.out.println(222);	
		NoticeMapper dao = sql.getMapper(NoticeMapper.class);	
		List<Notice> noticeList = dao.getNoticeList();
		System.out.println(noticeList);
			
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(noticeList) + "}";
		System.out.println(jsonPlace);		
		return jsonPlace;
		}
		
	@RequestMapping(value = "/writeNoticeForm", method = RequestMethod.GET)
	public String writeBoardForm(){
		
		return "writeNoticeForm";
	}
	
	@RequestMapping(value = "/writeNotice", method = RequestMethod.GET)
	public String writeBoard(Notice notice, HttpSession session){

		notice.setId((String) session.getAttribute("loginId"));
		NoticeMapper dao = sql.getMapper(NoticeMapper.class);
		dao.writeBoard(notice);
		
		return "noticeForm";
	}
	
	//게시판 내용 불러오기
	@RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	public void boardDetail(String noticeNum, Model model, HttpSession session) {
		
		NoticeMapper dao = sql.getMapper(NoticeMapper.class);
		Notice notice=getBoard(noticeNum);
		//조회수 증가
		
		int cnt=notice.getHitcount();
		cnt++;
		notice.setHitcount(cnt);
		dao.hitBoardCount(notice);
		System.out.println("2"+notice);
		model.addAttribute("notice", notice);
			
		}

		
		@RequestMapping(value="/updateNoticeForm", method=RequestMethod.GET)
		public String update(Model model,String noticeNum) {
			
			model.addAttribute("Notice", getBoard(noticeNum));
			
			return "updateNoticeForm";
			}
		
		@RequestMapping(value="/updateNotice", method=RequestMethod.GET)
		public String updatedb(Notice Notice, Model model) {
			
			NoticeMapper dao = sql.getMapper(NoticeMapper.class);
			dao.updateNotice(Notice);
		
			return "redirect:/NoticeForm";
			}
		
		/*@RequestMapping(value="/insertReply", method=RequestMethod.GET)
		public @ResponseBody String insertReply( String content, String noticeNum, HttpSession session) {
			
			Noticereply reply = new Noticereply();
			reply.setId((String)session.getAttribute("loginId"));
			reply.setnoticeNum(Integer.parseInt(noticeNum));
			reply.setReplyContent(content);
			NoticeMapper dao = sql.getMapper(NoticeMapper.class);
			dao.insertReply(reply);
		
			return "ok";
			}
		
		@RequestMapping(value="/updateReply", method=RequestMethod.GET)
		public @ResponseBody String updateReply(String replyNum, String replyContent, Model model) {
			System.out.println("수정후내용"+replyContent);
			Noticereply reply = new Noticereply();
			reply.setReplyNum(Integer.parseInt(replyNum));
			reply.setReplyContent(replyContent);
			NoticeMapper dao = sql.getMapper(NoticeMapper.class);
			dao.updateReply(reply);
		
			return "ok";
			}
		
		@RequestMapping(value="/deleteReply", method=RequestMethod.GET)
		public @ResponseBody String deleteReply(String replyNum, String replyContent, Model model) {
	
			NoticeMapper dao = sql.getMapper(NoticeMapper.class);
			dao.deleteReply(Integer.parseInt(replyNum));
		
			return "ok";
			}
		
		@RequestMapping(value="/deleteNotice", method=RequestMethod.GET)
		public String deleteBoard(int noticeNum, Model model) {
			NoticeMapper dao = sql.getMapper(NoticeMapper.class);
			dao.deleteNotice(noticeNum);
			
			return "redirect:/NoticeForm";
			}
		
		
		
		
		@RequestMapping(value="/selectAllRelpy", method=RequestMethod.POST)
		public @ResponseBody List<Noticereply> selectAllRelpy(String noticeNum) {
	
			NoticeMapper dao = sql.getMapper(NoticeMapper.class);
			List<Noticereply> replyList=dao.getReplyList(Integer.parseInt(noticeNum));
		
			return replyList;
			}
		
	*/
	public Notice getBoard(String noticeNum){
			
		NoticeMapper dao = sql.getMapper(NoticeMapper.class);
		Notice Notice=dao.getBoard(Integer.parseInt(noticeNum));
				
		return Notice;
			}
		
	
}