package com.bgg.farmstoryback.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.dao.ContentsDao;
import com.mysql.jdbc.StringUtils;

@Service
public class ContentsService {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private ContentsDao conDao;
	
	/**
	 * 컨텐츠 리스트
	 * @return
	 */
	public List<Map> list(Map parameter) {
		return conDao.list(parameter);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> listByCategory(String categoryId) {
		if(StringUtils.isNullOrEmpty(categoryId)){
			return null;
		}else{
			return conDao.listByCategory(categoryId);
		}
	}
	
	/**
	 * 컨텐츠 상세
	 */
	public Map detail(String contents_id) {
		return conDao.detail(contents_id);
	}
	
	public String create(Map parameter) {
		conDao.create(parameter);
		return null;
	}
	
	


	public int totalCount(Map parameter) {
		return conDao.totalCount(parameter);
	}

	public List top(int limitCount) {
		return conDao.top(limitCount);
	}
	
	/**
	 * @param requestParamMap (category_id, contenst_id, ordering_no 필수)
	 */
	public void moddifyOrderingNo(Map requestParamMap) {
		String orderingNo = String.valueOf(requestParamMap.get(ConstantsForParam.ORDERING_NO));
		String contentsId = String.valueOf(requestParamMap.get(ConstantsForParam.CONTENTS_ID));
		String categoryId = String.valueOf(requestParamMap.get(ConstantsForParam.CATEGORY_ID));
		logger.info("{}", orderingNo);
		logger.info("{}", contentsId);
		logger.info("{}", categoryId);
		if(StringUtils.isNullOrEmpty(orderingNo) ||
			StringUtils.isNullOrEmpty(contentsId) ||
			StringUtils.isNullOrEmpty(categoryId)){
			// Skip 
		}else{
			conDao.modifyOrderingNo(requestParamMap);
		}
	}
	
//	public void modify(Map<String, String> parameter) {
//		conDao.modify(parameter);
//	}
//
//	public void delete(Map<String, Object> parameter) {
//		conDao.delete((String)parameter.get("contents_id"));
//	}
//
//	public void addContentsCate(Map parameter) {
//		int checkCount = conDao.checkContentsCate(parameter);
//		if(checkCount == 0){
//			conDao.addContentsCate(parameter);
//		}
//	}
//
//	public List contentsCateList(Map parameter) {
//		return conDao.contentsCateList(parameter);
//	}
//
//	public void deleteContentsCate(Map parameter) {
//		conDao.deleteContentsCate(parameter);
//	}
//
//	public String createTemp() {
//		return conDao.createTemp();
//	}
//
//





}
