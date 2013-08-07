package com.bgg.farmstoryback.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.UserDao;
import com.bgg.farmstoryback.dto.UserDto;



@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	
	public List<HashMap<String,String>> userList() {
		return userDao.userList();
	}
	
}
