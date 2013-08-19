package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.DisplayDao;
import com.bgg.farmstoryback.dao.ViewDao;

@Service
public class DispalyService {

		@Autowired
		private DisplayDao displayDao;

		public String create(Map displayInfo) {
			// 중복 체크
			
			String displayId = displayDao.displayIdByName((String)displayInfo.get("display_nm"));
			if(displayId ==null){
				displayDao.create(displayInfo);
				return ""+displayInfo.get("display_id");
			}else{
				return displayId;
			}
		}

		public Map detail(String displayId) {
			return displayDao.detail(displayId);
		}

		public List<Map> list() {
			return displayDao.list();
		}

		public void delete(String displayId) {
			displayDao.deleteInDisplayItem(displayId);
			displayDao.delete(displayId);
		}

		public void modify(Map displayInfo) {
			displayDao.modify(displayInfo);
		}

		public void createObjectDisplay(Map groupDisplayInfo) {
			displayDao.createObjectDisplay(groupDisplayInfo);
		}

		public Map detailObjectDisplay(Map groupDisplayInfo) {
			return displayDao.detailObjectDisplay(groupDisplayInfo);
		}

		public List<Map> listDisplayItemGroupByDisplayId(String displayId) {
			return displayDao.listDisplayItemGroup(displayId);
		}
		
		// event list
		
		// List by Age
		
}
