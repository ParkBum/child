package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ChildService;
import logic.User;

@Controller
public class UserController {
	@Autowired
	ChildService service;
	
	@RequestMapping("user/loginForm")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView("user/login");
		mav.addObject(new User()); 
		return mav;
	}
	
/*	 @RequestMapping("user/login")
	 public ModelAndView login(@Valid ) {
		 
	 }*/
}
