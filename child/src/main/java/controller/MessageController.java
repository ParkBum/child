package controller;

import java.util.Date;
import java.util.List;

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
		String phone = request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
				+ request.getParameter("phone3");
		msg.setPhone(phone);
		service.buyItem(msg);
		Board board = service.getBoard(msg.getBnum());
		mav.addObject("board", board);
		mav.setViewName("redirect:/board/info.child?bnum=" + msg.getBnum());
		return mav;
	}

	@RequestMapping(value = "user/myMessageList")
	public ModelAndView myMessageList(Integer mnum) {
		ModelAndView mav = new ModelAndView();
		List<Message> messageList = service.getMyMessageList(mnum);
		for (Message msg : messageList) {
			msg.setBoard(service.getBoard(msg.getBnum()));
			msg.setUser(service.userInfo(msg.getBuynum()));
		}
		mav.addObject("messageList", messageList);
		return mav;
	}

	@RequestMapping(value = "user/dealYes")
	public ModelAndView dealYes(Integer msgnum) {
		ModelAndView mav = new ModelAndView("user/myMessageList");
		Message msg = service.getMessage(msgnum);
		service.updateDeal(msgnum, 1, new Date());
		mav.setViewName("redirect:/user/myMessageList.child?mnum=" + msg.getSellnum());
		return mav;
	}

	@RequestMapping(value = "user/dealNo")
	public ModelAndView dealNo(Integer msgnum) {
		ModelAndView mav = new ModelAndView("user/myMessageList");
		Message msg = service.getMessage(msgnum);
		service.updateDeal(msgnum, 3, null);
		mav.setViewName("redirect:/user/myMessageList.child?mnum=" + msg.getSellnum());
		return mav;
	}
	
}
