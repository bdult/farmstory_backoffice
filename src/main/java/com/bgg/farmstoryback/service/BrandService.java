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
	

	public List<Map> list() {
		return brandDao.list();
	}
	
	public List<Map> listByPageNum(int pageNum) {
		Map pageInfo = new HashMap();
		pageInfo.put("startNo", pageUtil.getStartRowNum(pageNum));
		pageInfo.put("perPage", pageUtil.PER_PAGE);
		return brandDao.listByPageNum(pageInfo);
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

	public Map detail(Map<String,Object> parameter) {
		return brandDao.detail((String)parameter.get("brand_id"));
	}

	public void delete(Map brandInfo) {
		brandDao.delete(brandInfo);
	}

	public List<Map> search(String search) {
		return brandDao.search(search);
	}

	public int totalCount() {
		return brandDao.totalCount();
	}	
	
}
