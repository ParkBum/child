package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@RequestMapping(value = "board/list")
	public ModelAndView list(Integer btype) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

}
