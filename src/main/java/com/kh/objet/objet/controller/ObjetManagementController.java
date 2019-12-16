package com.kh.objet.objet.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.objet.model.service.ObjetManagementService;
import com.kh.objet.objet.model.vo.Objet;


@Controller
public class ObjetManagementController {
	private static final Logger logger = LoggerFactory.getLogger(ObjetManagementController.class);
	
	@Autowired
	private ObjetManagementService objetmService;
	
	public ObjetManagementController() {}
	
	@RequestMapping("objetm.do")
	public ModelAndView allObjetList(ModelAndView mv) {
		ArrayList<Objet> objetmlist = (ArrayList<Objet>) objetmService.selectAllObet();
		if (objetmlist != null) {
			mv.addObject("objetmlist", objetmlist);
			mv.setViewName("admin/objetManagement");
		} else {
			mv.addObject("message", "전시 목록 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	@RequestMapping("objetmd.do")
	public ModelAndView objetMDetail (ModelAndView mv, @RequestParam("objetno") int objetno) {
		Objet objet = objetmService.selectObjetOne(objetno);
		if (objet != null) {
			mv.addObject("objet", objet);
			mv.setViewName("admin/objetManageDetail");
		} else {
			mv.addObject("message", "전시 상세 조회 실패");
			mv.setViewName("common/error");
		}
		return mv;
	}
	

}
