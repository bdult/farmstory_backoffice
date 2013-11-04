package com.bgg.farmstoryback.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;
import com.bgg.farmstoryback.dao.DisplayDao;

@Service
public class DisplayService {
	
	@Autowired
	private DisplayDao displayDao;
	
	@Autowired
	private ContentsService contentsService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * @return 상단 비주얼 리스트, 배너 리스트
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map listInfo() {
		Map displayInfo = new HashMap();
		List<Map> topDisplay = displayDao.topDisplaylist();
		List<Map> bannerDisplay = displayDao.bannerDisplaylist();
		displayInfo.put(ConstantsForResponse.TOP_DISPLAY, topDisplay);
		displayInfo.put(ConstantsForResponse.BANNER_DISPLAY, bannerDisplay);
		return displayInfo;
	}

	/**
	 * @param requestParamMap (display_id 필수)
	 * @return 상세정보
	 */
	@SuppressWarnings("rawtypes")
	public Map detail(Map requestParamMap) {
		return displayDao.detail(requestParamMap);
	}

	/**
	 * @param requestParamMap (category_id 필수)
	 * @return 컨텐츠 리스트
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> contentsList(Map requestParamMap) {
		String categoryId = (String)requestParamMap.get(ConstantsForParam.CATEGORY_ID);
		List<Map> contentsList = contentsService.listByCategory(categoryId); 
		return contentsList;
	}

	public List<Map> popupList() {
		return displayDao.popupList();
	}

	public Map popupDetail(Map requestParamMap) {
		return displayDao.popupDetail(requestParamMap);
	}

	/**
	 * 
	 * @param requestParamMap (category_id, contenst_id, ordering_no 필수)
	 */
	public void modifyOrderingNo(Map requestParamMap) {
		contentsService.moddifyOrderingNo(requestParamMap);
	}
	

//		@Autowired
//		private DisplayDao displayDao;
//
//		public String create(Map displayInfo) {
//			// 중복 체크
//			
//			String displayId = displayDao.displayIdByName((String)displayInfo.get("display_nm"));
//			if(displayId ==null){
//				displayDao.create(displayInfo);
//				return ""+displayInfo.get("display_id");
//			}else{
//				return displayId;
//			}
//		}
//
//		public Map detail(String displayId) {
//			return displayDao.detail(displayId);
//		}
//
//		public List<Map> list() {
//			return displayDao.list();
//		}
//
//		public void delete(String displayId) {
//			displayDao.deleteInDisplayItem(displayId);
//			displayDao.delete(displayId);
//		}
//
//		public void modify(Map displayInfo) {
//			displayDao.modify(displayInfo);
//		}
//
//		public void createObjectDisplay(Map groupDisplayInfo) {
//			displayDao.createObjectDisplay(groupDisplayInfo);
//		}
//
//		public Map detailObjectDisplay(Map groupDisplayInfo) {
//			return displayDao.detailObjectDisplay(groupDisplayInfo);
//		}
//
//		public List<Map> listDisplayItemGroupByDisplayId(String displayId) {
//			return displayDao.listDisplayItemGroup(displayId);
//		}
//		
//		// event list
//		
//		// List by Age
		
}
