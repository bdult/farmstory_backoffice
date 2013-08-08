package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bgg.farmstoryback.dto.UserDto;


@Repository
public class CategoryDao extends SqlSessionDaoSupport {


	/**
	 * 카테고리 전체 리스트
	 * @return
	 */
	public List<Map<String, Object>> listAll() {
		return (List<Map<String, Object>>)getSqlSession().selectList("cateQuery.listAll");
	}
	
	/**
	 * 카테고리 생성
	 * @param cateInfo
	 */
	public void create(Map<String, String> cateInfo) {
		getSqlSession().insert("cateQuery.create", cateInfo);
	}

	/**
	 * 특정 레벨 카테고리 리스트
	 * @param level
	 * @return
	 */
	public List<Map<String, Object>> listByLevel(int level) {
		return (List<Map<String, Object>>)getSqlSession().selectList("cateQuery.listByLevel", level);
	}

	/**
	 * 카테고리 수정
	 * @param cateInfo
	 */
	public void modify(Map<String, String> cateInfo) {
		getSqlSession().update("cateQuery.modyfy", cateInfo);
	}

	/**
	 * 카테고리 상세
	 * @param cateInfo
	 * @return
	 */
	public Map<String, Object> detail(Map<String, String> cateInfo) {
		return (Map<String, Object>)getSqlSession().selectOne("cateQuery.detail", cateInfo);
	}
}
