package com.bgg.farmstoryback.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bgg.farmstoryback.dto.UserDto;


@Repository
public class UserDao extends SqlSessionDaoSupport {

	public List<UserDto> userList() {
		return (List<UserDto>)getSqlSession().selectList("viewQuery.userList");
	}
}
