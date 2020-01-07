package com.kh.objet.quit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.objet.quit.model.service.QuitServiceImpl;
import com.kh.objet.quit.model.vo.Quit;
import com.kh.objet.users.model.service.UsersServiceImpl;


@Controller
public class QuitController {
	private static final Logger logger = LoggerFactory.getLogger(QuitController.class);
	
	@Autowired
	private QuitServiceImpl quitService;
	
	@Autowired
	private UsersServiceImpl usersService;

	
	public QuitController() {}
	
	
	
	// 탈퇴회원 30일경과 후 완전 삭제
		@RequestMapping(value="delQuitUsers.do", method=RequestMethod.POST)
		public void delQuitUsers() {
			// 탈퇴회원 테이블에서 30일 경과한 회원 가져오기
			List<String> quitUseridList = quitService.selectQuitList();
			
			if(quitUseridList != null) {
				for(String userid : quitUseridList) {
					// quit테이블에서 삭제
					quitService.dropQuitUser(userid);
					// users테이블에서 삭제
					usersService.dropQuitUser(userid);
				}
			}
		}
		
}
