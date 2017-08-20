package com.hit.vo;

public class PosListSearchVO {
	
	private String posname;
	private Integer mark;
	
	private int start;
	private int length;
	
	public String getPosname() {
		return posname;
	}
	public void setPosname(String posname) {
		this.posname = posname;
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
