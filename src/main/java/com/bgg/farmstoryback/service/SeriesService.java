package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.SeriesDao;
import com.mysql.jdbc.StringUtils;

@Service
public class SeriesService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final String SERIES_ID_TAG = "series_id";
	

	@Autowired
	private SeriesDao seriesDao;
	
	public List<Map> list(Map pageInfo) {
		return seriesDao.list(pageInfo);
	}
	
	public Map detail(Map parameter) {
		return seriesDao.detail(""+parameter.get(SERIES_ID_TAG));
	}
	
	public void create(Map parameter) {
		if(hasSeries(parameter)){
			parameter.put(SERIES_ID_TAG, seriesIdByName(parameter));
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
		String seriesId = (String)parameter.get(SERIES_ID_TAG);
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

	public List<Map> listOfTop() {
		return seriesDao.listOfTop();
	}

	public List top5() {
		return seriesDao.top5();
	}

	public int totalCount(Map parameter) {
		return seriesDao.totalCount(parameter);
	}
}
