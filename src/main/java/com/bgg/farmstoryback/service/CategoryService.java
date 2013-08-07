package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.CategoryDao;
import com.bgg.farmstoryback.dao.UserDao;
import com.bgg.farmstoryback.dto.UserDto;



@Service
public class CategoryService {

	@Autowired
	private CategoryDao cateDao;

	
	/**
	 * 모든 카테고리 리스트(등급 제한 없음)
	 * @return
	 */
	public List<Map<String, Object>> list() {
		return cateDao.listAll();
	}
	
	/**
	 * 카테고리 생성
	 * <pre>
	 * Param sample
	 * Map<String, String> cateInfo = new HashMap<String, String>();
	 * cateInfo.put("cate_id", "C_954682af87414cca86c18a70754b5b58");
	 * cateInfo.put("cate_level", "1");
	 * cateInfo.put("cate_nm", "test_modify2");
	 * cateInfo.put("parent_cate_id", "C_954682af87414cca86c18a70754b5b58");
	 * </pre>
	 * @param cateInfo
	 */
	public void create(Map<String, String> cateInfo) {
		cateDao.create(cateInfo);
	}

	/**
	 * 특정 레벨 카테고리 리스트
	 * @param level
	 * @return
	 */
	public List<Map<String, Object>> listByLevel(int level) {
		return cateDao.listByLevel(level);
	}

	/**
	 * 카테고리 수정
	 * <pre>
	 * Param sample
	 * Map<String, String> cateInfo = new HashMap<String, String>();
	 * cateInfo.put("cate_id", "C_954682af87414cca86c18a70754b5b58");
	 * cateInfo.put("cate_level", "1");
	 * cateInfo.put("cate_nm", "test_modify2");
	 * cateInfo.put("parent_cate_id", "C_954682af87414cca86c18a70754b5b58");
	 * </pre>
	 * @param cateInfo
	 */
	public void modify(Map<String, String> cateInfo) {
		cateDao.modify(cateInfo);
	}

	/**
	 * 카테고리 디테일
	 * Map<String, String> cateInfo = new HashMap<String, String>();
	 * cateInfo.put("cate_id", "C_954682af87414cca86c18a70754b5b58");
	 * @param cateInfo
	 * @return
	 */
	public Map<String, Object> detail(Map<String, String> cateInfo) {
		return cateDao.detail(cateInfo);
	}
	
}
