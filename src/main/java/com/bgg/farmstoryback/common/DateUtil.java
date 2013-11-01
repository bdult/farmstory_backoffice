package com.bgg.farmstoryback.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.slf4j.Logger;
import org.springframework.stereotype.Component;


@Component
public class DateUtil {

	Logger logger = org.slf4j.LoggerFactory.getLogger(getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal;
	
	public String today(){
		cal = Calendar.getInstance();
		return sdf.format(cal.getTime());
	}
	
	public String add(int days){
		cal = Calendar.getInstance();
		cal.add(Calendar.DATE, days);
		return sdf.format(cal.getTime());
	}

}
