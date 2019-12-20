package com.kh.objet.feed.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.feed.model.dao.FeedDao;

@Service("feedService")
public class FeedServiceImpl implements FeedService{
	
	@Autowired
	private FeedDao feedDao;

}
