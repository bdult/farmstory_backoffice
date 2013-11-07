package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.dao.SeriesDao;
import com.mysql.jdbc.StringUtils;

@Service
public class SeriesService {
	
	@Autowired
	private SeriesDao seriesDao;
	
	public List top(int limitCount) {
		Map pageInfo = new HashMap();
		pageInfo.put(ConstantsForParam.PAGE_START_NO, 1);
		pageInfo.put(ConstantsForParam.PAGE_PER_PAGE, limitCount);
		return seriesDao.list(pageInfo);
	}
	
	public List<Map> list(Map pageInfo) {
		return seriesDao.list(pageInfo);
	}

	
	
	
	public Map detail(Map parameter) {
		return seriesDao.detail(""+parameter.get(ConstantsForParam.SERIES_ID));
	}
	
	public void create(Map parameter) {
		if(hasSeries(parameter)){
			parameter.put(ConstantsForParam.SERIES_ID, seriesIdByName(parameter));
			seriesDao.modify(parameter);
		}else{
			seriesDao.create(parameter);
		}
	}

	public int seriesIdByName(Map parameter) {
		return seriesDao.searchIdByName(parameter);
	}

	public boolean hasSeries(Map parameter) {
		int count = seriesDao.hasCount(parameter);
		if(count > 0){
			return true;
		}else{
			return false;
		}
	}

	public void modify(Map parameter) {
		if(hasSeriesId(parameter)){
			seriesDao.modify(parameter);
		}else{
			seriesDao.create(parameter);
		}
	}

	private boolean hasSeriesId(Map parameter) {
		String seriesId = (String)parameter.get(ConstantsForParam.SERIES_ID);
		if(seriesId == null || seriesId.equals("")){
			return false;
		}
		if(Integer.parseInt(seriesId) > 0){
			return true;
		}
		return false;
	}

	public void delete(Map<String, Object> parameter) {
		seriesDao.delete(parameter);
	}

	public List<Map> searchByName(String searchName) {
		return seriesDao.searchByName(searchName);
	}

	public int totalCount(Map parameter) {
		return seriesDao.totalCount(parameter);
	}

	
}
