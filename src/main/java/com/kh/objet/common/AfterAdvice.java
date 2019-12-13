package com.kh.objet.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service	
@Aspect	//AOP의미 어노테이션
public class AfterAdvice {
	
	@Pointcut("execution(* com.kh.objet..*Impl.*(..))")	
	public void implPointcut() {}
	
	
	@After("implPointcut()")	
	public void finallyLog() {
		// 예외 발생 상관 없이 무조건 실행되는 어드바이스임.(finally와 동일)
		System.out.println("[메소드 실행 후 작동 ] : 서비스 로직 수행이 종료된 후 무조건 작동 됨.");
	}
}
