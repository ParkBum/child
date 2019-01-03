package controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import logic.ChildService;
import logic.User;

@Controller
public class UserController {
	@Autowired
	ChildService service;

	@RequestMapping("main/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}


	@RequestMapping("user/loginForm")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView("user/loginForm");
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
			User dbuser = service.userSelect(user.getEmail()); //회원정보 저장
			if (dbuser == null) {
				bindResult.reject("error.login.id");
				mav.getModel().putAll(bindResult.getModel());
				return mav;
			}
			//존재
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
			return mav;
		}
		try {
			int mnum = service.maxnum();
			mnum = mnum+1;
			user.setMnum(mnum);
			service.userCreate(user);
			mav.setViewName("user/loginForm");
			mav.addObject("user", user);
		} catch (DataIntegrityViolationException e) {
			br.reject("error.duplicate.user");
		}
		return mav;

	}
	@RequestMapping("/user/emailauth.html")
	public ModelAndView getMessage() { //매개변수가 없다.
		Map map = new HashMap();
		map.put("result", "비동기 통신 결과");
		map.put("item", "비동기 통신 아이템");
		return new ModelAndView("jsonView",map); //jsonview 는 dispatche.xml 의 jsonview 를 가져옴.
	}
}




/*	@RequestMapping("user/emailAuth.do")
	public ModelAndView entry(User user) {
		ModelAndView mav = new ModelAndView();
		String email = user.getEmail();
		String authNum = "";
		authNum = RandomNum();
		sendEmail(email.toString(), authNum);
		mav.setViewName("user/emailAuth");
		mav.addObject("email",email);
		mav.addObject("authNum",authNum);
		return mav;
	}

	private void sendEmail(String email, String authNum) {
		String from = "20dy@naver.com";
		try{
		 Properties prop = new Properties();	
		 prop.put("mail.smtp.host"	,"smtp.naver.com");	
		 prop.put("mail.smtp.starttls.enable"	,"true");
//		 prop.put("mail.user", mail.getNaverid());
//		 prop.put("mail.from", mail.getNaverid());
		 prop.put("mail.debug", "true");				
		 prop.put("mail.smtp.auth", "true");			 
		 prop.put("mail.smtp.port", "465");
		 prop.put("mail.smtp.user", email);
		 prop.put("mail.smtp.socketFactory.port", "465");
		 prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		 prop.put("mail.smtp.socketFactory.fallback", "false");
		 Session session = Session.getInstance(prop,
				 new javax.mail.Authenticator() {
			 protected PasswordAuthentication getPassswordAuthentication() {
				 return new PasswordAuthentication("20dy@naver.com", "park0405!@!");
			 }
		 });	//메일서버에 연결
		 String content = "인증번호는 ["+authNum+"] 입니다.";
		 MimeMessage msg = new MimeMessage(session);	//메일로 전송할 객체 생성 
			msg.setFrom(new InternetAddress(from,MimeUtility.encodeText("운영자","UTF-8","B")));
			InternetAddress[] addr = {new InternetAddress(email)};
			msg.setRecipients(Message.RecipientType.TO, addr);	// 보낸 사람, 여러명 
			msg.setSubject("인증번호 발급");
			msg.setSentDate(new Date());	//보낸 날짜
			msg.setContent(content,"text/html;charset=euc-kr");
			Transport.send(msg);	//메일 전송 실행
		} catch (MessagingException me) {
			me.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
	/*private String RandomNum() {
		StringBuffer br = new StringBuffer();
		for(int i=0; i<=6; i++) {
			int n = (int)(Math.random() * 10);
			br.append(n);
		}
		return br.toString();
	}
	*/
	/*@RequestMapping("user/emailAuth.child")
	public ModelAndView policyList(){
	      AllInfo info = null;
	      ArrayList list = new ArrayList();
	      info = new AllInfo();
	      info.setS_user("유저1");
	      list.add(info);
	      info = new AllInfo();
	      info.setS_user("유저2");
	      list.add(info);

		
  ModelAndView mav = new ModelAndView(); 
        Map resultMap = new HashMap();
        resultMap.put("list", list);
        mav.addAllObjects(resultMap);
        mav.setViewName("jsonView");
        return mav;
	}*/
