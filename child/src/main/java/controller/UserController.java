package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import logic.ChildService;
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
		mav.addObject(new User());
		return mav;
	}

	@RequestMapping("user/login")
	public ModelAndView login(@Valid User user, BindingResult bindResult, HttpSession session) {
		ModelAndView mav = new ModelAndView("user/loginForm");
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		try {
			User dbuser = service.userSelect(user.getEmail()); // 회원정보 저장
			if (dbuser == null) {
				bindResult.reject("error.login.id");
				mav.getModel().putAll(bindResult.getModel());
				return mav;
			}
			// 존재
			if (user.getPassword().equals(dbuser.getPassword())) {
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
		mav.setViewName("redirect:../main/main.child");
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
//		Map<String, Object> map = new HashMap<String,Object>();
		String email = "";
		String id ="";
		
		for(int i=0;i<18; i++) {
			System.out.println("["+i+"]"+apiResult.split("\"")[i]);
			if(i==13) {
				id =apiResult.split("\"")[i];
			}
			if(i==17) {
				email =apiResult.split("\"")[i];
			}
		}
		return new ModelAndView("user/callback","result", apiResult);
//		회원 관리를 해야하는 부분. 
	}
	
	
	@RequestMapping("user/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:../main/main.child");
		return mav;
	}

	@RequestMapping("user/userForm")
	public ModelAndView userForm() {
		ModelAndView mav = new ModelAndView("user/userForm");
		mav.addObject(new User());
		return mav;
	}

	@RequestMapping("user/userEntry")
	public ModelAndView entry(@Valid User user, BindingResult br) {
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
			mav.setViewName("user/loginForm");
			mav.addObject("user", user);
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
		User user2 = service.userSelect(user.getEmail()); // 비밀번호 검증하기위해서 기존정보조회 /user는 새 정보
		ModelAndView mav = new ModelAndView("user/updateForm");
		if (bindResult.hasErrors()) {
			mav.getModel().putAll(bindResult.getModel());
			return mav;
		}
		// 비밀번호 검증
		if (user.getPassword().equals(user2.getPassword())) { // 비밀번호 일치
			try {
				service.userUpdate(user);
				mav.addObject("user", user);
				mav.setViewName("redirect:../admin/list.child?mnum=" + mnum);
			} catch (Exception e) {
				bindResult.reject("error.login.password");
				mav.getModel().putAll(bindResult.getModel());
				mav.setViewName("user/updateForm");
			}
		} else { // 비밀번호 불일치
			bindResult.reject("error.login.password");
			mav.getModel().putAll(bindResult.getModel());
			mav.setViewName("user/updateForm");
		}
		return mav;
	}


	@RequestMapping("user/userdelete")
	public ModelAndView userdelete(User user, HttpSession session, Integer mnum) {
		ModelAndView mav = new ModelAndView();
		User dbUser = (User) session.getAttribute("loginUser");
		if (user.getPassword().equals(dbUser.getPassword())) {
			try {
				service.userDelete(mnum);
				session.invalidate();
				mav.setViewName("redirect:../main/main.child");
			} catch (Exception e) {
				e.printStackTrace();
				mav.setViewName("user/delete");
			}
		} else { // 비밀번호 불일치
			mav.setViewName("user/delete");
		}
		return mav;
	}
}


