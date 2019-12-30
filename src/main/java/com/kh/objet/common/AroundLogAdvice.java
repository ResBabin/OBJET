package com.kh.objet.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

@Service // service에 적용하는
@Aspect	// aop를 의미 함
public class AroundLogAdvice {
	
/*	// 포인트컷 선언
	@Pointcut("execution(* com.kh.objet..*Impl.*(..))")
	public void servicePointcut() {}
	
	
	// target object의 메소드가 실행되기 전부터 실행된 후까지의 처리를 하는 Advice
	@Around("servicePointcut()")
	public Object aroundLog(ProceedingJoinPoint pp) throws Throwable {
		//Around는 매개변수와 리턴타입을 가져야 함.
		String methodName = pp.getSignature().getName();
		
		// 메소드가 수행된 시간 등을 체크할 수 있음.
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		Object obj = pp.proceed();	// 타깃 메소드가 구동되는 동안 기다림. 인터럽트 등 발생 시 throws 처리함.
		
		// 타깃 메소드가 리턴될 때 스톱워치 멈추게 함.
		stopWatch.stop();
		
		System.out.println(methodName + "()메소드 수행에 걸린 시간 : " + stopWatch.getTotalTimeMillis() + "(ms)초");	// 보통은 파일에 기록하지만 지금은 syso로!
		
		return obj;
	}*/
}
