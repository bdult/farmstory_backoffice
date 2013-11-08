package com.bgg.farmstoryback.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;
import com.bgg.farmstoryback.common.FileUtil;
import com.bgg.farmstoryback.common.JsonResponseMaker;
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.BrandService;
import com.bgg.farmstoryback.service.CategoryService;
import com.bgg.farmstoryback.service.CodeService;
import com.bgg.farmstoryback.service.ContentsService;


@Controller
public class ContentsController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private ContentsService contentsService;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private JsonResponseMaker jsonMaker;
	
	@Autowired
	private PageUtil pageUtil;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "contents/manage.do")
	public String manage(Model model,  @RequestParam Map reqParamMap) {
		
		model.addAttribute("categoryList", cateService.list());
		model.addAttribute("brandList", brandService.listAll());
		
		Map pageInfo = pageUtil.pageLink(contentsService.totalCount(reqParamMap), reqParamMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		model.addAttribute("list", contentsService.list(pageInfo));
		return "contents/manage";
	}
	
	
	@RequestMapping(value = "contents/detail.do")
	public String detail(Model model, @RequestParam Map reqParamMap) {
		Map contentMap =  contentsService.detail(reqParamMap);
		
		//출판사
		model.addAttribute("brandList", brandService.listAll());

		//카테고리 변경 시 필요한 카테고리 리스트
		model.addAttribute("categoryList", cateService.listByLevel(1));
		
		//국가 목록
		model.addAttribute("locationList", codeService.locationCodeList());
		
		model.addAttribute("contentInfo", contentMap.get(ConstantsForResponse.CONTENTS_INFO));
		model.addAttribute("detailMap", contentMap.get(ConstantsForResponse.CONTENTS_DETAIL_MAP));
		return "contents/info";
	}
	
	@RequestMapping(value = "contents/createView.do", method = RequestMethod.GET)
	public String createView(Model model) {
		
		//출판사
		model.addAttribute("brandList", brandService.listAll());

		//카테고리 변경 시 필요한 카테고리 리스트
		model.addAttribute("categoryList", cateService.listByLevel(1));
		
		//국가 목록
		model.addAttribute("locationList", codeService.locationCodeList());
		
		return "contents/createView";
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "contents/create.do", method = RequestMethod.POST)
	public String create(Model model, @RequestParam MultiValueMap reqParamMap) {
		
		Map dbMap = new HashMap();
		List<Map> detailList = new ArrayList<Map>();
		String seriesId = reqParamMap.getFirst(ConstantsForParam.SERIES_ID).toString();
		String moviePath = reqParamMap.getFirst(ConstantsForParam.MOVIE_PATH).toString();
		String imgPath = reqParamMap.getFirst(ConstantsForParam.IMG_PATH).toString();
		dbMap.put(ConstantsForParam.SERIES_ID, seriesId);
		dbMap.put(ConstantsForParam.MOVIE_PATH, moviePath);
		dbMap.put(ConstantsForParam.IMG_PATH, imgPath);
		
		List<String> locationList = (List<String>)reqParamMap.get(ConstantsForParam.LOCATION);
		for(String code : locationList){
			int suffix = Integer.valueOf(code.substring(code.length() - 1));
			int index = suffix - 1;
			
			String contentName = ((List)reqParamMap.get(ConstantsForParam.CONTENTS_NAME)).get(index).toString();
			String contentDesc = ((List)reqParamMap.get(ConstantsForParam.CONTENTS_DESC)).get(index).toString();
			String displayYN = reqParamMap.getFirst(ConstantsForParam.DISPLAY_YN + suffix).toString();
			String locationCode = code;
			List<String> categoryList = (List)reqParamMap.get(ConstantsForParam.CATEGORY_ID + suffix);
			
			List<Map> mapList = new ArrayList<Map>();
			for(String cateId : categoryList) {
				Map tmpMap = new HashMap();
				tmpMap.put(ConstantsForParam.CATEGORY_ID, cateId);
				mapList.add(tmpMap);
			}
			
			Map map = new HashMap();
			map.put(ConstantsForParam.CONTENTS_NAME, contentName);
			map.put(ConstantsForParam.CONTENTS_DESC, contentDesc);
			map.put(ConstantsForParam.DISPLAY_YN, displayYN);
			map.put(ConstantsForParam.SERIES_ID, seriesId);
			map.put(ConstantsForParam.LOCATION_CODE, locationCode);
			map.put(ConstantsForParam.CATEGORY_LIST, mapList);
			
			detailList.add(map);
			
		}
		
		dbMap.put(ConstantsForParam.CONTENTS_DETAIL_LIST, detailList); 
		
		contentsService.addContents(dbMap);
		
		return "redirect:manage.do";
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value = "contents/modify.do")
	public String modify(Model model, @RequestParam MultiValueMap reqParamMap) {
		
		Map dbMap = new HashMap();
		List<Map> detailList = new ArrayList<Map>();
		String contentsId = reqParamMap.getFirst(ConstantsForParam.CONTENTS_ID).toString();
		String seriesId = reqParamMap.getFirst(ConstantsForParam.SERIES_ID).toString();
		String moviePath = reqParamMap.getFirst(ConstantsForParam.MOVIE_PATH).toString();
		String imgPath = reqParamMap.getFirst(ConstantsForParam.IMG_PATH).toString();
		dbMap.put(ConstantsForParam.CONTENTS_ID, contentsId);
		dbMap.put(ConstantsForParam.SERIES_ID, seriesId);
		dbMap.put(ConstantsForParam.MOVIE_PATH, moviePath);
		dbMap.put(ConstantsForParam.IMG_PATH, imgPath);
		
		List<String> locationList = (List<String>)reqParamMap.get(ConstantsForParam.LOCATION);
		for(String code : locationList){
			int suffix = Integer.valueOf(code.substring(code.length() - 1));
			int index = suffix - 1;
			
			String contentName = ((List)reqParamMap.get(ConstantsForParam.CONTENTS_NAME)).get(index).toString();
			String contentDesc = ((List)reqParamMap.get(ConstantsForParam.CONTENTS_DESC)).get(index).toString();
			String displayYN = reqParamMap.getFirst(ConstantsForParam.DISPLAY_YN + suffix).toString();
			String locationCode = code;
			String detailIdx = reqParamMap.getFirst(ConstantsForParam.CONTENTS_DETAIL_IDX + suffix).toString();
			List<String> categoryList = (List)reqParamMap.get(ConstantsForParam.CATEGORY_ID + suffix);
			
			List<Map> mapList = new ArrayList<Map>();
			for(String cateId : categoryList) {
				Map tmpMap = new HashMap();
				tmpMap.put(ConstantsForParam.CATEGORY_ID, cateId);
				mapList.add(tmpMap);
			}
			
			Map map = new HashMap();
			map.put(ConstantsForParam.CONTENTS_NAME, contentName);
			map.put(ConstantsForParam.CONTENTS_DESC, contentDesc);
			map.put(ConstantsForParam.DISPLAY_YN, displayYN);
			map.put(ConstantsForParam.SERIES_ID, seriesId);
			map.put(ConstantsForParam.LOCATION_CODE, locationCode);
			map.put(ConstantsForParam.CATEGORY_LIST, mapList);
			map.put(ConstantsForParam.CONTENTS_DETAIL_IDX, detailIdx);
			
			detailList.add(map);
			
		}
		
		dbMap.put(ConstantsForParam.CONTENTS_DETAIL_LIST, detailList); 
		
		contentsService.modifyContents(dbMap);
		
		return "redirect:manage.do";
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
//	
//	@RequestMapping(value = "contents/addContentsCate.ajax", produces = "application/json;charset=UTF-8")
//	public @ResponseBody String addContentsCate(Model model,
//			@RequestParam Map parameter
//			) {
//		logger.info("{}", parameter);
//		contentsService.addContentsCate(parameter);
//		return jsonMaker.generateOk();
//	}
//	
//	@RequestMapping(value = "contents/contentsCate.ajax", produces = "application/json;charset=UTF-8")
//	public @ResponseBody String contentsCate(Model model,
//			@RequestParam Map parameter) {
//		return jsonMaker.generateMapList("data", contentsService.contentsCateList(parameter));
//	}
//	
//	@RequestMapping(value = "contents/deleteContentsCate.ajax", produces = "application/json;charset=UTF-8")
//	public @ResponseBody String deleteContentsCate(Model model,
//			@RequestParam Map parameter) {
//		contentsService.deleteContentsCate(parameter);
//		return jsonMaker.generateOk();
//	}
//	
//	
//	@RequestMapping(value = "contents/delete.do")
//	public String delete(Model model, @RequestParam Map<String,Object> parameter){
//		contentsService.delete(parameter);
//		return "redirect:manage.do?pageNum=1";
//	}
}
