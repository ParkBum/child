package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.ChildService;
import logic.Message;

@Controller
public class MessageController {
	@Autowired
	ChildService service;

	@RequestMapping(value = "board/buyItem")
	public ModelAndView buyItem(Message msg, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("board/info");
		String phone = request.getParameter("phone1") + request.getParameter("phone2") + request.getParameter("phone3");
		msg.setPhone(Integer.parseInt(phone));
		service.buyItem(msg);
		Board board = service.getBoard(msg.getBnum());
		mav.addObject("board", board);
		mav.setViewName("redirect:/board/info.child?bnum=" + msg.getBnum());
		return mav;
	}

}
