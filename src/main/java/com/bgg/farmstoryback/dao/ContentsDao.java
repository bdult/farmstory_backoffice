package com.bgg.farmstoryback.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bgg.farmstoryback.dto.ContentsDTO;


@Repository
public class ContentsDao extends SqlSessionDaoSupport {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	public List<Map> list() {
		return (List<Map>)getSqlSession().selectList("contentsQuery.list");
	}

	public void create(ContentsDTO contentsDTO) {
		getSqlSession().insert("contentsQuery.create", contentsDTO);
		
	}
	
	public ContentsDTO detail(String contents_id) {
		return (ContentsDTO)getSqlSession().selectOne("contentsQuery.detail", contents_id);
	}
	
	public void delete(String itemId) {
		getSqlSession().delete("contentsQuery.delete", itemId);
	}
	
	public void modify(Map itemModInfo) {
		getSqlSession().update("contentsQuery.modify", itemModInfo);
		
	}
	
}
