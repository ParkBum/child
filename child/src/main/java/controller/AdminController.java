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
		User user = service.userInfo(mnum); // 개인정보 조회
		List<User> userList = service.userList(); // 관리자용 회원목록 조회하기
		mav.addObject("user", user);
		mav.addObject("userlist", userList);
		return mav;
	}

	@RequestMapping("admin/delete")
	public ModelAndView delete(User user, HttpSession session, Integer mnum) {
		ModelAndView mav = new ModelAndView();
		User dbUser = (User) session.getAttribute("loginUser");
		if(dbUser.getMnum() == 1) {
			service.userDelete(mnum);
			mav.setViewName("redirect:../admin/list.child");
		}
		return mav;
	}
}
