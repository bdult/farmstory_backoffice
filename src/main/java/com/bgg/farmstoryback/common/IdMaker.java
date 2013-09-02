package com.bgg.farmstoryback.common;

import java.util.UUID;

import org.springframework.stereotype.Service;

@Service
public class IdMaker {
	
	public String makeId() {
		UUID uid = UUID.randomUUID();
		return uid.toString().replace("-", "");
	}

}
