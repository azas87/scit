package com.kay87.team;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kay87.team.dao.FishInfoListMapper;
import com.kay87.team.dao.MemberMapper;
import com.kay87.team.vo.FishCategoryList;
import com.kay87.team.vo.FishList;


@Controller
public class FishInfoListController {
	
	
	@Autowired
	SqlSession sql;	
	

	@RequestMapping(value = "/fishInfoList", method = RequestMethod.GET)
	public String fishInfoList(Model model) {
		
		FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
		List<FishList> fishList=mapper.getFishInfo();
		model.addAttribute("fishList", fishList);
		
		return"fishInfoList2";
	
	}
	
	@RequestMapping(value = "/writeFishInfoForm", method = RequestMethod.GET)
	public String writeFishInfoForm(Model model) {

		FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
		List<FishCategoryList> categoryList = mapper.getCategory();
		model.addAttribute("categoryList", categoryList);
		FishList fish = new FishList("", 0, "", "", "", "");
		return"writeFishInfoForm";
	
	}
	
	@RequestMapping(value = "/newFishInfo", method = RequestMethod.GET)
	public String newFishInfo(Model model, FishList fishInfo) {
	
		FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
		mapper.newFishInfo(fishInfo);
	
		return"redirect:/fishInfoList";
	
	}
	

	@RequestMapping(value = "/deleteFishInfo", method = RequestMethod.GET)
	public String deleteFishInfo(String fishName) {
	
		FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
		mapper.deleteFishInfo(fishName);
	
		return"redirect:/fishInfoList";
	
	}
	
	@RequestMapping(value = "/updateFishInfoForm", method = RequestMethod.GET)
	public String editFishInfo(String fishName, Model model) {
	
		FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
		List<FishCategoryList> categoryList = mapper.getCategory();
		FishList fish = mapper.selectOneFish(fishName);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("fish", fish);
		
		return "updateFishInfoForm";
	
	}
	
	@RequestMapping(value = "/updateFishInfo", method = RequestMethod.GET)
	public String updateFishInfo(FishList fishInfo) {
		System.out.println("제대로오는지"+fishInfo);
		FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
		mapper.updateFishInfo(fishInfo);
	
		return"redirect:/fishInfoList";
	
	}
	
	
	@RequestMapping(value = "/getFishList", method = RequestMethod.GET)
	public @ResponseBody List<FishList> checkId(String fishCategoryNum) {
		System.out.println("컨트롤러");
		FishInfoListMapper mapper = sql.getMapper(FishInfoListMapper.class);
		List<FishList> list=mapper.getFishList(fishCategoryNum);
		
		System.out.println("여기맞나"+list);
		
		return list;
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
