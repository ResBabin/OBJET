package com.kh.objet.following.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.following.model.dao.FollowingDao;

@Service("followingService")
public class FollowingServiceImpl implements FollowingService{
	
	@Autowired
	private FollowingDao followingDao;

}
