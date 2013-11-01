package com.bgg.farmstoryback.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository
public class ContentsDao extends SqlSessionDaoSupport {

	
	/** 컨텐츠 목록 조회
	 * @param parameter
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> list(Map parameter) {
		return (List<Map>)getSqlSession().selectList("contentsQuery.list", parameter);
	}

	/** 컨텐츠 추가
	 * @param parameter
	 */
	@SuppressWarnings("rawtypes")
	public void create(Map parameter) {
		getSqlSession().insert("contentsQuery.create", parameter);
		
	}
	
	/** 컨텐츠 상세 조회
	 * @param contents_id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public Map detail(String contents_id) {
		return (Map)getSqlSession().selectOne("contentsQuery.detail", contents_id);
	}
	
	/** 컨텐츠 삭제
	 * @param contents_id
	 */
	public void delete(String contents_id) {
		getSqlSession().delete("contentsQuery.deleteContentsCate", contents_id);
		getSqlSession().delete("contentsQuery.delete", contents_id);
	}
	
	/** 컨텐츠 수정
	 * @param itemModInfo
	 */
	@SuppressWarnings("rawtypes")
	public void modify(Map itemModInfo) {
		getSqlSession().update("contentsQuery.modify", itemModInfo);
		
	}
	/** 컨텐츠 총 카운트
	 * @param parameter
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public int totalCount(Map parameter) {
		return (Integer)getSqlSession().selectOne("contentsQuery.totalCount", parameter);
	}

	/** 최신 등록한 컨텐츠 5개 조회(dashboard 용)
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List top(int limitCount) {
		return getSqlSession().selectList("contentsQuery.top", limitCount);
	}

	/** 컨텐츠 카테고리 추가
	 * @param parameter
	 */
	public void addContentsCate(Map<String, Object> parameter) {
		getSqlSession().insert("contentsQuery.addContentsCate", parameter);
	}

	/** 컨텐츠 카테고리 존재 여부 카운트
	 * @param parameter
	 * @return
	 */
	public int checkContentsCate(Map<String, Object> parameter) {
		return (Integer)getSqlSession().selectOne("contentsQuery.checkContentsCate", parameter);
	}

	/** 컨텐츠 카테고리 목록 조회
	 * @param parameter
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List contentsCateList(Map parameter) {
		return getSqlSession().selectList("contentsQuery.contentsCateList", parameter);
	}

	/** 컨텐츠 카테고리 삭제
	 * @param parameter
	 */
	public void deleteContentsCate(Map parameter) {
		getSqlSession().delete("contentsQuery.deleteContentsCate", parameter);
	}

	/**
	 * 임시 컨텐츠 생성
	 * @return
	 */
	public String createTemp() {
		Map<String, Integer> tempMap = new HashMap<String, Integer>();
		tempMap.put("contents_id", 0);
		getSqlSession().insert("contentsQuery.createTemp", tempMap);
		return ""+tempMap.get("contents_id");
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> listByCategory(String categoryId) {
		return (List<Map>)getSqlSession().selectList("contentsQuery.listByCategory", categoryId);
	}

}
