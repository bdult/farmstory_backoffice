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

import com.bgg.farmstoryback.common.FileUtil;
import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.CategoryService;
import com.bgg.farmstoryback.service.ContentsService;
import com.mysql.jdbc.StringUtils;


@Controller
public class ContentsController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ContentsService contentsService;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private PageUtil pageUtil;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "contents/manage.do")
	public String manage(Model model,  @RequestParam Map parameter) {
		
		Map pageInfo = pageUtil.pageLink(contentsService.totalCount(parameter), parameter);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("list", contentsService.list(pageInfo));
		return "contents/manage";
	}
	
	
	@RequestMapping(value = "contents/detail.do")
	public String detail(Model model, @RequestParam Map parameter) {
		Map contentsDetail =  contentsService.detail((String)parameter.get("contents_id"));
		model.addAttribute("cateList", cateService.listByLevel(1));
		model.addAttribute("contentsCateList", contentsService.contentsCateList(parameter));
		model.addAttribute("data", contentsDetail);
		model.addAttribute("pageNum", Integer.parseInt((String)parameter.get("pageNum")));
		return "contents/info";
	}
	
	@RequestMapping(value = "contents/modify.do")
	public String modify(Model model, @RequestParam Map<String,String> parameter) {
		if(parameter.get("contents_id") == null || parameter.get("contents_id").equals("")){
			contentsService.create(parameter);
			return "redirect:manage.do";
		}else{
			contentsService.modify(parameter);
			return "redirect:detail.do?contents_id="+parameter.get("contents_id");
		}
	}
	
	@RequestMapping(value = "contents/createView.do", method = RequestMethod.GET)
	public String createView(Model model) {
		return "contents/info";
	}
	
	@RequestMapping(value = "contents/create.do", method = RequestMethod.POST)
	public String createdb(Model model, @RequestParam Map<String,String> parameter) {
		logger.info("parameter={}", parameter);
		contentsService.create(parameter);
		return "redirect:manage.do?pageNum=1";
	}
	
	@RequestMapping(value = "contents/movie-upload.do")
	public @ResponseBody String movieUpload(Model model,
			@RequestParam("file")MultipartFile file
			) {
		
		String srcPath = fileUtil.movieUpload(file);
		return srcPath;
	}
	@RequestMapping(value = "contents/thumbnail-upload.do")
	public @ResponseBody String thumbnailUpload(Model model,
			@RequestParam("file")MultipartFile file
			) {
		String srcPath = fileUtil.thumbnailUpload(file);
		return srcPath;
	}
	
	@RequestMapping(value = "contents/addContentsCate.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody String addContentsCate(Model model,
			@RequestParam Map parameter
			) {
		logger.info("{}", parameter);
		contentsService.addContentsCate(parameter);
		return jsonMaker.generateOk();
	}
	
	@RequestMapping(value = "contents/contentsCate.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody String contentsCate(Model model,
			@RequestParam Map parameter) {
		return jsonMaker.generateMapList("data", contentsService.contentsCateList(parameter));
	}
	
	@RequestMapping(value = "contents/deleteContentsCate.ajax", produces = "application/json;charset=UTF-8")
	public @ResponseBody String deleteContentsCate(Model model,
			@RequestParam Map parameter) {
		contentsService.deleteContentsCate(parameter);
		return jsonMaker.generateOk();
	}
	
	
	@RequestMapping(value = "contents/delete.do")
	public String delete(Model model, @RequestParam Map<String,Object> parameter){
		contentsService.delete(parameter);
		return "redirect:manage.do?pageNum=1";
	}
}
