package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import logic.Board;
import logic.ChildService;
import logic.Login;
import logic.User;
import util.NaverLoginBO;

@Controller
public class UserController {
	@Autowired
	ChildService service;

	@RequestMapping("user/loginForm")
	public ModelAndView loginForm(HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		ModelAndView mav = new ModelAndView("user/loginForm", "url", naverAuthUrl);
		mav.addObject(new Login());
		return mav;
	}

	@RequestMapping("user/login")
	public ModelAndView login(@Valid Login login, BindingResult bindResult, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		ModelAndView mav = new ModelAndView("user/loginForm", "url", naverAuthUrl);
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}

		try {
			User dbuser = service.userSelect(login.getLogin_email()); // 회원정보 저장
			if (dbuser == null) {
				bindResult.reject("error.login.id");
				mav.getModel().putAll(bindResult.getModel());
				mav.setViewName("redirect:../user/loginForm.child");
				return mav;
			}
			// 존재
			if (service.getHashValue(login.getLogin_password()).equals(dbuser.getPassword())) {
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
		mav.setViewName("redirect:../main/main2.child");
		return mav;
	}

	@RequestMapping("user/list")
	public ModelAndView list(Integer mnum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.userInfo(mnum); // 개인정보 조회
		List<User> userList = service.userList(); // 관리자용 회원목록 조회하기
		mav.addObject("user", user);
		mav.addObject("userlist", userList);
		return mav;
	}

//관리자가 강제탈퇴
	@RequestMapping("user/delete")
	public ModelAndView delete(Integer mnum, HttpSession session, User user) {
		ModelAndView mav = new ModelAndView();
		List<Board> myboard = service.myBoardList(mnum);
		service.userMessageDelete(mnum);
		service.userCommentDelete(mnum);
		for(Board board : myboard) {
			int bnum = board.getBnum();
			service.commentDeleteList(bnum);			
		}
		service.userBoardDelete(mnum);
		service.userDelete(mnum);
		mav.setViewName("redirect:../user/list.child");
		return mav;
	}

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;

	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping("user/callback")
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		// System.out.println("여기 안나와??");
		String email = "";
		String id = "";
		for (int i = 0; i < 18; i++) {
			// System.out.println(apiResult.split("\"")[i]);
			if (i == 13)
				id = apiResult.split("\"")[i];
			if (i == 17)
				email = apiResult.split("\"")[i];
		}
		// .toString() 했을때[L 로 되어있어서 배열형태인 것을 알게 되었다.

		User user = new User();
		user.setEmail(email);
		user.setId(id);
		ModelAndView mav = new ModelAndView();
		if (service.userSelect(email) == null) {
			session.setAttribute("entryUser", user);
			mav.setViewName("redirect:../user/userForm.child");
			return mav;/* new ModelAndView("user/callback","result", apiResult); */
		}
		session.setAttribute("loginUser", service.userSelect(email));
		mav.setViewName("redirect:../main/main2.child");
		return mav; // new ModelAndView("user/callback"/*,"result", apiResult*/);
		// 회원 관리를 해야하는 부분.
	}

	@RequestMapping("user/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:../main/main2.child");
		return mav;
	}

	@RequestMapping("user/userForm")
	public ModelAndView userForm() {
		ModelAndView mav = new ModelAndView("user/userForm");
		mav.addObject(new User());
		return mav;
	}

	@RequestMapping("user/userEntry")
	public ModelAndView entry(@Valid User user, BindingResult br, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/userForm");
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			mav.setViewName("user/userForm");
			// alert창 띄우고 유효성 검증은 그대로....
			return mav;
		}
		try {
			if (service.userSelect(user.getEmail()) != null || service.userSelectnick(user.getNickname()) != null) {
				mav.addObject(user);
				return new ModelAndView("user/userForm");
			}
			int mnum = service.maxnum();
			mnum = mnum + 1;
			user.setMnum(mnum);
			service.userCreate(user);
			if (user.getId() != null) {
				mav.setViewName("main/main2");
				session.setAttribute("loginUser", user);
				return mav;
			}
			mav.addObject("msg","가입을 축하드립니다.");
			mav.addObject("url","../user/loginForm.child");
			mav.setViewName("alert");
			Login login = new Login();
			mav.addObject("login", login);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;

	}

	@RequestMapping("user/*")
	public ModelAndView userAll(User user) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping("user/update")
	public ModelAndView update(@Valid User user, HttpSession session, Integer mnum, BindingResult bindResult) {
		ModelAndView mav = new ModelAndView("user/updateForm");
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		try {
			service.userUpdate(user);
			session.invalidate();
			mav.addObject("user", user);
			mav.setViewName("redirect:../main/main2.child");
		} catch (Exception e) {
			bindResult.reject("error.login.password");
			mav.getModel().putAll(bindResult.getModel());
			mav.setViewName("user/updateForm");
		}

		return mav;
	}

	@RequestMapping(value = "user/chgPass", method = RequestMethod.POST)
	public ModelAndView chgPass(Integer mnum, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/updateForm");
		String newpass1 = request.getParameter("newpass1");
		String newpass2 = request.getParameter("newpass2");
		if (newpass1.length() <= 4 || newpass2.length() <= 4) {
			mav.setViewName("redirect:../user/chgPass.child");
		}
		if (newpass1.equals(newpass2)) {
			service.changePass(newpass1, mnum);
			session.invalidate();
			mav.setViewName("redirect:../user/loginForm.child");
		} else {
			mav.setViewName("user/updateForm");
		} 
		return mav;
	}

	@RequestMapping(value = "user/userdelete")
	public ModelAndView userdelete(Integer mnum, HttpSession session, String password) {
		ModelAndView mav = new ModelAndView();
		User dbUser = (User) session.getAttribute("loginUser");
		List<Board> myboard = service.myBoardList(mnum);
		if (service.getHashValue(password).equals(dbUser.getPassword())) {
			try {
				service.userMessageDelete(mnum);
				service.userCommentDelete(mnum);
				for(Board board : myboard) {
					int bnum = board.getBnum();
					service.commentDeleteList(bnum);			
				}
				service.userBoardDelete(mnum);
				service.userDelete(mnum);
				session.invalidate();
				mav.setViewName("redirect:../main/main2.child");
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("user/list");
			}
		} else { // 비밀번호 불일치
			mav.setViewName("user/list");
		}
		return mav;
	}

	@RequestMapping(value = "user/passConfirm", method = RequestMethod.POST)
	public ModelAndView confirm(Integer mnum, HttpSession session, String password) {
		ModelAndView mav = new ModelAndView();
		User dbUser = (User) session.getAttribute("loginUser");
		if (service.getHashValue(password).equals(dbUser.getPassword())) {
			mav.setViewName("redirect:../user/updateForm.child?mnum=" + mnum);
		} else {
			mav.setViewName("redirect:../user/list.child?mnum=" + mnum);
		}
		return mav;
	}

	@RequestMapping(value = "user/myBoardList")
	public ModelAndView myBoardList(Integer mnum, Integer pageNum) {
		ModelAndView mav = new ModelAndView();
		String nick = service.getNickName(mnum);
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		int limit = 10;
		int myBoardCnt = service.myBoardCount(mnum); //myboard 갯수
		System.out.println(myBoardCnt);
		List<Board> myboard = service.myBoardLists(mnum,limit,pageNum);
		int maxpage = (int) ((double) myBoardCnt / limit + 0.95); // 전체 페이지 수
		int startpage = (int) ((pageNum / 10.0 + 0.9) - 1) * 10 + 1; // 화면에 표시될 시작 페이지 수
		int endpage = startpage + 9; // 화면에 표시될 마지막 페이지 수
		if (endpage > maxpage)
			endpage = maxpage;
		int myCnt = myBoardCnt - (pageNum - 1) * limit; // 화면에 보여지는 myboard 순서
		for (Board board : myboard) { // 제목에 댓글 수 추가아아아
			board.setCommentcnt(service.commentCount(board.getBnum()));
			if (board.getbType() == 3) {
				board.setBoarddeal(service.getBoardDeal(board.getBnum()));
			}
		}
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("myBoardCnt", myBoardCnt);
		mav.addObject("myCnt", myCnt);
		mav.addObject("nickname", nick);
		mav.addObject("myboard", myboard);
		mav.setViewName("user/myBoard");
		return mav;
	}

	@RequestMapping(value = "user/myBoardDelete")
	public ModelAndView myBoardDelete(Integer[] checkBoard, Integer mnum) {
		ModelAndView mav = new ModelAndView();
		service.myBoardDelete(checkBoard);
		mav.setViewName("redirect:../user/myBoardList.child?mnum=" + mnum);
		return mav;
	}
}
