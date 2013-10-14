package com.bgg.farmstoryback.common;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUtil {
	
	private final String parentPath = "/var/lib/tomcat6/webapps/storyfarm/";
	
	public String brandThumbnailUpload(MultipartFile file) {
		return makeFilePath("source/thumbnail/brand/",file);
	}
	
	public String cateThumbnailUpload(MultipartFile file) {
		return makeFilePath("source/thumbnail/cate/",file);
	}
	
	public String thumbnailUpload(MultipartFile file) {
		return makeFilePath("source/thumbnail/contents/",file);
	}
	
	public String movieUpload(MultipartFile file) {
		return makeFilePath("source/movie/contents/",file);
	}
	
	private String makeFilePath(String prefix, MultipartFile file) {
		try {
			
			//디렉토리 생성 
			File desti = new File(parentPath+prefix);

		  //해당 디렉토리의 존재여부를 확인
			if(!desti.exists()){
				desti.mkdirs(); 
			}
			String extenstion = file.getOriginalFilename().substring(file.getOriginalFilename().length()-3);
			String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 9)+"."+extenstion;
			byte fileData[] = file.getBytes();
			FileOutputStream fos = new FileOutputStream(parentPath+prefix+fileName);
			fos.write(fileData);
			fos.close();
			return prefix+fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}