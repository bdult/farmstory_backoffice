package com.bgg.farmstoryback.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.dao.ContentsDao;

@Service
public class ContentsService {
	
	private final String parentPath = "/var/lib/tomcat6/webapps/storyfarm/source/";

	@Autowired
	private ContentsDao conDao;
	
	/**
	 * 컨텐츠 리스트
	 * @return
	 */
	public List<Map> list(Map parameter) {
		return conDao.list(parameter);
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

	public int totalCount(Map parameter) {
		return conDao.totalCount(parameter);
	}

	public List top5() {
		return conDao.top5();
	}

	public String movieUpload(MultipartFile file) {
		return makeFilePath(file);
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
			String fileName = UUID.randomUUID().toString().replace("-", "")+"."+extenstion;
			byte fileData[] = file.getBytes();
			FileOutputStream fos = new FileOutputStream(parentPath +fileName);
			fos.write(fileData);
			fos.close();
			return "source/"+fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String thumbnailUpload(MultipartFile file) {
		return makeFilePath(file);
	}

	public void addContentsCate(Map parameter) {
		int checkCount = conDao.checkContentsCate(parameter);
		if(checkCount == 0){
			conDao.addContentsCate(parameter);
		}
	}

	public List contentsCateList(Map parameter) {
		return conDao.contentsCateList(parameter);
	}

	public void deleteContentsCate(Map parameter) {
		conDao.deleteContentsCate(parameter);
	}
}
