package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.IdMaker;
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
	

	public List<Map> list() {
		return brandDao.list();
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
	
	/**
	 * 브랜드 정보 변경  
	 * 카테고리 변경시 pre_cate_id 가 있어야된
	 * <pre>
	 * Parameter Ex
	 * cate_id
	 * brand_nm
	 * brand_id
	 * pre_cate_id
	 * </pre>
	 * 
	 * @param parameterMap
	 */
	public void modify(Map parameterMap){
		brandDao.modify(parameterMap);
	}

	public Map detail(String brandId) {
		return brandDao.detail(brandId);
	}

	public void delete(Map brandInfo) {
		brandDao.delete(brandInfo);
	}	
	
}
