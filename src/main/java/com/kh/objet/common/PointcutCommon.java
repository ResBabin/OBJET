package com.kh.objet.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	
	@Pointcut("execution(* com.kh.objet..service.. *Impl.*(..))")	// service패키지 하위에 있는 Impl가 붙은 모든 것
	public void serviceAllPointcut() {}
	
	@Pointcut("execution(* com.kh.objet..service..*Impl.select*(..))")	// select가 붙은 모든 메소드
	public void getPointcut() {}
	
	@Pointcut("execution(* com.kh.objet..service..*Impl.insert*(..))")
	public void setPointcut() {}

	
}
