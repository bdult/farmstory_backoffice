package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.ContentsDao;
import com.mysql.jdbc.StringUtils;

@Service
public class ContentsService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private ContentsDao conDao;
	
	@Autowired
	private SeriesService seriesService;
	
	/**
	 * 컨텐츠 리스트
	 * @return
	 */
	public List<Map> list() {
		return conDao.list();
	}
	
	/**
	 * 컨텐츠 상세
	 */
	public Map detail(String contents_id) {
		return conDao.detail(contents_id);
	}
	
	/**
	 * 컨텐츠 생성
	 * <pre>
	 * Param sample
	 * Map<String, String> cateInfo = new HashMap<String, String>();
	 * cateInfo.put("cate_level", "1");
	 * cateInfo.put("cate_nm", "test_modify2");
	 * cateInfo.put("parent_cate_id", "C_954682af87414cca86c18a70754b5b58");
	 * </pre>
	 * @param cateInfo
	 * @return contents_id
	 */
	public String create(Map parameter) {
		conDao.create(parameter);
		return null;
	}

	public void modify(Map<String, String> parameter) {
		conDao.modify(parameter);
	}

	public List<Map> seriesList() {
		return seriesService.list();
	}

	public void delete(Map<String, Object> parameter) {
		conDao.delete((String)parameter.get("contents_id"));
	}
}
