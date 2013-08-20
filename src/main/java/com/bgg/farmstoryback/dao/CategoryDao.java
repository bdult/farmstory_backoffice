package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.StringUtils;


@Repository
public class CategoryDao extends SqlSessionDaoSupport {


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

	public int parentCateId(Map<String, String> cateInfo) {
		try {
			return (Integer)getSqlSession().selectOne("categoryQuery.parentCateId", cateInfo);
		} catch (Exception e) {
			return 0;
		}
	}



}
