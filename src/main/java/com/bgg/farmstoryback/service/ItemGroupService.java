package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.ItemGroupDao;



@Service
public class ItemGroupService {
	
	@Autowired
	private ItemGroupDao groupDao;
	
	@Autowired
	private ContentsService contentsService;

	/**
	 * 시리즈 전체 조회
	 * @return
	 */
	public List<Map> list() {
		return groupDao.list();
	}
	
	/**
	 * 브랜드 ID 로 시리즈 조회
	 * @param barndId
	 * @return
	 */
	public List<Map> listByBrandId(String barndId) {
		return groupDao.listByBrandId(barndId);
	}

	/**
	 * 시리즈 생성
	 * @param parameterMap
	 */
	public void create(Map parameterMap) {
		groupDao.create(parameterMap);
	}

	public void modify(Map seriseInfo) {
		groupDao.modify(seriseInfo);
	}

	public Map detail(String groupId) {
		return groupDao.detail(groupId);
	}

	public void delete(String groupId) {
		contentsService.deleteByGroupId(groupId);
		groupDao.delete(groupId);
		
	}
	
}
