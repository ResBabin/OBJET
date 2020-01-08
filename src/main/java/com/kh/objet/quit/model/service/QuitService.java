package com.kh.objet.quit.model.service;

import java.util.List;

import com.kh.objet.quit.model.vo.Quit;

public interface QuitService {
	
	List<String> selectQuitList();
	int dropQuitUser(String userid);

}
