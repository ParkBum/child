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
public class BoardAspect {
	@Around("execution(* controller.Board*.list(..)) && args(session,..)")
	public Object listCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable{
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용하세요","../user/loginForm.child");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around("execution(* controller.Board*.review(..)) && args(session,..)")
	public Object boardwriteCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용하세요","../user/loginForm.child");
		}
	    
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around("execution(* controller.Board*.info(..)) && args(session,..)")
	public Object boardInfoCheck(ProceedingJoinPoint joinPoint,HttpSession session) throws Throwable{
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용하세요","../user/loginForm.child");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around("execution(* controller.Board*.updateForm(..)) && args(session,..)")
	public Object boardupdateCheck(ProceedingJoinPoint joinPoint, HttpSession session) throws Throwable {
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new LoginException("로그인 후 이용하세요","../user/loginForm.child");
		}
	    
		Object ret = joinPoint.proceed();
		return ret;
	}
}
