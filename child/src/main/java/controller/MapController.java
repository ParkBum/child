package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ChildService;

@Controller
public class MapController {
	@Autowired
	ChildService service;
	
	@RequestMapping("main/main2")
	public ModelAndView main2() {
		ModelAndView mav = new ModelAndView();
		
//		List<String> gulist = service.gusort();
//		List<Integer> cntlist = service.cntsort();
//		
//		mav.addObject("gulist", gulist);
//		mav.addObject("cntlist", cntlist);
		return mav;
	}
	
	@RequestMapping("map/map")
	public ModelAndView map() {
		ModelAndView mav = new ModelAndView();
		/*List<Daycare> daycarelist = service.daycareList();
		mav.addObject("daycarelist",daycarelist);*/
		return mav;
	}
	
	@RequestMapping("map/search")
	public ModelAndView search(String gu,String type,String bus) {
		ModelAndView mav = new ModelAndView();
		if(type=="") {
			type=null;
		}
		if(bus=="") {
			bus=null;
		}
		List<String> addr = service.getpoint(gu,type,bus);
		mav.addObject("addr",addr);
		mav.setViewName("map/map");
		return mav;
	}
}
