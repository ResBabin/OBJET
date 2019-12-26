package com.kh.objet.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class BeforeAdviceOutOfPointcut {
	// 따로 작성해 놓은 포인트컷 사용하기 위한 어드바이스임.
	
	/*@Before("PointcutCommon.serviceAllPointcut()")
	public void beforeConsole(JoinPoint jp) {
		// 모든 Service 구현 클래스의 모든 메소드 구동 직전에 실행되는 어드바이스임.
		
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
																				// args 길이가 0보다 크면 args[0]번을, 아니면 0을 출력시켜라
		System.out.println("[사전처리] " + methodName + "() 메소드 첫번째 인달인자 정보 : " + ((args.length > 0)? args[0].toString() : 0));
	}
	
	
	
	@Before("PointcutCommon.getPointcut()")
	public void beforeSelectConsole(JoinPoint jp) {
		// 모든 Service 구현 클래스의 모든 메소드 구동 직전에 실행되는 어드바이스임.
		
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
																				// args 길이가 0보다 크면 args[0]번을, 아니면 0을 출력시켜라
		System.out.println("[사전처리] " + methodName + "() 메소드 첫번째 인달인자 정보 : " + ((args.length > 0)? args[0].toString() : 0));
	}
	
	
	@Before("PointcutCommon.setPointcut()")
	public void beforeInsertConsole(JoinPoint jp) {
		// 모든 Service 구현 클래스의 모든 메소드 구동 직전에 실행되는 어드바이스임.
		
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
																				// args 길이가 0보다 크면 args[0]번을, 아니면 0을 출력시켜라
		System.out.println("[사전처리] " + methodName + "() 메소드 첫번째 인달인자 정보 : " + ((args.length > 0)? args[0].toString() : 0));
	}
	*/

}
