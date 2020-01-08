package com.kh.objet.quit.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.quit.model.dao.QuitDao;
import com.kh.objet.quit.model.vo.Quit;

@Service("quitService")
public class QuitServiceImpl implements QuitService{

	@Autowired
	private QuitDao quitDao;

	// 탈퇴회원 테이블에서 30일 경과한 회원 가져오기
	public List<String> selectQuitList() {
		return quitDao.selectQuitList();
	}
	// quit테이블에서 삭제
	public int dropQuitUser(String userid) {
		return quitDao.dropQuitUser(userid);
	}
	
}
