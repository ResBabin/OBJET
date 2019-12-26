package com.kh.objet.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

// 어드바이스 클래스가 되려면, Aspect(aop의미)어노테이션 붙여줌
@Service	// 서비스 클래스에 적용하는(Dao면 Repository붙여줌)
@Aspect		// AOP다!
public class BeforeAdvice {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	/*// 1. pointcut 설정
	@Pointcut("execution(* com.kh.objet..*(..))")	
	public void allPointcut() {}	
	
	
	//2. 작동시점과 적용할 포인트컷 지정함 : 실행 시점과 실행시킬 내용에 대한 코드 작성 설정함.
	@Before("allPointcut()")			// 위에 설정한 allPointcut의 execution안에 있는 모든것들이 실행되기 직전에 !
	public void beforLog(JoinPoint jp) {	
		String methodName = jp.getSignature().getName();	
		Object[] args = jp.getArgs();	
		
		logger.info("[메소드 실행 전 확인 ] : " + methodName + "() 메소드 매개변수 갯수 : " + args.length);
		
		// 추출된 매개변수 정보 확인
		for(int i = 0; i < args.length; i++) {
			if(args[i] != null)
			logger.info(i + "번째 매개변수 정보 : " + args[i].toString());
		}
		
		
	}*/
}
