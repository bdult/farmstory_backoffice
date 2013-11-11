package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bgg.farmstoryback.common.ConstantsForDb;

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
//	@SuppressWarnings("rawtypes")
//	public List<Map> detail(Map requestParamMap) {
//		return (List<Map>)getSqlSession().selectList("contentsQuery.detail", requestParamMap);
//	}
	
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

	public void modifyOrderingNo(Map requestParamMap) {
		getSqlSession().update("contentsQuery.modifyOrderingNo", requestParamMap);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> listByCategory(Map requestParamMap) {
		return (List<Map>)getSqlSession().selectList("contentsQuery.listByCategory", requestParamMap);
	}

	public void addContentsInfo(Map contentsInfo) {
		getSqlSession().insert("contentsQuery.addContentsInfo", contentsInfo);
	}

	public void addContentsDetailInfo(Map contentsDetail) {
		getSqlSession().insert("contentsQuery.addContentsDetailInfo", contentsDetail);
	}

	public void addContentsCate(Map contentsCate) {
		getSqlSession().insert("contentsQuery.addContentsCate", contentsCate);
	}

	public void modifyContentsInfo(Map contentsInfo) {
		getSqlSession().update("contentsQuery.modifyContentsInfo", contentsInfo);
	}

	public void modifyContentsDetailInfo(Map contentsDetail) {
		getSqlSession().update("contentsQuery.modifyContentsDetailInfo", contentsDetail);
	}

	public void deleteContentsCate(Map contentsCate) {
		getSqlSession().delete("contentsQuery.deleteContentsCate", contentsCate);
	}

	public void deleteContentsCateByContentsIs(Map requestParamMap) {
		getSqlSession().delete("contentsQuery.deleteContentsCateByContentsIs", requestParamMap);
	}

	public void deleteContentsDetail(Map requestParamMap) {
		getSqlSession().delete("contentsQuery.deleteContentsDetail", requestParamMap);
	}

	public void deleteContents(Map requestParamMap) {
		getSqlSession().delete("contentsQuery.deleteContents", requestParamMap);
	}

	public Map contentsInfo(Map requestParamMap) {
		return (Map)getSqlSession().selectOne("contentsQuery.contentsInfo", requestParamMap);
	}

	public Map<String, Object> contentsDetailList(Map requestParamMap) {
		return getSqlSession().selectMap("contentsQuery.contentsDetailList", requestParamMap, ConstantsForDb.LOCATION_CODE);
	}

	public Map<String, Object> contentsCateList(long contentsDetail) {
		return getSqlSession().selectMap("contentsQuery.contentsCateList", contentsDetail, ConstantsForDb.CATEGORY_NM);
	}

	public List<Map> latestData() {
		return getSqlSession().selectList("contentsQuery.latestData");
	}


//	/** 컨텐츠 카테고리 추가
//	 * @param parameter
//	 */
//	public void addContentsCate(Map<String, Object> parameter) {
//		getSqlSession().insert("contentsQuery.addContentsCate", parameter);
//	}
//
//	/** 컨텐츠 카테고리 존재 여부 카운트
//	 * @param parameter
//	 * @return
//	 */
//	public int checkContentsCate(Map<String, Object> parameter) {
//		return (Integer)getSqlSession().selectOne("contentsQuery.checkContentsCate", parameter);
//	}
//
//	/** 컨텐츠 카테고리 목록 조회
//	 * @param parameter
//	 * @return
//	 */
//	@SuppressWarnings("rawtypes")
//	public List contentsCateList(Map parameter) {
//		return getSqlSession().selectList("contentsQuery.contentsCateList", parameter);
//	}
//
//	/** 컨텐츠 카테고리 삭제
//	 * @param parameter
//	 */
//	public void deleteContentsCate(Map parameter) {
//		getSqlSession().delete("contentsQuery.deleteContentsCate", parameter);
//	}
//
//	/**
//	 * 임시 컨텐츠 생성
//	 * @return
//	 */
//	public String createTemp() {
//		Map<String, Integer> tempMap = new HashMap<String, Integer>();
//		tempMap.put("contents_id", 0);
//		getSqlSession().insert("contentsQuery.createTemp", tempMap);
//		return ""+tempMap.get("contents_id");
//	}
//


	

}
