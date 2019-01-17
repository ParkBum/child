package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import exception.BoardException;
import logic.User;

@Component
@Aspect
public class BoardAspect {
	@Around("execution(* controller.Board*.writeForm(..))")
	public Object BoardwriteCheck(ProceedingJoinPoint joinPoint) throws Throwable { //글쓰기  하려 할 시
		HttpSession session = (HttpSession)joinPoint.getArgs()[0];
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new BoardException("로그인 후 등록 가능합니다.","../user/loginForm.child"); 
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	@Around("execution(* controller.Board*.updateForm(..))")
	public Object BoardupdateCheck(ProceedingJoinPoint joinPoint) throws Throwable { // 수정을 하려 할 시
		HttpSession session = (HttpSession)joinPoint.getArgs()[0];
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new BoardException("로그인 후 수정 가능합니다.","../user/loginForm.child"); 
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	
	@Around("execution(* controller.Board*.info(..))")
	public Object infoCheck(ProceedingJoinPoint joinPoint) throws Throwable { //글쓰기 및 수정을 하려 할 시
		HttpSession session = (HttpSession)joinPoint.getArgs()[0];
		User loginUser = (User) session.getAttribute("loginUser");
		//1. 로그인이 안된 경우
		if(loginUser == null) {
			throw new BoardException("로그인 후 게시물 상세 정보를 확인하실 수 있습니다.","../user/loginForm.child"); 
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}
