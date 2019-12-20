package com.kh.objet.likeobjet.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.likeobjet.model.dao.LikeObjetDao;

@Service("likeObjetService")
public class LikeObjetServiceImpl implements LikeObjetService{

	@Autowired
	private LikeObjetDao likeObjetDao;
}
