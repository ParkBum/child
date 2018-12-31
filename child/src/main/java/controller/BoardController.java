package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@RequestMapping(value = "board/list")
	public ModelAndView list(Integer btype, Integer pageNum) {
		switch(btype) { // 게시판 종류
			case 1 : break; // 자유
			case 2 : break;	// 후기
			case 3 : break;	// 중고거래
				default : break;
		}
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
