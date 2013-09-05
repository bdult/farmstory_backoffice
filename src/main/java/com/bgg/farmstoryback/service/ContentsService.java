package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.dao.ContentsDao;
import com.mysql.jdbc.StringUtils;

@Service
public class ContentsService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	private ContentsDao conDao;
	
	@Autowired
	private PageUtil pageUtil;
	
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
	
	public String create(Map parameter) {
		conDao.create(parameter);
		return null;
	}

	public void modify(Map<String, String> parameter) {
		conDao.modify(parameter);
	}

	public void delete(Map<String, Object> parameter) {
		conDao.delete((String)parameter.get("contents_id"));
	}

	public List<Map> searchByName(String search) {
		return conDao.searchByName(search);
	}

	public List<Map> listByPageNum(int pageNum) {
		Map pageInfo = new HashMap();
		pageInfo.put("startNo", pageUtil.getStartRowNum(pageNum));
		pageInfo.put("perPage", pageUtil.PER_PAGE);
		return conDao.listByPageNum(pageInfo);
	}

	public int totalCount() {
		return conDao.totalCount();
	}

	public List top5() {
		return conDao.top5();
	}
}
