package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.ChildService;
import logic.User;

@Controller
public class UserController {
	@Autowired
	ChildService service;

	@RequestMapping("main/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping(value = "user/loginForm", method = RequestMethod.GET)
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView("user/loginForm");
		mav.addObject(new User());
		return mav;
	}

	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	public ModelAndView login(@Valid User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/loginForm");
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		try {
			User dbuser = service.userSelect(user.getEmail()); //회원정보 저장
			if (dbuser == null) {
				bindResult.reject("error.login.id");
				mav.getModel().putAll(bindResult.getModel());
				return mav;
			}
			//존재
			if (user.getPassword().equals(dbuser.getPassword())) {
				session.setAttribute("loginUser", dbuser);
			} else {
				bindResult.reject("error.login.password");
				mav.getModel().putAll(bindResult.getModel());
				return mav;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			bindResult.reject("error.user.login");
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		mav.setViewName("redirect:../main/main.child");
		return mav;
	}

	@RequestMapping("user/userForm")
	public ModelAndView userForm() {
		ModelAndView mav = new ModelAndView("user/userForm");
		mav.addObject(new User());
		return mav;
	}

	@RequestMapping("user/userEntry")
	public ModelAndView entry(@Valid User user, BindingResult br) {
		ModelAndView mav = new ModelAndView("user/userForm");
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			int mnum = service.maxnum();
			user.setMnum(mnum);
			service.userCreate(user);
			mav.setViewName("user/login");
			mav.addObject("user", user);
		} catch (DataIntegrityViolationException e) {
			br.reject("error.duplicate.user");
		}
		return mav;
	}
}
