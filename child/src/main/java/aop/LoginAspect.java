package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;


@Component
@Aspect
public class LoginAspect {
	@Around("execution(* controller.User*.list(..)) && args(mnum,session,..)")
	public Object userLoginCheck(ProceedingJoinPoint joinPoint,Integer mnum, HttpSession session) throws Throwable {
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용하세요","../user/loginForm.child");
		}
		//2. admin이 아니면서 id와 로그인 정보가 다른 경우
		/*if(!mnum.equals(loginUser.getMnum()) && !loginUser.getEmail().equals("admin@aaa.bbb")) {
			throw new LoginException("본인만 가능합니다","../user/list.child?mnum="+loginUser.getMnum());
		}*/
	    
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around("execution(* controller.User*.update(..)) && args(user, session,..)")
	public Object userUpdateCheck(ProceedingJoinPoint joinPoint,User user,HttpSession session) throws Throwable{
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용하세요","../user/loginForm.child");
		}
		//2. admin이 아니면서 id와 로그인 정보가 다른 경우
		if(user.getMnum()!=loginUser.getMnum() && !loginUser.getEmail().equals("admin@aaa.bbb")) {
			throw new LoginException("본인만 가능합니다","../user/list.child?mnum="+loginUser.getMnum());
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
