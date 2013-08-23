package com.bgg.farmstoryback.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class ContentsService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
//	
//	
//	@Autowired
//	private IdMaker idMaker;
//	
//	/**
//	 * 컨텐츠 생성
//	 * paramter key
//	 * item_nm
//	 * brand_id
//	 * @param itemInfo
//	 */
//	public void createItem(Map<String, Object> itemInfo) {
//		
//		// item_id make
//		itemInfo.put("item_id", idMaker.makeId());
//		
//		// 원본 파일 경로 생성
//		if(itemInfo.get("file") != null){
//			itemInfo.put("src_path", makeFilePath((MultipartFile)itemInfo.get("file")));
//		}else{
//			itemInfo.put("src_path", "/temp/default.flv");
//		}
//		itemDao.create(itemInfo);
//		
//	}
//
//	private String makeFilePath(MultipartFile file) {
//		try {
//			
//			//디렉토리 생성 
//			File desti = new File(parentPath);
//
//		  //해당 디렉토리의 존재여부를 확인
//			if(!desti.exists()){
//				desti.mkdirs(); 
//			}
//			String extenstion = file.getOriginalFilename().substring(file.getOriginalFilename().length()-3);
//			String fileName = idMaker.makeId()+"."+extenstion;
//			byte fileData[] = file.getBytes();
//			FileOutputStream fos = new FileOutputStream(parentPath +fileName);
//			fos.write(fileData);
//			fos.close();
//			return fileName;
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		}
//	public void modify(Map itemModInfo) {
//		// 원본 파일 경로 생성
//		if(itemModInfo.get("file") != null){
//			itemModInfo.put("src_path", makeFilePath((MultipartFile)itemModInfo.get("file")));
//		}else{
//			itemModInfo.put("src_path", "/temp/mod.flv");
//		}
//		itemDao.modify(itemModInfo);
//	}
//	}

	
}
