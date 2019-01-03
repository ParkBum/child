package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.ChildService;

@Controller
public class BoardController {

	@Autowired
	ChildService service;

	@RequestMapping(value = "board/*")
	public ModelAndView boardAll(Board board) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", board);
		return mav;
	}

	@RequestMapping(value = "board/list")
	public ModelAndView list(Integer bType, Integer pageNum, String filterType, String searchType,
			String searchContent) {
		ModelAndView mav = new ModelAndView();
		switch (bType) { // 게시판 종류
		case 1:
			mav.setViewName("board/community");
			break; // 자유
		case 2:
			mav.setViewName("board/review");
			break; // 후기
		case 3:
			mav.setViewName("board/market");
			break; // 중고거래
		default:
			break;
		}
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if (filterType == null || filterType.toString().equals("")) {
			filterType = null;
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

	@RequestMapping(value = "board/info")
	public ModelAndView info(Integer bnum) {
		ModelAndView mav = new ModelAndView();
		Board board = service.getBoard(bnum);
		mav.addObject("board", board);
		return mav;
	}

	@RequestMapping(value = "board/write", method = RequestMethod.POST)
	public ModelAndView write(@Valid Board board, BindingResult bindingResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (bindingResult.hasErrors()) { // 에러 발생한 경우
			mav.getModel().putAll(bindingResult.getModel()); // 에러 메세지 전달
			return mav;
		}
		try {
			service.boardInsert(board, request);
			mav.addObject("board", board);
			mav.setViewName("redirect:/board/list.child");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
}
