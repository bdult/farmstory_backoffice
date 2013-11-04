package com.bgg.farmstoryback.controller;

import java.util.List;
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

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;
import com.bgg.farmstoryback.common.FileUtil;
import com.bgg.farmstoryback.service.CategoryService;
import com.bgg.farmstoryback.service.DisplayService;


@Controller
public class DisplayController {
	
	private Logger logger = LoggerFactory.getLogger(DisplayController.class);
	
	@Autowired
	private FileUtil fileUtil;
	
	@Autowired
	private DisplayService displayService;
	
	@Autowired
	private CategoryService categoryService;
	
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
		
		Map map = displayService.listInfo();
		model.addAttribute(ConstantsForResponse.TOP_DISPLAY, map.get(ConstantsForResponse.TOP_DISPLAY));
		model.addAttribute(ConstantsForResponse.BANNER_DISPLAY, map.get(ConstantsForResponse.BANNER_DISPLAY));
		
		return "display/main";
	}
	
	@RequestMapping(value = "display/main/create.do")
	public String mainCreate(Model model, @RequestParam Map<String,Object> parameter) {
		return "display/mainCreate";
	}
	
	@RequestMapping(value = "display/main/update.do")
	public String mainUpdate(Model model, @RequestParam Map<String,Object> parameter) {
		model.addAttribute("displayInfo", displayService.detail(parameter));
		return "display/mainUpdate";
	}
	
	@RequestMapping(value = "display/main/bannerCreate.do")
	public String bannerCreate(Model model, @RequestParam Map<String,Object> parameter) {
		return "display/bannerCreate";
	}
	
	@RequestMapping(value = "display/main/bannerUpdate.do")
	public String bannerUpdate(Model model, @RequestParam Map<String,Object> parameter) {
		
		model.addAttribute("displayInfo", displayService.detail(parameter));
		return "display/bannerUpdate";
	}
	
	@RequestMapping(value = "display/contents/manage.do")
	public String contents(Model model, @RequestParam Map<String,Object> parameter) {
		
		model.addAttribute("parameter", parameter);
		
		List<Map> categoryList = categoryService.list();
		model.addAttribute("categories", categoryList);

		Object obj = parameter.get(ConstantsForParam.CATEGORY_ID);
		
		if(obj == null){
			if(categoryList.size() > 0){
				Map cate = categoryList.get(0);
				parameter.put(ConstantsForParam.CATEGORY_ID, String.valueOf(cate.get(ConstantsForDb.CATEGORY_ID)));
			}
		}
		
		model.addAttribute("contents", displayService.contentsList(parameter));
		return "display/contents";
	}
	
	@RequestMapping(value = "display/popup/manage.do")
	public String popup(Model model, @RequestParam Map<String,Object> parameter) {
		
		model.addAttribute("popupList", displayService.popupList());
		return "display/popup";
	}
	
	@RequestMapping(value = "display/popup/create.do")
	public String popupCreate(Model model, @RequestParam Map<String,Object> parameter) {
		return "display/popupCreate";
	}
	
	@RequestMapping(value = "display/popup/update.do")
	public String popupUpdate(Model model, @RequestParam Map<String,Object> parameter) {
		model.addAttribute("obj", displayService.popupDetail(parameter));
		return "display/popupUpdate";
	}
	
	
}
