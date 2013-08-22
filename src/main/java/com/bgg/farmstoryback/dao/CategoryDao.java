package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;


@Repository
public class CategoryDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 카테고리 전체 리스트
	 * @return
	 */
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("categoryQuery.listAll");
	}
	
	public List<Map> listOfChild(int parentId) {
		return (List<Map>)getSqlSession().selectList("categoryQuery.listOfChild", parentId);
	}
	

	/**
	 * 특정 레벨 카테고리 리스트
	 * @param level
	 * @return
	 */
	public List<Map> listByLevel(int cateLevel) {
		return (List<Map>)getSqlSession().selectList("categoryQuery.listByLevel", cateLevel);
	}
	
	/**
	 * 카테고리 생성
	 * @param cateInfo
	 */
	public void create(Map<String, String> cateInfo) {
		getSqlSession().insert("categoryQuery.create", cateInfo);
	}


	/**
	 * 카테고리 수정
	 * @param cateInfo
	 */
	public void modify(Map cateInfo) {
		getSqlSession().update("categoryQuery.modify", cateInfo);
	}

	/**
	 * 카테고리 상세
	 * @param cateInfo
	 * @return
	 */
	public Map detail(String cateId) {
		return (Map)getSqlSession().selectOne("categoryQuery.detail", cateId);
	}

	public String cateId(Map<String, String> cateInfo) {
		return (String)getSqlSession().selectOne("categoryQuery.cateId", cateInfo);
	}

	public void delete(String cateId) {
		getSqlSession().delete("categoryQuery.deleteCateItemRelation", cateId);
		
		// 하위 카테고리 삭제
		getSqlSession().delete("categoryQuery.deleteChildCate", cateId);
		
		// 카테고리 삭제
		getSqlSession().delete("categoryQuery.delete", cateId);
	}

	public void orderingModify(Map anotherCate) {
		getSqlSession().update("categoryQuery.orderingModify", anotherCate);
		
	}

	public List<Map> parentCateList(Map<String, String> categoryInfo) {
		return getSqlSession().selectList("categoryQuery.parentCateList", categoryInfo);
	}

	public String lastOrderingNo(Map<String, String> cateInfo) {
		return (String)getSqlSession().selectOne("categoryQuery.lastOrderingNo", cateInfo);
	}
	public String cateLevelByParentCateId(Map<String, String> cateInfo) {
		return (String)getSqlSession().selectOne("categoryQuery.cateLevelByParentCateId", cateInfo);
	}



}
