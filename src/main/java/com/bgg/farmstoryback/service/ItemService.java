package com.bgg.farmstoryback.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.common.IdMaker;
import com.bgg.farmstoryback.dao.ItemDao;
import com.bgg.farmstoryback.dao.UserDao;



@Service
public class ItemService {
	
	private final String parentPath = "/var/lib/tomcat6/webapps/storyfarm/source/";

	@Autowired
	private ItemDao itemDao;
	
	@Autowired
	private IdMaker idMaker;

	public List<Map> list() {
		return itemDao.list();
	}
	
	public List<Map> listByGroupId(String groupId) {
		return itemDao.listByGroupId(groupId);
	}
	
	
	/**
	 * 컨텐츠 생성
	 * paramter key
	 * item_nm
	 * brand_id
	 * @param itemInfo
	 */
	public void createItem(Map<String, Object> itemInfo) {
		
		// item_id make
		itemInfo.put("item_id", idMaker.makeId());
		
		// 원본 파일 경로 생성
		if(itemInfo.get("file") != null){
			itemInfo.put("src_path", makeFilePath((MultipartFile)itemInfo.get("file")));
		}else{
			itemInfo.put("src_path", "/temp/default.flv");
		}
		itemDao.create(itemInfo);
		
	}

	private String makeFilePath(MultipartFile file) {
		try {
			
			//디렉토리 생성 
			File desti = new File(parentPath);

		  //해당 디렉토리의 존재여부를 확인
			if(!desti.exists()){
				desti.mkdirs(); 
			}
			String extenstion = file.getOriginalFilename().substring(file.getOriginalFilename().length()-3);
			String fileName = idMaker.makeId()+"."+extenstion;
			byte fileData[] = file.getBytes();
			FileOutputStream fos = new FileOutputStream(parentPath +fileName);
			fos.write(fileData);
			fos.close();
			return fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void deleteByGroupId(String groupId) {
		itemDao.deleteByGroupId(groupId);
	}

	public Map detail(String itemId) {
		return itemDao.detail(itemId);
	}

	public void delete(String itemId) {
		itemDao.delete(itemId);
	}

	public void modify(Map itemModInfo) {
		// 원본 파일 경로 생성
		if(itemModInfo.get("file") != null){
			itemModInfo.put("src_path", makeFilePath((MultipartFile)itemModInfo.get("file")));
		}else{
			itemModInfo.put("src_path", "/temp/mod.flv");
		}
		itemDao.modify(itemModInfo);
	}



	
}
