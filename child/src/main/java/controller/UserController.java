package controller;

import java.io.IOException; 

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
			if (login.getLogin_password().equals(dbuser.getPassword())) {
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

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;

	/* NaverLoginBO */
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO){
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping("user/callback")
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		String apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println("여기 안나와??");
		String email = "";
		String id ="";
		for(int i=0;i<18; i++) {
			System.out.println(apiResult.split("\"")[i]);
			if(i==13) 	id =apiResult.split("\"")[i];
			if(i==17) 	email =apiResult.split("\"")[i];
		}
		//.toString() 했을때[L 로 되어있어서 배열형태인 것을 알게 되었다.

		User user = new User();
		user.setEmail(email);
		user.setId(id);
		ModelAndView mav = new ModelAndView();
		if(service.userSelect(email) == null) {
			session.setAttribute("entryUser", user);
			mav.setViewName("redirect:../user/userForm.child");		
			return mav;/*new ModelAndView("user/callback","result", apiResult);*/
		}
		session.setAttribute("loginUser", service.userSelect(email));
		mav.setViewName("redirect:../main/main2.child");	
		return mav; //new ModelAndView("user/callback"/*,"result", apiResult*/);
//		회원 관리를 해야하는 부분. 
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
			return mav;
		}
		try {
			if(service.userSelect(user.getEmail())!=null || service.userSelectnick(user.getNickname())!=null) {
				mav.addObject(user);
				return new ModelAndView("user/userForm");
			}
			int mnum = service.maxnum();
			mnum = mnum + 1;
			user.setMnum(mnum);
			service.userCreate(user);
			if(user.getId()!=null) {
				mav.setViewName("main/main2");
				session.setAttribute("loginUser", user);
				return mav;
			}
			mav.setViewName("user/loginForm");
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
	public ModelAndView update(@Valid User user, BindingResult bindResult, Integer mnum, HttpSession session) {
		User user2 = service.userSelect(user.getEmail()); // 비밀번호 검증하기위해서 기존정보조회 
		ModelAndView mav = new ModelAndView("user/updateForm");
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
//		service.changePass(user);
		// 비밀번호 검증
		 // 비밀번호 일치
			try {
				//변경할 비밀번호를 기존비밀번호에 넣기
		//		user.setPassword(user.getPassword1());
				service.userUpdate(user);
				session.invalidate();
				mav.addObject("user", user);
		//		mav.addObject("msg","수정했습니다. 다시 로그인하세요.");		
		//		mav.addObject("url","../user/loginForm.child");
		//		mav.setViewName("alert");
				mav.setViewName("redirect:../main/main2.child");
			} catch (Exception e) {
				bindResult.reject("error.login.password");
				mav.getModel().putAll(bindResult.getModel());
				mav.setViewName("user/updateForm");
			}	
	 
		return mav;
	}
	
	@RequestMapping(value = "user/chgPass", method = RequestMethod.POST)
	public ModelAndView chgPass(@Valid User user, BindingResult bindResult, Integer mnum, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/updateForm");
		String newpass1 = request.getParameter("newpass1");
		String newpass2 = request.getParameter("newpass2");
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		if(newpass1.equals(newpass2)) {
			service.changePass(user);
			session.invalidate();
			mav.addObject("user",user);
			mav.setViewName("redirect:../user/loginForm.child");
		} else {
			mav.setViewName("user/updateForm");
		}
		return mav;
	}

	@RequestMapping(value = "user/userdelete")
	public ModelAndView userdelete(String password, HttpSession session, Integer mnum) {
		ModelAndView mav = new ModelAndView();
		User dbUser = (User) session.getAttribute("loginUser");
		if (password.equals(dbUser.getPassword())) {
			try {
				service.userCommentDelete(mnum);
				service.userBoardDelete(mnum);
				service.userDelete(mnum);
				session.invalidate();
				mav.setViewName("redirect:../main/main2.child");
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("user/delete");
			}
		} else { // 비밀번호 불일치
			mav.setViewName("user/delete");
		}
		return mav;
	}
	
 
	@RequestMapping(value = "user/passConfirm", method = RequestMethod.POST)
	public ModelAndView confirm(String password, Integer mnum, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User dbUser = (User) session.getAttribute("loginUser");
		if(password.equals(dbUser.getPassword())) {
			mav.setViewName("redirect:../user/updateForm.child?mnum="+ mnum); 
		} else {
			mav.setViewName("redirect:../admin/list.child?mnum="+ mnum);
		}
		return mav;
	}
}


















