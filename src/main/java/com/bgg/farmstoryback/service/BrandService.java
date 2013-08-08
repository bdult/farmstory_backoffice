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
import com.bgg.farmstoryback.dao.UserDao;
import com.bgg.farmstoryback.dto.UserDto;



@Service
public class BrandService {
	
	@Autowired
	private BrandDao brandDao;

	public List<Map> list() {
		return brandDao.list();
	}
	
	public List<Map> listByCateId(String cateId) {
		return brandDao.listByCateId(cateId);
	}

	/**
	 * 브랜드 생성
	 * @param parameterMap
	 */
	public void create(Map parameterMap) {
		parameterMap.put("brand_id", itemIdMake());
		brandDao.create(parameterMap);
		brandDao.createCateBrand(parameterMap);
	}
	
	private String itemIdMake() {
		UUID uid = UUID.randomUUID();
		return uid.toString().replace("-", "");
	}
	
}
