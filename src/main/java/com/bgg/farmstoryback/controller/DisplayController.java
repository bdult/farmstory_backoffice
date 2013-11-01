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
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.common.FileUtil;


@Controller
public class DisplayController {
	
	private Logger logger = LoggerFactory.getLogger(DisplayController.class);
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "display/mainImgUpdate.do")
	public @ResponseBody String mainImgUpdate(Model model,
			@RequestParam("file")MultipartFile file
			) {
//		String srcPath = fileUtil.thumbnailUpload(file);
		String srcPath = ""; //대표이미지 
		return srcPath;
	}
	
	@RequestMapping(value = "display/main/manage.do")
	public String manage(Model model, @RequestParam Map<String,Object> parameter) {
		return "display/main";
	}
	
	@RequestMapping(value = "display/main/create.do")
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		return "display/create";
	}
	
	@RequestMapping(value = "display/contents/manage.do")
	public String contents(Model model, @RequestParam Map<String,Object> parameter) {
		return "display/contents";
	}
	
	@RequestMapping(value = "display/popup/manage.do")
	public String popup(Model model, @RequestParam Map<String,Object> parameter) {
		return "display/popup";
	}
	
	
}
