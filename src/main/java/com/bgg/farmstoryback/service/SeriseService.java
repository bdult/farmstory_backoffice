package com.bgg.farmstoryback.service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bgg.farmstoryback.dao.BrandDao;
import com.bgg.farmstoryback.dao.ContentsDao;
import com.bgg.farmstoryback.dao.SeriseDao;
import com.bgg.farmstoryback.dao.UserDao;



@Service
public class SeriseService {
	
	@Autowired
	private SeriseDao seriseDao;

	public List<Map> list() {
		return seriseDao.list();
	}
	
	/**
	 * 브랜드 ID 로 시리즈 조회
	 * @param cateId
	 * @return
	 */
	public List<Map> listByBrandId(String cateId) {
		return seriseDao.listByBrandId(cateId);
	}

	/**
	 * 시리즈 생성
	 * @param parameterMap
	 */
	public void create(Map parameterMap) {
		parameterMap.put("brand_id", itemIdMake());
		seriseDao.create(parameterMap);
	}
	
	private String itemIdMake() {
		UUID uid = UUID.randomUUID();
		return uid.toString().replace("-", "");
	}
	
}
