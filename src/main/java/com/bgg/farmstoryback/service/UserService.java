package com.bgg.farmstoryback.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bgg.farmstoryback.dao.UserDao;



@Service
public class UserService {

	@Autowired
	private UserDao userDao;

	
	
}
