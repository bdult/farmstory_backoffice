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
	private ItemService itemService;

	/**
	 * Item Group 전체 조회
	 * @return
	 */
	public List<Map> list() {
		return groupDao.list();
	}
	
	/**
	 * BRAND_ID 로 Item Group 조회
	 * @param barndId
	 * @return
	 */
	public List<Map> listByBrandId(String barndId) {
		return groupDao.listByBrandId(barndId);
	}

	/**
	 * Group 생성
	 * @param itemGroupInfo
	 */
	public String create(Map itemGroupInfo) {
		groupDao.create(itemGroupInfo);
		return ""+itemGroupInfo.get("item_group_id");
	}

	/**
	 * Group 수정
	 * @param seriseInfo
	 */
	public void modify(Map seriseInfo) {
		groupDao.modify(seriseInfo);
	}

	/**
	 * Group 상세
	 * @param groupId
	 * @return
	 */
	public Map detail(String groupId) {
		return groupDao.detail(groupId);
	}

	/**
	 * Group 삭제
	 * @param groupId
	 */
	public void delete(String groupId) {
		itemService.deleteByGroupId(groupId);
		groupDao.delete(groupId);
		
	}
	
}
