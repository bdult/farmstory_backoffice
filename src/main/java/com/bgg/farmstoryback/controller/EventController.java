package com.bgg.farmstoryback.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value = "event/eventManage.do")
	public String eventManage(Model model, @RequestParam Map<String,Object> paramMap) {
		
		return "event/eventManage";
	}
	
	@RequestMapping(value = "event/eventInfo.do")
	public String eventInfo(Model model, @RequestParam Map<String,Object> paramMap) {
		
		return "event/eventInfo";
	}
}
