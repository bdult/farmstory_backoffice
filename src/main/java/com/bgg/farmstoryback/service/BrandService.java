package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.IdMaker;
import com.bgg.farmstoryback.dao.BrandDao;



@Service
public class BrandService {
	
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
	 * 브랜드 생성
	 * @param parameterMap
	 */
	public void create(Map parameterMap) {
		// 중복 체크 로직 필요 할 듯
		
		brandDao.create(parameterMap);
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

	public Map detail(Map brandInfo) {
		
		return brandDao.detail(brandInfo);
	}

	public void delete(Map brandInfo) {
		brandDao.delete(brandInfo);
	}	
	
}
