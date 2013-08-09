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
import com.bgg.farmstoryback.dao.ContentsDao;
import com.bgg.farmstoryback.dao.UserDao;



@Service
public class ContentsService {
	
	private final String parentPath = "/var/lib/tomcat6/webapps/storyfarm/source/";

	@Autowired
	private ContentsDao contsDao;
	
	@Autowired
	private IdMaker idMaker;

	public List<Map> list() {
		return contsDao.list();
	}
	
	public List<Map> listBySeriseId(String seriseId) {
		return contsDao.listBySeriseId(seriseId);
	}

	
	/**
	 * 컨텐츠 생성
	 * @param itemInfo
	 */
	public void createItem(Map<String, Object> itemInfo) {
		
		// item_id make
		itemInfo.put("item_id", idMaker.makeId());
		
		// 원본 파일 경로 생성
		itemInfo.put("src_path", makeFilePath((MultipartFile)itemInfo.get("file")));
		contsDao.create(itemInfo);
		
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

	public void deleteBySeriesId(int series_idx) {
		contsDao.deleteBySeriesId(series_idx);
	}

	
}
