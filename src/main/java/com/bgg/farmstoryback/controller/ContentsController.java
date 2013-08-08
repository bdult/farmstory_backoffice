package com.bgg.farmstoryback.controller;

import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.service.BrandService;
import com.bgg.farmstoryback.service.ContentsService;
import com.bgg.farmstoryback.service.SeriseService;
import com.bgg.farmstoryback.service.UserService;

@Controller
public class ContentsController {
	
	private Logger logger = LoggerFactory.getLogger(ContentsController.class);
	
	@Autowired
	private ContentsService contsService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private SeriseService seriseService;
	
	@RequestMapping(value = "contents/list.do", method = RequestMethod.GET)
	public String list(Model model) {
		
		return "pure-view/login";
	}
	
	@RequestMapping(value = "contents/createItem.do", method = RequestMethod.POST)
	public String createItem(Model model,
			@RequestParam("item_file")MultipartFile file,
			@RequestParam("item_nm")String item_nm,
			@RequestParam("item_desc")String item_desc,
			@RequestParam("brand_nm")String brand_nm
			) {
		Map<String, Object> contentsInfo = new HashMap<String, Object>();
		contentsInfo.put("file",file );
		contentsInfo.put("item_nm",item_nm );
		contentsInfo.put("item_desc",item_desc );
		contentsInfo.put("brand_nm",brand_nm );
		
		contsService.createItem(contentsInfo);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping(value = "contents/createSerise.do", method = RequestMethod.POST)
	public String createSerise(Model model, HttpServletRequest request) {
		
		seriseService.create(request.getParameterMap());
		
		return null;
	}
	
	@RequestMapping(value = "contents/createBrand.do", method = RequestMethod.POST)
	public String createBrand(Model model, HttpServletRequest request) {
		
		brandService.create(request.getParameterMap());
		
		return null;
	}
	
	// AJAX
	@RequestMapping(value = "contents/brandList.ajax")
	public String brandListAjax(Model model, String cateId) {
		
		List<Map> contentsList  = brandService.listByCateId(cateId);
		
		return null;
	}
	
	// AJAX
	@RequestMapping(value = "contents/seriseList.ajax")
	public String seriseListAjax(Model model, String brandId) {
		
		List<Map> contentsList  = seriseService.listByBrandId(brandId);
		
		return null;
	}
	
	// AJAX
	@RequestMapping(value = "contents/itemList.ajax")
	public String itemListAjax(Model model, String seriseId) {
		
		List<Map> contentsList  = contsService.listBySeriseId(seriseId);
		
		return null;
	}
	

	
	
}
