package com.kh.objet;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.objet.objet.model.service.ObjetServiceImpl;
import com.kh.objet.objet.model.vo.Artist;
import com.kh.objet.objet.model.vo.Objet;
import com.kh.objet.paging.model.vo.Paging;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private ObjetServiceImpl objetService;
	
	public HomeController() {}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("main.do")
	public ModelAndView main(ModelAndView mv) {
		ArrayList<Artist> searchMainList = objetService.selectArtistAllList();
		Collections.shuffle(searchMainList);
		ArrayList<Objet> objetList = objetService.selectAllObjetAllList();
		ArrayList<Objet> objetAllList = objetService.selectObjetAllList();
		ArrayList<Artist> objetMainList = objetService.selectObjetMainList();
		Collections.shuffle(objetMainList);
		if(searchMainList != null && objetList != null && objetAllList != null && objetMainList != null) {
			mv.addObject("searchMainList", searchMainList);
			mv.addObject("objetList", objetList);
			mv.addObject("objetAllList", objetAllList);
			mv.addObject("objetMainList", objetMainList);
			mv.setViewName("main");
		}else {
			mv.addObject("searchMainList", searchMainList);
			mv.addObject("objetList", objetList);
			mv.addObject("objetAllList", objetAllList);
			mv.addObject("objetMainList", objetMainList);
			mv.setViewName("common/error");
		}
		return mv;
	}
	
	// 수정용 주석
}
