package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.ConstantsForDb;
import com.bgg.farmstoryback.common.ConstantsForParam;
import com.bgg.farmstoryback.common.ConstantsForResponse;
import com.bgg.farmstoryback.dao.ContentsDao;
import com.mysql.jdbc.StringUtils;

@Service
public class ContentsService {

	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private ContentsDao conDao;
	
	/**
	 * 컨텐츠 리스트
	 * @return
	 */
	public List<Map> list(Map parameter) {
		return conDao.list(parameter);
	}
	
	@SuppressWarnings("rawtypes")
	public List<Map> listByCategory(String categoryId) {
		return conDao.listByCategory(categoryId);
	}
	
	/**
	 * 
	 * 
	 * @param requestParamMap
	 * @return
	 * contentsInfo = {
	 * 	REG_DT=2013-11-06 15:43:45.0, 
	 * 	CONTENTS_SERIES_NM=Little Baby PictureBook, 
	 * 	BRAND_NM=한국삐아제, 
	 * 	BRAND_ID=138, 
	 * 	PREFIX_URL=http://115.71.237.215/, 
	 * 	SRC_PATH=temp/temp.mp4, 
	 * 	IMG_PATH=temp/temp.gif, 
	 * 	CONTENTS_SERIES_ID=48, 
	 * 	CONTENTS_ID=1339
	 * }
	 * 
	 * detailList = [
	 *  	{
	 *  		LOCATION_CODE=kr, 
	 *  		REG_DT=2013-11-06 15:43:45.0, 
	 *  		CONTENTS_DESC=addContentsDesc01,
	 *  		DISPLAY_YN=N, 
	 *  		DETAIL_IDX=345, 
	 *  		CONTENTS_NM=addContentsName01 
	 *  		contentsCateList=[{CATE_NM=English, REG_DT=2013-11-06 15:43:45.0, CATE_ID=32}, {CATE_NM=Mathmatics, REG_DT=2013-11-06 15:43:45.0, CATE_ID=38}], 
	 * 		}
	 *  ]
	 */
	@SuppressWarnings("unchecked")
	public Map detail(Map requestParamMap) {
		Map detailInfo = new HashMap();
		
		// make contents info
		Map contentsInfo = conDao.contentsInfo(requestParamMap);
		detailInfo.put(ConstantsForResponse.CONTENTS_INFO, contentsInfo);
		
		// make contents detail List
		Map<String, Object> detailMap = conDao.contentsDetailList(requestParamMap);
		for (Entry<String, Object> entry : detailMap.entrySet()) {
			String key = entry.getKey();
			HashMap map = (HashMap)entry.getValue();
			long contentsDetailIdx = (Long)map.get(ConstantsForDb.CONTENTS_IDX);
			map.put(ConstantsForResponse.CONTENTS_CATE_MAP, conDao.contentsCateList(contentsDetailIdx));
        }
		detailInfo.put(ConstantsForResponse.CONTENTS_DETAIL_MAP, detailMap);
		
		return detailInfo;
	}
	
	public String create(Map parameter) {
		conDao.create(parameter);
		return null;
	}
	
	public int totalCount(Map parameter) {
		return conDao.totalCount(parameter);
	}

	public List top(int limitCount) {
		Map parameter  = new HashMap();
		parameter.put(ConstantsForParam.PAGE_START_NO, 1);
		parameter.put(ConstantsForParam.PAGE_PER_PAGE, limitCount);
		return list(parameter);
	}
	
	/**
	 * @param requestParamMap (category_id, contenst_id, ordering_no 필수)
	 */
	public void moddifyOrderingNo(Map requestParamMap) {
		String orderingNo = String.valueOf(requestParamMap.get(ConstantsForParam.ORDERING_NO));
		String contentsId = String.valueOf(requestParamMap.get(ConstantsForParam.CONTENTS_ID));
		String categoryId = String.valueOf(requestParamMap.get(ConstantsForParam.CATEGORY_ID));
		if(StringUtils.isNullOrEmpty(orderingNo) ||
			StringUtils.isNullOrEmpty(contentsId) ||
			StringUtils.isNullOrEmpty(categoryId)){
			// Skip 
		}else{
			conDao.modifyOrderingNo(requestParamMap);
		}
	}

	public void addContents(Map contentsInfo) {
		// insert contents
		conDao.addContentsInfo(contentsInfo);
		
		for(Map contentsDetail : (List<Map>)contentsInfo.get(ConstantsForParam.CONTENTS_DETAIL_LIST)){
			// insert contents detail
			contentsDetail.put(ConstantsForParam.CONTENTS_ID, contentsInfo.get(ConstantsForParam.CONTENTS_ID));
			conDao.addContentsDetailInfo(contentsDetail);
			// insert cate-contents relationship
			for(Map contentsCate : (List<Map>)contentsDetail.get(ConstantsForParam.CATEGORY_LIST)){
				contentsCate.put(ConstantsForParam.CONTENTS_DETAIL_IDX, contentsDetail.get(ConstantsForParam.CONTENTS_DETAIL_IDX));
				conDao.addContentsCate(contentsCate);
			}
		}
		
	}

	public void modifyContents(Map contentsInfo) {
		conDao.modifyContentsInfo(contentsInfo);
		
		for(Map contentsDetail : (List<Map>)contentsInfo.get(ConstantsForParam.CONTENTS_DETAIL_LIST)){
			// update contents detail
			conDao.modifyContentsDetailInfo(contentsDetail);
			// update cate-contents relationship
			// delete > insert
			conDao.deleteContentsCate(contentsDetail);
			for(Map contentsCate : (List<Map>)contentsDetail.get(ConstantsForParam.CATEGORY_LIST)){
				contentsCate.put(ConstantsForParam.CONTENTS_DETAIL_IDX, contentsDetail.get(ConstantsForParam.CONTENTS_DETAIL_IDX));
				conDao.addContentsCate(contentsCate);
			}
		}
		
	}

	public void delete(Map requestParamMap) {
		// 동영상 및 이미지 삭제 정책이 결정되지 않아 DB 만 삭제
		
		// 아래의 delete 순서는 바뀌면 error 가 발생 할 수 있음
		// delete contents category 
		conDao.deleteContentsCateByContentsIs(requestParamMap);
		
		// delete contents detail
		conDao.deleteContentsDetail(requestParamMap);
		
		// delete contents
		conDao.deleteContents(requestParamMap);
		
	}
	
//	public void modify(Map<String, String> parameter) {
//		conDao.modify(parameter);
//	}
//
//	public void delete(Map<String, Object> parameter) {
//		conDao.delete((String)parameter.get("contents_id"));
//	}
//
//	public void addContentsCate(Map parameter) {
//		int checkCount = conDao.checkContentsCate(parameter);
//		if(checkCount == 0){
//			conDao.addContentsCate(parameter);
//		}
//	}
//
//	public List contentsCateList(Map parameter) {
//		return conDao.contentsCateList(parameter);
//	}
//
//	public void deleteContentsCate(Map parameter) {
//		conDao.deleteContentsCate(parameter);
//	}
//
//	public String createTemp() {
//		return conDao.createTemp();
//	}
//
//





}
