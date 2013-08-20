package com.bgg.farmstoryback.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.CategoryDao;
import com.bgg.farmstoryback.dao.UserDao;
import com.mysql.jdbc.StringUtils;



@Service
public class CategoryService {

	@Autowired
	private CategoryDao cateDao;

	
	/**
	 * 모든 카테고리 리스트(등급 제한 없음)
	 * @return
	 */
	public List<Map> list() {
		return cateDao.list();
	}
	
	/**
	 * 카테고리 생성
	 * <pre>
	 * Param sample
	 * Map<String, String> cateInfo = new HashMap<String, String>();
	 * cateInfo.put("cate_level", "1");
	 * cateInfo.put("cate_nm", "test_modify2");
	 * cateInfo.put("parent_cate_id", "C_954682af87414cca86c18a70754b5b58");
	 * </pre>
	 * @param cateInfo
	 * @return cate_id
	 */
	public String create(Map<String, String> cateInfo) {
		int parentCateId = cateDao.parentCateId(cateInfo);
		if(StringUtils.isEmptyOrWhitespaceOnly(cateInfo.get("parent_cate_nm"))){
			// skip;
		}else{
			cateInfo.put("parent_cate_id", ""+parentCateId);
		}
		cateDao.create(cateInfo);
		return ""+cateInfo.get("CATE_ID");
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
	public void modify(Map cateInfo) {
		int parentCateId = cateDao.parentCateId(cateInfo);
		if(StringUtils.isEmptyOrWhitespaceOnly((String)cateInfo.get("parent_cate_nm"))){
			// skip;
		}else{
			cateInfo.put("parent_cate_id", parentCateId);
		}
		cateDao.modify(cateInfo);
	}

	/**
	 * 카테고리 디테일
	 * Map<String, String> cateInfo = new HashMap<String, String>();
	 * cateInfo.put("cate_id", "C_954682af87414cca86c18a70754b5b58");
	 * @param cateInfo
	 * @return
	 */
	public Map detail(String cateId) {
		return cateDao.detail(cateId);
	}

	/**
	 * 특정 레벨 카테고리 리스트
	 * @param cateLevel
	 * @return
	 */
	public List<Map> listByLevel(int cateLevel) {
		return (List<Map>)cateDao.listByLevel(cateLevel);
	}

	public void delete(String cateId) {
		cateDao.delete(cateId);
	}

	public List<Map> listOfChild(int parentId) {
		return cateDao.listOfChild(parentId);
	}

}
