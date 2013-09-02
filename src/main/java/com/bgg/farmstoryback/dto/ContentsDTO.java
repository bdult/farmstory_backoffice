package com.bgg.farmstoryback.dto;

public class ContentsDTO extends CommonDTO {

	private String contents_id;
	private String contents_nm;
	private String contents_series_id;
	private String brand_id;
	private String src_path;
	private String img_path;
	private String mode;
	private int status;
	
	public String getContents_id() {
		return contents_id;
	}
	public void setContents_id(String contents_id) {
		this.contents_id = contents_id;
	}
	public String getContents_nm() {
		return contents_nm;
	}
	public void setContents_nm(String contents_nm) {
		this.contents_nm = contents_nm;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getContents_series_id() {
		return contents_series_id;
	}
	public void setContents_series_id(String contents_series_id) {
		this.contents_series_id = contents_series_id;
	}
	public String getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	public String getSrc_path() {
		return src_path;
	}
	public void setSrc_path(String src_path) {
		this.src_path = src_path;
	}
	public String getImg_path() {
		return img_path;
	}
	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
		
}
