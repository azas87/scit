package com.kay87.team;



import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kay87.team.dao.BuyMapper;
import com.kay87.team.dao.ReviewMapper;
import com.kay87.team.util.PageNavigator;
import com.kay87.team.vo.BestSeller;
import com.kay87.team.vo.BuyList;
import com.kay87.team.vo.AvgList;
import com.kay87.team.vo.WishAvgList;


@Controller
public class FishInfoListController {
	
	
	@Autowired
	SqlSession sql;	
	

	@RequestMapping(value = "/fishInfoList", method = RequestMethod.GET)
	public String fishInfoList() {
	
		return"fishInfoList2";
	
	}

/*	//첫 메인화면에서 전체 리스트
	@RequestMapping(value = "/allBuyList", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	public @ResponseBody String allBuyList() {			
		BuyMapper mapper = sql.getMapper(BuyMapper.class);
		System.out.println("allBuyList");
		List<BuyList> allbuylist = mapper.allBuyList();			
		
		Gson gson = new Gson();
		//String jsonPlace = "{\"total\":"+navi.getTotalPageCount()+",\"rows\":"+ gson.toJson(buyListHistory) + "}";
		String jsonPlace = "{\"rows\":"+ gson.toJson(allbuylist) + "}";
		System.out.println(jsonPlace);		
		
		return jsonPlace;
	}	
	*/
	
	
}
