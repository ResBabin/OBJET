package com.kh.objet.gbreply.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.gbreply.model.dao.GbReplyDao;

@Service("gbReplyService")
public class GbReplyServiceImpl implements GbReplyService{
	
	@Autowired
	private GbReplyDao gbReplyDao;
}
