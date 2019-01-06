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
	
	@RequestMapping("main/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		
//		List<String> gulist = service.gusort();
		List<Integer> cntlist = service.cntsort();
//		
//		mav.addObject("gulist", gulist);
		mav.addObject("cntlist", cntlist);
		return mav;
	}
	
	@RequestMapping("map/map")
	public ModelAndView map() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("map/search")
	public ModelAndView search(String gu,String type,String bus, String word) {
		ModelAndView mav = new ModelAndView();
		if(type=="") {
			type=null;
		}
		if(bus=="") {
			bus=null;
		}
		if(word=="") {
			word=null;
		}
		List<String> addr = service.getpoint(gu,type,bus,word);
		mav.addObject("addr",addr);
		mav.setViewName("redirect:map.child");
		return mav;
	}
	
	
}
