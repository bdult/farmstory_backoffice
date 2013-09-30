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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.common.FileUtil;
import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.BrandService;
import com.mysql.jdbc.StringUtils;

@Controller
public class BrandController {
	
	private Logger logger = LoggerFactory.getLogger(BrandController.class);
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private PageUtil pageUtil;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "brand/manage.do")
	public String manage(Model model, @RequestParam Map parameter) {

		int pageNum=0;
		if(parameter.get("pageNum") == null){
			pageNum=1;
		}else{
			pageNum = Integer.parseInt((String)parameter.get("pageNum"));
		}
		int totalCount = brandService.totalCount(parameter);
		
		Map pageInfo = pageUtil.pageLink(totalCount, pageNum);
		pageInfo.put("startNo", pageUtil.getStartRowNum(pageNum));
		pageInfo.put("perPage", pageUtil.PER_PAGE);
		pageInfo.put("search", parameter.get("search"));
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("search", parameter.get("search"));
		
		List<Map> brandList = brandService.list(pageInfo);
		
		model.addAttribute("brandList", brandList);
		
		return "brand/manage";
	}
	
	@RequestMapping(value = "brand/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		brandService.create(parameter);
		return "redirect:manage.do?pageNum=1";
	}
	
	@RequestMapping(value = "brand/createView.do")
	public String createView(Model model) {
		return "brand/info";
	}
	
	@RequestMapping(value = "brand/detail.do")
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		Map detailInfo = brandService.detail(parameter);
		model.addAttribute("data", detailInfo);
		model.addAttribute("pageNum", Integer.parseInt((String)parameter.get("pageNum")));
		return "brand/info";
	}
	
	@RequestMapping(value = "brand/modify.do")
	public String modify(Model model, @RequestParam Map<String,Object> parameter) {
		if(parameter.get("brand_id") == null || parameter.get("brand_id").equals("")){
			brandService.create(parameter);
			return "redirect:manage.do";
		}else{
			brandService.modify(parameter);
			return "redirect:detail.do?brand_id="+parameter.get("brand_id");
		}
	}
	
	@RequestMapping(value = "brand/delete.do")
	public String delete(Model model, @RequestParam Map<String,Object> parameter) {
		brandService.delete(parameter);
		return "redirect:manage.do?pageNum=1";
	}
	
	@RequestMapping(value = "brand/create.ajax", method = RequestMethod.POST)
	public @ResponseBody String createAjax(@RequestParam Map<String,Object> parameter) {
		brandService.create(parameter);
		return "{code:ok}";
	}
	
	@RequestMapping(value = "brand/list.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String listAjax(Model model, @RequestParam Map<String,Object> parameter) {
		
		List<Map> brandList = brandService.list(parameter);
		String brandListJson = jsonMaker.generateMapList("data", brandList);
		logger.info("response={}", brandListJson);
		return brandListJson;
	}
	
	@RequestMapping(value = "brand/imgUpload.do")
	public @ResponseBody String imgUpload(Model model,
			@RequestParam("file")MultipartFile file
			) {
		String srcPath = fileUtil.brandThumbnailUpload(file);
		return srcPath;
	}
}
