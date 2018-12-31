package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
	
	 @RequestMapping("user/login")
	 public ModelAndView login(@Valid User user, BindingResult bindResult, HttpSession session) {
		 ModelAndView mav =new ModelAndView();
		 if (bindResult.hasErrors()) {
				mav.getModel().putAll(bindResult.getModel());
				return mav;
			}
		 mav.setViewName("main");
		 return mav;
	 }
}
