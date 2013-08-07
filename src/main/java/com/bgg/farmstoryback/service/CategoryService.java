package com.bgg.farmstoryback.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.UserDao;
import com.bgg.farmstoryback.dto.UserDto;



@Service
public class CategoryService {

	@Autowired
	private UserDao userDao;

	
	public List<UserDto> userList() {
		return userDao.userList();
	}
	
}
