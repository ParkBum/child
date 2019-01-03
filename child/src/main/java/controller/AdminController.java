package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.ChildService;
import logic.User;

@Controller
public class AdminController {
	@Autowired
	ChildService service;
	
	@RequestMapping("admin/list") 
	public ModelAndView list(Integer mnum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userInfo(mnum);
		List<User> userList = service.userList();
		mav.addObject("user",user);
		mav.addObject("userlist",userList);
		return mav;
	}
/*	
	@RequestMapping("admin/info")
	public ModelAndView info(Integer mnum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userInfo(mnum);
		mav.addObject("user",user);
		return mav;
	}*/
}





















