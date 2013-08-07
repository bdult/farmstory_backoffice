package com.bgg.farmstoryback.dao;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CategoryDaoTest {

	
	@Autowired
	CategoryDao categoryDao;

	@After
	public void tearDown() throws Exception {
	}

	
	@Test
	public void specDescription() {

		// given 
		
		// when
		int connCheckCount = categoryDao.connectionTest();

		// then
		assertThat(connCheckCount, is(not(0)));
	}
	
	@Test
	public void testList() {

		// given 

		// when
		List<Map<String, Object>> cateList = categoryDao.list();

		// then
		assertThat(cateList, is(notNullValue()));
		assertThat(cateList.size(), is(not(0)));
		
	}
	
}
