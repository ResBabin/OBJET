package com.kh.objet.objet.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.objet.model.dao.ObjetDao;

@Service("objetService")
public class ObjetServiceImpl implements ObjetService{

	@Autowired
	private ObjetDao objetDao;
}
