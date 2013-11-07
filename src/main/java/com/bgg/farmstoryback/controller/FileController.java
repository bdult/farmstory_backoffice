package com.bgg.farmstoryback.controller;

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
public class FileController {
	
	private Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "file/imageUpload.do")
	public @ResponseBody String movieUpload(Model model, @RequestParam("file") MultipartFile file) {
		
		String srcPath = fileUtil.displayImageUpload(file);
		logger.debug("srcPath {}" + srcPath);
		
		return srcPath;
	}

}
