package com.kh.objet.quit.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.objet.quit.model.vo.Quit;

@Repository("quitDao")
public class QuitDao {

	@Autowired
	private SqlSessionTemplate mybatisSession;
	
	public QuitDao() {}

	public List<String> selectQuitList() {
		return mybatisSession.selectList("userMapper.selectQuitList");
	}

	public int dropQuitUser(String userid) {
		return mybatisSession.delete("userMapper.dropQuitUser", userid);
	}
	
}
