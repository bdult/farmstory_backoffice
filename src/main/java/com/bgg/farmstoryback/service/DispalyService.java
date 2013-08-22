package com.bgg.farmstoryback.service;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class DispalyService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

//		@Autowired
//		private DisplayDao displayDao;
//
//		public String create(Map displayInfo) {
//			// 중복 체크
//			
//			String displayId = displayDao.displayIdByName((String)displayInfo.get("display_nm"));
//			if(displayId ==null){
//				displayDao.create(displayInfo);
//				return ""+displayInfo.get("display_id");
//			}else{
//				return displayId;
//			}
//		}
//
//		public Map detail(String displayId) {
//			return displayDao.detail(displayId);
//		}
//
//		public List<Map> list() {
//			return displayDao.list();
//		}
//
//		public void delete(String displayId) {
//			displayDao.deleteInDisplayItem(displayId);
//			displayDao.delete(displayId);
//		}
//
//		public void modify(Map displayInfo) {
//			displayDao.modify(displayInfo);
//		}
//
//		public void createObjectDisplay(Map groupDisplayInfo) {
//			displayDao.createObjectDisplay(groupDisplayInfo);
//		}
//
//		public Map detailObjectDisplay(Map groupDisplayInfo) {
//			return displayDao.detailObjectDisplay(groupDisplayInfo);
//		}
//
//		public List<Map> listDisplayItemGroupByDisplayId(String displayId) {
//			return displayDao.listDisplayItemGroup(displayId);
//		}
//		
//		// event list
//		
//		// List by Age
		
}
