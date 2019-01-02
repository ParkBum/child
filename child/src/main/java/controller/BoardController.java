package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.ChildService;

@Controller
public class BoardController {

	@Autowired
	ChildService service;
	
	@RequestMapping(value = "board/list")
	public ModelAndView list(Integer bType, Integer pageNum, String filterType, String searchType, String searchContent) {
		ModelAndView mav = new ModelAndView();
		switch(bType) { // 게시판 종류
			case 1 : mav.setViewName("board/community"); break; // 자유
			case 2 : mav.setViewName("board/review"); break;	// 후기
			case 3 : mav.setViewName("board/market"); break;	// 중고거래
				default : break;
		}
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10; // 한 페이지에 출력할 게시물 수
		int listcount = service.boardCount(bType, filterType, searchType, searchContent);
		List<Board> boardlist = service.boardList(bType, filterType, searchType, searchContent, pageNum, limit);
		int maxpage = (int) ((double) listcount / limit + 0.95); // 전체 페이지 수
		int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 화면에 표시될 시작 페이지 수
		int endpage = startpage + 9; // 화면에 표시될 마지막 페이지 수
		if (endpage > maxpage)
			endpage = maxpage;
		int boardcnt = listcount - (pageNum - 1) * limit; // 화면에 보여지는 게시물 순서
		mav.addObject("filterType", filterType);
		mav.addObject("searchType", searchType);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardcnt", boardcnt);
		return mav;
		
	}
}
