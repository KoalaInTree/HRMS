package com.hit.vo;

public class DepListSearchVO {

	private String depname;
	private Integer mark;
	
	private int start;
	private int length;
	public String getDepname() {
		return depname;
	}
	public void setDepname(String depname) {
		this.depname = depname;
	}
	
	public Integer getMark() {
		return mark;
	}
	public void setMark(Integer mark) {
		this.mark = mark;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getLength() {
		return length;
	}
	public void setLength(int length) {
		this.length = length;
	}
	
}
