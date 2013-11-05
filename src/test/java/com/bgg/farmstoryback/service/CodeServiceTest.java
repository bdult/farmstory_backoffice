package com.bgg.farmstoryback.service;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;

import java.util.List;
import java.util.Map;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bgg.farmstoryback.common.ConstantsForDb;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class CodeServiceTest {
	
	@Autowired
	private CodeService codeService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	
	@Test
	public void testParentCodeList() {
		
		// given

		// when
		List<Map> parentCodeList = codeService.parentCodeList();

		// then
		assertThat(parentCodeList, is(notNullValue()));
		assertThat(parentCodeList.size(), is(not(0)));
	}
	
	@Test
	public void testDisplayCodeList() {
		
		// given 

		// when
		List<Map> displayCodeList = codeService.displayCodeList();

		// then
		assertThat(displayCodeList, is(notNullValue()));
		assertThat(displayCodeList.size(), is(not(0)));
		String code = (String)displayCodeList.get(0).get(ConstantsForDb.CODE);
		assertTrue(code.contains("DIS"));

	}
	
	@Test
	public void testPayProcessCodeList() {
		
		// given 
		
		// when
		List<Map> payProcessCodeList = codeService.payProcessCodeList();
		
		// then
		assertThat(payProcessCodeList, is(notNullValue()));
		assertThat(payProcessCodeList.size(), is(not(0)));
		String code = (String)payProcessCodeList.get(0).get(ConstantsForDb.CODE);
		assertTrue(code.contains("PRO"));
		
	}
	
	@Test
	public void testPaymentCodeList() {
		
		// given 
		
		// when
		List<Map> paymentCodeList = codeService.paymentCodeList();
		
		// then
		assertThat(paymentCodeList, is(notNullValue()));
		assertThat(paymentCodeList.size(), is(not(0)));
		String code = (String)paymentCodeList.get(0).get(ConstantsForDb.CODE);
		assertTrue(code.contains("PAY"));
		
	}

}
