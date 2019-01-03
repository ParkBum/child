package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ChildService;

@Controller
public class MapController {
	@Autowired
	ChildService service;
	
	@RequestMapping("map/map")
	public ModelAndView map() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
}
