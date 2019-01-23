package controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import logic.ChildService;
import logic.Daycare;
import logic.Daycare_total;

@Controller
public class MapController {
	@Autowired
	ChildService service;
	 
	@RequestMapping("main/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping(value="map/map")
	public ModelAndView map(String gu) {
		ModelAndView mav = new ModelAndView();	
		Daycare_total daytotal = service.getTotal();
		if(gu != null) {
			List<Daycare> guMarkerlist = service.gumarkerlist(gu);
			for(Daycare d : guMarkerlist) {
				String addr_substr = d.getAddr().substring(d.getAddr().indexOf("특별시")+3, d.getAddr().length());
				d.setAddr(addr_substr);
			}
			mav.addObject("gu",gu);
			mav.addObject("guMarkerlist",guMarkerlist);
			}
		mav.addObject("daytotal",daytotal);
		return mav;
	}

}
