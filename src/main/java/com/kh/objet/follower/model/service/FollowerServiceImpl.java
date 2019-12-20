package com.kh.objet.follower.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.follower.model.dao.FollowerDao;

@Service("followerService")
public class FollowerServiceImpl implements FollowerService {
	
	@Autowired
	private FollowerDao followerDao;

}
