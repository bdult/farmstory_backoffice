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
	
	@Test
	public void testModifyJustBrandInfo() {

		// given 
		String brandId = "cb51ca4ab4da4ac5bf00cac3a91276cc";
		
		Map brandInfo = new HashMap();
		brandInfo.put("brand_nm", "modify_brand");
		brandInfo.put("brand_id", brandId);

		// when
		brandService.modify(brandInfo);

		// then
		Map resultInfo = brandService.detail(brandInfo);
		List<Map> brandCateList = (List<Map>)resultInfo.get("brand_cate_list");
		Map brandDetail  = (Map)resultInfo.get("brand");
		assertThat(resultInfo, is(notNullValue()));
		assertThat((String)resultInfo.get("BRAND_NM"), is("modify_brand"));
		printer.printMap(brandDetail);
		
		if(brandCateList != null){
			assertThat(brandCateList.size(), is(notNullValue()));
			printer.printMapList(brandCateList);
		}
		
	}
	
	@Test
	public void testModifyWithCate() {
		
		// given 
		String brandId = "c6c15a3a0d60481e940efa7b50dad739";
		String preCateId = "C_954682af87414cca86c18a70754b5b58";
		String modifyCateId = "C_954682af87414cca86c18a70754b5b46";
		
		Map brandInfo = new HashMap();
		brandInfo.put("brand_nm", "modify_with_cate");
		brandInfo.put("brand_id", brandId);
		brandInfo.put("pre_cate_id", preCateId);
		brandInfo.put("cate_id", modifyCateId);
		
		// when
		brandService.modify(brandInfo);
		
		// then
		Map resultInfo = brandService.detail(brandInfo);
		List<Map> brandCateList = (List<Map>)resultInfo.get("brand_cate_list");
		Map brandDetail  = (Map)resultInfo.get("brand");
		assertThat(resultInfo, is(notNullValue()));
		printer.printMap(brandDetail);
		
		if(brandCateList != null){
			assertThat(brandCateList.size(), is(notNullValue()));
			printer.printMapList(brandCateList);
		}
		
	}
	
	@Test
	public void testDelete() {

		// given 
		String brandId = "c6c15a3a0d60481e940efa7b50dad739";
		String preCateId = "C_954682af87414cca86c18a70754b5b58";
		String modifyCateId = "C_954682af87414cca86c18a70754b5b46";
		Map brandInfo = new HashMap();
		brandInfo.put("brand_nm", "modify_with_cate");
		brandInfo.put("brand_id", brandId);
		brandInfo.put("pre_cate_id", preCateId);
		brandInfo.put("cate_id", modifyCateId);

		// when
		brandService.delete(brandInfo);

		// then
		Map resultInfo = brandService.detail(brandInfo);
		assertThat(resultInfo.get("brand"), is(nullValue()));
		
	}
	
	
	
}
