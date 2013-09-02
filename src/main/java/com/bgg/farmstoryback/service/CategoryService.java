package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.CategoryDao;
import com.mysql.jdbc.StringUtils;



@Service
public class CategoryService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private CategoryDao cateDao;

	
	/**
	 * 모든 카테고리 리스트(등급 제한 없음)
	 * @return
	 */
	public List<Map> list() {
		return cateDao.listByLevel(1);
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
		if(StringUtils.isNullOrEmpty(cateInfo.get("parent_cate_nm"))){
			cateInfo.put("parent_cate_id", "0");
			cateInfo.put("cate_level", "1");
		}else{
			cateInfo.put("cate_level", cateDao.cateLevelByParentCateId(cateInfo));
		}
		cateInfo.put("ordering_no", cateDao.lastOrderingNo(cateInfo));
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
		// 정렬 순서 변경
		int originOrderingNo  = Integer.parseInt((String)cateInfo.get("origin-category-ordering-no"));
		int convertOrderingNo = Integer.parseInt((String)cateInfo.get("category-ordering-no"));
		
		if(originOrderingNo != convertOrderingNo){
			List<Map> anotherCateList = cateDao.listOfChild(Integer.parseInt((String)cateInfo.get("parent_cate_id")));
			for(Map anotherCate : anotherCateList){
				int anthoderOrderingNo = (Integer)anotherCate.get("ORDERING_NO");
				if(anthoderOrderingNo >= convertOrderingNo && anthoderOrderingNo < originOrderingNo){
					anotherCate.put("ordering_no", anthoderOrderingNo+1);
					cateDao.orderingModify(anotherCate);
				}
			}
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

	public List<Map> parentCateList(Map<String, String> categoryInfo) {
		return cateDao.parentCateList(categoryInfo);
	}

}
