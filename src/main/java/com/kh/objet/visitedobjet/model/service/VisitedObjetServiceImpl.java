package com.kh.objet.visitedobjet.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.objet.visitedobjet.model.dao.VisitedObjetDao;

@Service("visitedObjetService")
public class VisitedObjetServiceImpl {

	@Autowired
	private VisitedObjetDao visitedObjetDao;
}
