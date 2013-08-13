package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;


@Repository
public class CategoryDao extends SqlSessionDaoSupport {


	/**
	 * 카테고리 전체 리스트
	 * @return
	 */
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("categoryQuery.listAll");
	}
	
	/**
	 * 카테고리 생성
	 * @param cateInfo
	 */
	public void create(Map<String, String> cateInfo) {
		getSqlSession().insert("categoryQuery.create", cateInfo);
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
	 * 카테고리 수정
	 * @param cateInfo
	 */
	public void modify(Map<String, String> cateInfo) {
		getSqlSession().update("categoryQuery.modyfy", cateInfo);
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
		getSqlSession().delete("categoryQuery.delete", cateId);
	}

}
