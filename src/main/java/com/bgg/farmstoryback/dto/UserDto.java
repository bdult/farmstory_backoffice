package com.bgg.farmstoryback.dto;

public class UserDto {
	
	private String id;
	
	private String name;
	
	private String pw;
	

	public String getId() {
		return id;
	}

	public void setId(String member_id) {
		this.id = member_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String member_nm) {
		this.name = member_nm;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String member_pw) {
		this.pw = member_pw;
	}
}
