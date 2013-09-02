package com.bgg.farmstoryback.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.dto.ContentsDTO;
import com.bgg.farmstoryback.service.ContentsService;


@Controller
public class ContentsController {
	
	private Logger logger = LoggerFactory.getLogger(ContentsController.class);
	
	@Autowired
	private ContentsService contentsService;
	
	@RequestMapping(value = "contents/manage.do")
	public ModelAndView manage(Model model, @RequestParam Map<String,Object> parameter) {
		ModelAndView mav = new ModelAndView();
		List<Map> list = contentsService.list();
		mav.addObject("list", list);
		mav.setViewName("contents/manage");
		
		return mav;
	}
	
	@RequestMapping(value = "contents/create.do")
	public ModelAndView create(Model model){
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	@RequestMapping(value = "contents/update.do")
	public ModelAndView create(Model model, String contents_id){
		
		ModelAndView mav = new ModelAndView();	
		mav.addObject("mode", "update");
		ContentsDTO data = contentsService.detail(contents_id);
		mav.addObject("data", data );
		mav.setViewName("contents/create");
		return mav;
	}
	
	@RequestMapping(value = "contents/createdb.do", method = RequestMethod.POST)
	public ModelAndView createdb(ContentsDTO contentsDTO) {

		ModelAndView mav = new ModelAndView();	
		
		System.out.println("mode = " + contentsDTO.getMode());
		
		if(contentsDTO.getMode().equals("insert")) {
			String contents_id = contentsService.create(contentsDTO);
			System.out.println("create contents_id = " + contents_id);
			mav.addObject("rslt_msg", "추가 되었습니다.");			
		}
		
		mav.setViewName("contents/create");
		return mav;
	}
	
	@RequestMapping(value = "contents/delete.do", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		return null;
	}
}
