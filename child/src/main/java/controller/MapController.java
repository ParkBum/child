package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ChildService;
import logic.Daycare;

@Controller
public class MapController {
	@Autowired
	ChildService service;
	
	@RequestMapping("main/main2")
	public ModelAndView main2() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("map/map")
	public ModelAndView map() {
		ModelAndView mav = new ModelAndView();	
		return mav;
	}
	
}
