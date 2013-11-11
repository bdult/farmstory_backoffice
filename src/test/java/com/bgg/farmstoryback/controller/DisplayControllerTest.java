package com.bgg.farmstoryback.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:servlet-contextForTest.xml"})
public class DisplayControllerTest {

	@Autowired
	private DisplayController displayController;
	
	
	@Test
	public void testContentsManageView() {
		
		MockHttpServletRequest mock = new MockHttpServletRequest();
//		displayController.contentsManageView(model, parameter);
	}

}
