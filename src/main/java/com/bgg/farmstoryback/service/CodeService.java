package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.common.PageUtil;
import com.bgg.farmstoryback.dao.CodeDao;

@Service
public class CodeService {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private CodeDao codeDao;

	public List<Map> parentCodeList() {
		return codeDao.parentCodeList();
	}

	public List<Map> displayCodeList() {
		return codeDao.displayCodeList();
	}
	
	public List<Map> paymentCodeList() {
		return codeDao.paymentCodeList();
	}
	
	public List<Map> payProcessCodeList() {
		return codeDao.payProcessCodeList();
	}

	public List<Map> locationCodeList() {
		return codeDao.locationCodeList();
	}
	
	
	
//	@Autowired
//	private PageUtil pageUtil;
//
//	public List<Map> list(Map paramInfo) {
//		return codeDao.list(paramInfo);
//	}
//
//	public int totalCount(Map paramInfo) {
//		return codeDao.totalCount(paramInfo);
//	}
//
//	public Map detail(String code_idx) {
//		return codeDao.detail(code_idx);
//	}
//
//	public void delete(Map<String, Object> parameter) {
//		codeDao.delete(parameter);
//	}
//
//	public void modify(Map<String, String> parameter) {
//		codeDao.modify(parameter);
//	}
}
