package com.kh.objet.faq.controller;


import org.slf4j.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);
	
	public FaqController() {};
	
	//csmain으로 이동
	@RequestMapping("Movecs.do")
	public String MovecsPage() {
		return "cs/csmain";
	}

}
