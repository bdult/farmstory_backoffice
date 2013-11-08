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
import com.bgg.farmstoryback.service.SeriesService;

@Controller
public class SeriesController {
	
	private Logger logger = LoggerFactory.getLogger(SeriesController.class);
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private SeriesService seriesService;
	
	@Autowired
	private PageUtil pageUtil;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "series/manage.do")
	public String manage(Model model, @RequestParam Map parameter) {
		
		Map pageInfo = pageUtil.pageLink(seriesService.totalCount(parameter), parameter);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("seriesList", seriesService.list(pageInfo));
		
		return "series/manage";
	}
	
	@RequestMapping(value = "series/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam Map<String,Object> parameter) {
		seriesService.create(parameter);
		return "redirect:manage.do";
	}
	
	@RequestMapping(value = "series/createView.do")
	public String create(Model model) {
		return "series/info";
	}
	
	@RequestMapping(value = "series/modify.do", method = RequestMethod.POST)
	public String modify(Model model, @RequestParam Map<String,Object> parameter) {
		seriesService.modify(parameter);
		return "redirect:manage.do";
	}
	
	@RequestMapping(value = "series/detail.do")
	public String detail(Model model, @RequestParam Map<String,Object> parameter) {
		Map detailInfo = seriesService.detail(parameter);
		model.addAttribute("data", detailInfo);
		model.addAttribute("pageNum", Integer.parseInt((String)parameter.get("pageNum")));
		return "series/info";
	}
	
	@RequestMapping(value = "series/delete.do")
	public String delete(Model model, @RequestParam Map<String,Object> parameter) {
		seriesService.delete(parameter);
		return "redirect:manage.do";
	}
	
	@RequestMapping(value = "series/create.ajax", method = RequestMethod.POST)
	public @ResponseBody String createAjax(@RequestParam Map<String, Object> parameter) {
		seriesService.create(parameter);
		return "{code:ok}";
	}
	
	
	@RequestMapping(value = "series/search.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String listAjax(Model model, String series_nm) {
		List<Map> seriesList = null;
		seriesList = seriesService.searchByName(series_nm);
		String seriesListJson = jsonMaker.generateSeriesListForTree(seriesList);
		logger.info(seriesListJson);
		return seriesListJson;
	}
	
	@RequestMapping(value = "series/thumbnail-upload.do")
	public @ResponseBody String thumbnailUpload(Model model,
			@RequestParam("file")MultipartFile file
			) {
		String srcPath = fileUtil.thumbnailUpload(file);
		return srcPath;
	}
	
	@RequestMapping(value = "series/parentSeriesList.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String parentSeriesListAjax(Model model, String search_name) {
		List<Map> seriesList = seriesService.searchByName(search_name);
		String seriesListJson = jsonMaker.generateMapList("data", seriesList);
		return seriesListJson;
	}
	
	@RequestMapping(value = "series/list.ajax",  produces = "application/json;charset=UTF-8")
	public @ResponseBody String list(Model model, @RequestParam Map<String, Object> requestParamMap) {
		List<Map> seriesList = seriesService.list(requestParamMap);
		String seriesListJson = jsonMaker.generateMapList("data", seriesList);
		return seriesListJson;
	}
}
