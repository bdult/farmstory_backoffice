package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.IdMaker;
import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.dao.BrandDao;



@Service
public class BrandService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BrandDao brandDao;
	
	@Autowired
	private IdMaker idMaker;
	
	@Autowired
	private CategoryService cateService;
	
	@Autowired
	private PageUtil pageUtil;
	

	public List<Map> list(Map parameter) {
		return brandDao.list(parameter);
	}
	
	/**
	 * @param brandInfo
	 * @return brand_Id
	 */
	public String create(Map brandInfo) {
		// 중복 체크 로직 필요 할 듯
		brandDao.create(brandInfo);
		return ""+brandInfo.get("brand_id");
	}
	
	public void modify(Map parameterMap){
		brandDao.modify(parameterMap);
	}

	public Map detail(Map parameter) {
		return brandDao.detail(parameter);
	}

	public void delete(Map brandInfo) {
		brandDao.delete(brandInfo);
	}

	public int totalCount(Map parameter) {
		return brandDao.totalCount(parameter);
	}

	public List<Map> listAll() {
		return brandDao.listAll();
	}

	public List<Map> top(int limitCount) {
		return brandDao.top(limitCount);
	}	
	
}
