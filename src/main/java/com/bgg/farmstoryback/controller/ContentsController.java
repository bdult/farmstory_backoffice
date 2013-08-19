package com.bgg.farmstoryback.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.servlet.ModelAndView;

import com.bgg.farmstoryback.service.BrandService;
import com.bgg.farmstoryback.service.CategoryService;

@Controller
public class ContentsController {
	
	private Logger logger = LoggerFactory.getLogger(ContentsController.class);
	
	@RequestMapping(value = "contents/manage.do", method = RequestMethod.POST)
	public String manage(Model model, @RequestParam Map<String,Object> parameter) {
		return "contents/manage";
	}
	
}
