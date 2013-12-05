package com.bgg.farmstoryback.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.common.PostApiUtil;

@Controller
public class PostController {
	
	private Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private PostApiUtil postApiUtil;
	
	@RequestMapping(value = "post/addr.ajax",  produces = "application/xml;charset=UTF-8")
	public @ResponseBody String addr(Model model, @RequestParam Map<String,Object> parameter) {
		
		return postApiUtil.getAddr(parameter);
	}
	
}
