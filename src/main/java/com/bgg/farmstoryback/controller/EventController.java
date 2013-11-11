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
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.service.BoardService;

@Controller
public class EventController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private BoardService boardService;

	@Autowired
	private PageUtil pageUtil;
	  
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "event/eventManage.do")
	public String eventManage(Model model, @RequestParam Map<String,Object> paramMap) {

		paramMap.put("board_id", "2");

		Map pageInfo = pageUtil.pageLink(boardService.contentsTotalCount(paramMap), paramMap);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageList", pageInfo.get("pageList"));
		pageInfo.putAll(paramMap);

		model.addAttribute("eventList", boardService.contentsListByBoardId(pageInfo));
		
		return "event/eventManage";
	}
	
	@RequestMapping(value = "event/eventInfo.do")
	public String eventInfo(Model model, @RequestParam Map<String,Object> paramMap) {
		
		logger.info("contents id : " + paramMap.get("board_contents_id"));
		if(paramMap.get("board_contents_id") != null){
			model.addAttribute("contentsList", boardService.contentsDeail(paramMap));	
		}
		
		return "event/eventInfo";
	}
	
	@RequestMapping(value = "event/eventCreateContents.do")
	public String eventCreateContents(Model model, @RequestParam Map<String,Object> paramMap) {

		paramMap.put("board_id", "2");
		boardService.addContents(paramMap);
		
		return "redirect:/event/eventManage.do";
	}
	
	@RequestMapping(value = "event/eventModifyContents.do")
	public String eventModifyContents(Model model, @RequestParam Map<String,Object> paramMap) {

		boardService.modifyContents(paramMap);
		
		return "redirect:/event/eventManage.do";
	}
	
	@RequestMapping(value = "event/eventDeleteContents.do")
	public String eventDeleteContents(Model model, @RequestParam Map<String,Object> paramMap) {

		boardService.deleteContents(paramMap);
		
		return "redirect:/event/eventManage.do";
	}
	
	@RequestMapping(value = "event/thumbnail-upload.do")
	public @ResponseBody String thumbnailUpload(Model model,
			@RequestParam("file")MultipartFile file
			) {
		String srcPath = fileUtil.thumbnailUpload(file);
		return srcPath;
	}
}
