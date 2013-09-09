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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class BrandServiceTest {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BrandService brandService;
	
	@Autowired
	CategoryService cateService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testList() {

		// given 
		testCreate();
		
		// when
		List<Map> brandList = brandService.list(null);

		// then
		logger.info("list=", brandList);
		assertThat(brandList, is(notNullValue()));
		assertThat(brandList.size(), is(not(0)));
		
	}
	
	@Test
	public void testCreate() {
		// given 
		String brandNm = "brand_insert_test";
		Map brandInfo = new HashMap();
		brandInfo.put("brand_nm", brandNm);
		
		// when
		String brandId = brandService.create(brandInfo);
		
		// then
		Map brandDetail = brandService.detail(brandInfo);
		assertThat(brandDetail, is(notNullValue()));
		assertThat((String)brandDetail.get("BRAND_NM"), is(brandNm));
	}
	
	@Test
	public void testModifyJustBrandInfo() {

		// given 
		List<Map> brandList = brandService.list(null);
		if(brandList.size() == 0){
			testCreate();
			brandList = brandService.list(null);
		}
		String brandId = ""+brandList.get(0).get("BRAND_ID");
		
		Map modifyInfo = new HashMap();
		modifyInfo.put("brand_nm", "modify_brand");
		modifyInfo.put("brand_id", brandId);

		// when
		brandService.modify(modifyInfo);

		// then
		Map resultInfo = brandService.detail(modifyInfo);
		assertThat(resultInfo, is(notNullValue()));
		assertThat((String)resultInfo.get("BRAND_NM"), is("modify_brand"));
		logger.info("detail=", resultInfo);
	}
	
	
	@Test
	public void testDelete() {

		// given 
		List<Map> brandList = brandService.list(null);
		if(brandList.size() == 0){
			Map brandInfo = new HashMap();
			brandInfo.put("brand_nm", "brand_insert_test");
			brandService.create(brandInfo);
			brandList = brandService.list(null);
		}
		String brandId = ""+brandList.get(0).get("BRAND_ID");
		
		Map brandInfo = new HashMap();
		brandInfo.put("brand_id", brandId);

		// when
		brandService.delete(brandInfo);

		// then
		Map resultInfo = brandService.detail(brandInfo);
		assertThat(resultInfo, is(nullValue()));
		
	}
	
	
	
}
