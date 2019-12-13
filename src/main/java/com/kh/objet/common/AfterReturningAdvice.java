package com.kh.objet.common;

import java.util.Date;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository //Dao에 적용함
@Aspect //aop를 의미
public class AfterReturningAdvice {
   // 로그인 메소드에 대한 로그 처리를 목적으로 하는 어드바이스로 만들어 봄
   private static final Logger logger = LoggerFactory.getLogger(AfterReturningAdvice.class);   
   
  /* //포인트컷 설정
   @Pointcut("execution(* com.kh.objet.member.model.dao.MemberDao.loginCheck(..))") //매개변수 다 써도 됨, 메소드 지정
   public void loginPointcut() {}
   
   //타겟 메소드가 실행 후 리턴될 때 작동되는 어드바이스 
   @AfterReturning(pointcut="loginPointcut()", returning="returnObj")
   public void loginLogging(JoinPoint jp, Object returnObj) {
      //비즈니스 메소드가 리턴한 결과 데이터를 다른 용도로 처리할 때 사용할 수 있음
      if(returnObj instanceof Member) {
         Member member = (Member)returnObj;
         logger.info(new Date() + "$" + member.getUserid() + "$님이 접속하셨습니다.");
      }
   }*/
}