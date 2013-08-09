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
	
	public List<Map> listByCateId(String cateId) {
		return brandDao.listByCateId(cateId);
	}

	/**
	 * 브랜드 생성
	 * @param parameterMap
	 */
	public void create(Map parameterMap) {
		parameterMap.put("brand_id", idMaker.makeId());
		brandDao.create(parameterMap);
		if(parameterMap.get("cate_id") != null){
			brandDao.createCateBrand(parameterMap);
		}
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
		if(parameterMap.get("pre_cate_id") != null){
			brandDao.modifyCateBrand(parameterMap);
		}
	}

	public Map detail(Map brandInfo) {
		Map<String, Object> brandDetail = new HashMap<String, Object>();
		
		Map brand = brandDao.detail(brandInfo);
		brandDetail.put("brand", brand);
		
		if(brand != null){
			List<Map> cateList = cateService.listByBrandId(brandInfo);
			brandDetail.put("brand_cate_list", cateList);
			
		}
		return brandDetail;
	}

	public void delete(Map brandInfo) {
		brandDao.delete(brandInfo);
	}	
	
}
