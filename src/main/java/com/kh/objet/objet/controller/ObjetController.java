package com.kh.objet.objet.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.objet.objet.model.service.ObjetServiceImpl;

@Controller
public class ObjetController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetController.class);

	@Autowired
	private ObjetServiceImpl objetService;
	
	public ObjetController() {}
	
	//검색페이지 이동
	@RequestMapping("searchResult.do")
	public String moveSearchPage() {
		return "objet/searchList";
	}

	//전시 메인페이지 이동
	@RequestMapping("objetMain.do")
	public String moveObjetPage() {
		return "objet/objetMain";
	}

	@RequestMapping("objetTest.do")
	public String moveTestPage() {
		return "objet/NewFile";
	}











}
