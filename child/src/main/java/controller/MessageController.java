package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.ChildService;

@Controller
public class MessageController {
	@Autowired
	ChildService service;

	@RequestMapping(value = "board/sendMsg")
	public ModelAndView sendMsg(Board board) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

}
