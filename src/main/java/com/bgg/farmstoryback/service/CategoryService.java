package com.bgg.farmstoryback.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.CategoryDao;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;

	
	public List<Map<String, Object>> userList() {
		return categoryDao.categoryList();
	}
	
}
