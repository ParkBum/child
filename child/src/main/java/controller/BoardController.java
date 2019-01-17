package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.ChildService;
import logic.Comment;
import logic.Daycare;
import logic.User;

@Controller
public class BoardController {

	@Autowired
	ChildService service;

	@RequestMapping(value = "board/list")
	public ModelAndView list(Integer bType, Integer pageNum, String filterType, String searchType, String filterType2,
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
		if (filterType2 == null || filterType2.toString().equals("")) {
			filterType2 = null;
		}
		int limit = 10; // 한 페이지에 출력할 게시물 수
		int listcount = service.boardCount(bType, filterType, searchType, searchContent, filterType2);
		List<Board> boardlist = service.boardList(bType, filterType, searchType, searchContent, pageNum, filterType2, limit);
		int maxpage = (int) ((double) listcount / limit + 0.95); // 전체 페이지 수
		int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 화면에 표시될 시작 페이지 수
		int endpage = startpage + 9; // 화면에 표시될 마지막 페이지 수
		if (endpage > maxpage)
			endpage = maxpage;
		int boardcnt = listcount - (pageNum - 1) * limit; // 화면에 보여지는 게시물 순서
		
		for(Board board : boardlist) { //댓글 수 추가아아아
			board.setCommentcnt(service.commentCount(board.getBnum()));
		}
		mav.addObject("filterType2", filterType2);
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
	public ModelAndView info(Integer bnum, Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		Comment comment = new Comment();
		Date date = new Date();
		Board board = service.getBoard(bnum);
		List<Comment> commentList = service.commentList(bnum);
		board.setContent(board.getContent().replaceAll("\r\n","<br>"));
		// 댓글 10개 넘어가면 다음페이지로 넘기기
/*		int limit = 10;
		int commentCnt = service.commentCount(bnum);
		int maxpage = (int) ((double) commentCnt / limit + 0.95); // 전체 페이지 수
		int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 화면에 표시될 시작 페이지 수
		int endpage = startpage + 9; // 화면에 표시될 마지막 페이지 수
		if (endpage > maxpage)
			endpage = maxpage;
		service.readcntAdd(bnum);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("commentCnt", commentCnt);*/
		for(Comment c : commentList) {
			c.setNickname(service.getNickName(c.getMnum()));
		}
		mav.addObject("today", date);
		mav.addObject("board", board);
		mav.addObject("commentList", commentList);
		mav.addObject("comment", comment);
		return mav;
	}

	@RequestMapping(value = "board/write", method = RequestMethod.POST)
	public ModelAndView write(@Valid Board board, BindingResult bindingResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("board/writeForm");
		if (bindingResult.hasErrors()) { // 에러 발생한 경우
			mav.getModel().putAll(bindingResult.getModel()); // 에러 메세지 전달
			return mav;
		}
		try {
			service.boardInsert(board, request);
			mav.addObject("board", board);
			mav.setViewName("redirect:/board/list.child?bType=" + board.getbType());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "board/delete")
	public ModelAndView delete(Integer bnum) {
		ModelAndView mav = new ModelAndView("board/info");
		service.commentDeleteList(bnum); //게시글 삭제할때 댓글삭제 한번에 하기
		Board board = service.getBoard(bnum);
		service.boardDelete(bnum);
		mav.setViewName("redirect:/board/list.child?bType=" + board.getbType()); //이거 btype 수정해야함
		return mav;
	}

	@RequestMapping(value = "board/updateForm")
	public ModelAndView updateForm(Integer bnum, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = service.getBoard(bnum);
		List<Daycare> gulist = null;
		if(board.getbType() == 2) { 
		  gulist = service.gulist();
		  mav.addObject("gulist",gulist);
		}
		mav.addObject("board", board);
		return mav;
	}

	@RequestMapping(value = "board/update", method = RequestMethod.POST)
	public ModelAndView update(@Valid Board board, BindingResult bindingResult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("board/updateForm");
		service.boardUpdate(board, request);
		mav.addObject("board", board);
		mav.setViewName("redirect:/board/info.child?bnum=" + board.getBnum());
		return mav;
	}

	@RequestMapping(value = "board/commentWrite", method = RequestMethod.POST)
	public ModelAndView commentWrite(@Valid Comment comment, BindingResult bindingResult, HttpSession session) {
		ModelAndView mav = new ModelAndView("board/info");
		if (bindingResult.hasErrors()) { // 에러 발생한 경우
			mav.getModel().putAll(bindingResult.getModel()); // 에러 메세지 전달
			return mav;
		}
		User user = (User) session.getAttribute("loginUser");// 현재 유저 정보
		service.commentWrite(comment);
		mav.setViewName("redirect:/board/info.child?bnum=" + comment.getBnum());
		return mav;
	}

	@RequestMapping(value = "board/commentDelete")
	public ModelAndView commentDelete(Integer bnum, Integer cnum) {
		ModelAndView mav = new ModelAndView();
		service.commentDelete(cnum);
		mav.setViewName("redirect:/board/info.child?bnum=" + bnum);
		return mav;
	}

	@RequestMapping(value = "board/commentUpdate", method = RequestMethod.POST)
	public ModelAndView commentUpdate(@Valid Comment comment, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView("board/info");
		if (bindingResult.hasErrors()) { // 에러 발생한 경우
			mav.getModel().putAll(bindingResult.getModel()); // 에러 메세지 전달
			return mav;
		}
		service.commentUpdate(comment);
		mav.setViewName("redirect:/board/info.child?bnum=" + comment.getBnum());
		return mav;
	}
//대댓글
	@RequestMapping(value = "board/recomment", method = RequestMethod.POST)
	public ModelAndView recomment(@Valid Comment comment, BindingResult bindingResult) {
		ModelAndView mav = new ModelAndView();
		if (bindingResult.hasErrors()) { // 에러 발생한 경우
			mav.getModel().putAll(bindingResult.getModel()); // 에러 메세지 전달
			return mav;
		}
		service.reWrite(comment);
		mav.addObject("comment",comment);
		mav.setViewName("redirect:/board/info.child?bnum=" + comment.getBnum());
		return mav;
	}

	@RequestMapping(value = "board/addRed")
	public ModelAndView addRed(Integer mnum) {
		ModelAndView mav = new ModelAndView(); 
		service.addRed(mnum);
		return mav;
	}

	@RequestMapping(value = "board/*")
	public ModelAndView boardAll(Board board, Comment comment) {
		ModelAndView mav = new ModelAndView();
		List<Daycare> gulist = null;
		if(board.getbType() == 2) { 
		  gulist = service.gulist();
		  mav.addObject("gulist",gulist);
		}
		mav.addObject("board", board);
		return mav;
	}

}
