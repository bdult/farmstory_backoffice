package com.bgg.farmstoryback.service;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.HashMap;
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

import com.bgg.farmstoryback.common.LogPrinter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BrandServiceTest {

	@Autowired
	LogPrinter printer;
	
	@Autowired
	BrandService brandService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testList() {

		// given 
		Map brandInfo = new HashMap();
		brandInfo.put("brand_nm", "test1");
		brandService.create(brandInfo);
		
		// when
		List<Map> brandList = brandService.list();

		// then
		printer.printMapList(brandList);
		assertThat(brandList, is(notNullValue()));
		assertThat(brandList.size(), is(not(0)));
		
	}
	
	@Test
	public void testListByCateId() {
		// given 
		String cateId = "C_954682af87414cca86c18a70754b5b58";
		
		// when
		List<Map> brandList = brandService.listByCateId(cateId);
		
		// then
		printer.printMapList(brandList);
		assertThat(brandList, is(notNullValue()));
		assertThat(brandList.size(), is(not(0)));
	}
	
	@Test
	public void testCreate() {
		// given 
		Map brandInfo = new HashMap();
		brandInfo.put("brand_nm", "brand_insert_test");
		
		// when
		brandService.create(brandInfo);
		
	}
	
	
	
}
