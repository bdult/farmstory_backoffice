package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.SeriesDao;



@Service
public class SeriesService {
	
	@Autowired
	private SeriesDao seriseDao;
	
	@Autowired
	private ContentsService contentsService;

	/**
	 * 시리즈 전체 조회
	 * @return
	 */
	public List<Map> list() {
		return seriseDao.list();
	}
	
	/**
	 * 브랜드 ID 로 시리즈 조회
	 * @param barndId
	 * @return
	 */
	public List<Map> listByBrandId(String barndId) {
		return seriseDao.listByBrandId(barndId);
	}

	/**
	 * 시리즈 생성
	 * @param parameterMap
	 */
	public void create(Map parameterMap) {
		seriseDao.create(parameterMap);
	}

	public List<Map> listByCateId(String cateId) {
		return seriseDao.listByCateId(cateId);
	}

	public void modify(Map seriseInfo) {
		seriseDao.modify(seriseInfo);
	}

	public Map detail(int seriseIdx) {
		return seriseDao.detail(seriseIdx);
	}

	public void delete(Map seriesInfo) {
		contentsService.deleteBySeriesId(Integer.parseInt((String)seriesInfo.get("series_idx")));
		seriseDao.delete(seriesInfo);
		
	}
	
}
