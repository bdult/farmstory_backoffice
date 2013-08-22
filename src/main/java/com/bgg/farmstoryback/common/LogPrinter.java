package com.bgg.farmstoryback.common;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class LogPrinter {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	public void printMapList(List<Map> mapList){
		for(Map<String, Object>  mapInfo  : mapList){
			for (String key : mapInfo.keySet()) {
				logger.info("Key : {} -> Value : {}", key, mapInfo.get(key));
			}
		}
	}

	public void printMap(Map mapInfo) {
		for (Object key : mapInfo.keySet()) {
			logger.info("Key : {} -> Value : {}", key, mapInfo.get(key));
		}
	}
	
}
