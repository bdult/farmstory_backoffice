package com.bgg.farmstoryback.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.dao.ContentsDao;
import com.mysql.jdbc.StringUtils;

@Service
public class ContentsService {
	
	private final String parentPath = "/var/lib/tomcat6/webapps/storyfarm/source/";

	@Autowired
	private ContentsDao conDao;
	
	/**
	 * 컨텐츠 리스트
	 * @return
	 */
	public List<Map> list(Map parameter) {
		return conDao.list(parameter);
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

	public void modify(Map<String, String> parameter) {
		conDao.modify(parameter);
	}

	public void delete(Map<String, Object> parameter) {
		conDao.delete((String)parameter.get("contents_id"));
	}

	public int totalCount(Map parameter) {
		return conDao.totalCount(parameter);
	}

	public List top(int limitCount) {
		return conDao.top(limitCount);
	}


	public void addContentsCate(Map parameter) {
		int checkCount = conDao.checkContentsCate(parameter);
		if(checkCount == 0){
			conDao.addContentsCate(parameter);
		}
	}

	public List contentsCateList(Map parameter) {
		return conDao.contentsCateList(parameter);
	}

	public void deleteContentsCate(Map parameter) {
		conDao.deleteContentsCate(parameter);
	}

	public String createTemp() {
		return conDao.createTemp();
	}


	@SuppressWarnings("rawtypes")
	public List<Map> listByCategory(String categoryId) {
		if(StringUtils.isNullOrEmpty(categoryId)){
			return null;
		}else{
			return conDao.listByCategory(categoryId);
		}
	}

}
