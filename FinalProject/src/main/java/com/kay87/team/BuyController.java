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
import com.kay87.team.dao.BuyMapper;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.FishList;


@Controller
public class BuyController {
	
	private static final Logger logger = LoggerFactory.getLogger(BuyController.class);
	
	@Autowired
	SqlSession sql;
	
	//구매글쓰기 폼 불러오기
	@RequestMapping(value = "/writeBuyBoardForm", method = RequestMethod.GET)
	public String writeBuyBoardForm(Model model, HttpSession session, 
			BuyList buylistFromHistory) {
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		List<BuyList> buylist=dao.getHistorySellerId((String)session.getAttribute("loginId"));
		model.addAttribute("buylist", buylist);
		model.addAttribute("buylistFromHistory", buylistFromHistory);
		
		return "writeBuyBoardForm";
	}
	//구매글쓰기
	@RequestMapping(value = "/writeBuyBoard", method = RequestMethod.GET)
	public String writeBuyBoard(BuyList buyList, HttpSession session){

		BuyMapper dao=sql.getMapper(BuyMapper.class);
		buyList.setBuyerId((String)session.getAttribute("loginId"));
		dao.insertBuyList(buyList);

		return "home";
	}
	
	
	//글쓰기 품목  keyup이벤트
	@RequestMapping(value = "/getFishName", method = RequestMethod.GET)
	public @ResponseBody List<FishList> getFishName(String fishName) {
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		List<FishList> fishlist=dao.getFishName(fishName);
		
		return fishlist;
	}
	
	//구매완료내역출력
	@RequestMapping(value = "/buyListHistory", method = RequestMethod.GET)
	public String buyListHistory(Model model, HttpSession session) {
		
		BuyMapper dao=sql.getMapper(BuyMapper.class);
		String userid = (String)session.getAttribute("loginId");
		System.out.println(userid);
		List<BuyList> buyListHistory=dao.getSuccessBuyList(userid);
		System.out.println(buyListHistory);
		//생선별 구매합계
		List<BuyList> sumPricebyFishName=dao.sumPricebyFishName(userid);
		
		//월별 구매합계
		List<BuyList> sumPricebyMonth= dao.sumPricebyMonth(userid);
		int[] list = new int[12];
		int month=0;
		
		for(int j=0;j<sumPricebyMonth.size();j++) {
			for(int i=0;i<list.length;i++) {
				month = Integer.parseInt(sumPricebyMonth.get(j).getFishName());
				
				if((i+1)==month) {
					list[i]=sumPricebyMonth.get(j).getPrice();
				}
					
			}
		}
		System.out.println(list);
		/*SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		for(BuyList b : buyListHistory) {
		String getdealine = transFormat.format(b.getDeadline());
		}	*/
		model.addAttribute("list", list);
		model.addAttribute("buyListHistory", buyListHistory);
		model.addAttribute("sumPricebyFishName", sumPricebyFishName);
		return "buyListHistory";
	}
	
	//수취확인
		@RequestMapping(value = "/confirm", method = RequestMethod.GET)
		public @ResponseBody int confirm(String buyNum) {
			
			BuyMapper dao=sql.getMapper(BuyMapper.class);
			int result =dao.saleComplete(buyNum);
			
			return result ;
		}

		@RequestMapping(value = "/jqgrid_R", method = RequestMethod.GET, produces = "application/text; charset=utf8")
		public @ResponseBody String jqgrid(String page, String rows, String test, HttpSession session) {
			
			System.out.println(test);
			
			BuyMapper dao=sql.getMapper(BuyMapper.class);
			int total = dao.GetTotalListCount("id1");
			
			List<BuyList> buyListHistory = dao.getSuccessBuyList((String)session.getAttribute("loginId"));
			
			Gson gson = new Gson();
			//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
			String jsonPlace = "{\"rows\":"+ gson.toJson(buyListHistory) + "}";
			System.out.println(jsonPlace);
			
			return jsonPlace;
		}
	/*List<HashMap<String, Object>> bestseller = repository.selectBestseller();*/

}
