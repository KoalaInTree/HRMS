//�¶���
package com.hit.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class LeaveInfoInsertVO {
	//��ǰԱ��ID
	private int StaffId;
	//��������
	private Timestamp appdate;
	//��ǰԱ������
	private String dname;
	//��������
	private int vtype;
	//ʣ������
	private String dno;
	//�ݼ�����
	private int sno;
	//��ʼ����
	private Date sd1;
	//��������
	private Date ed1;

	
	public String getDname() {
		return dname;
	}
	public int getStaffId() {
		return StaffId;
	}
	public void setStaffId(int staffId) {
		StaffId = staffId;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}

	
	public Date getSd1() {
		return sd1;
	}
	public void setSd1(Date sd1) {
		this.sd1 = sd1;
	}
	public Date getEd1() {
		return ed1;
	}
	public void setEd1(Date ed1) {
		this.ed1 = ed1;
	}
	
	public int getVtype() {
		return vtype;
	}
	public void setVtype(int vtype) {
		this.vtype = vtype;
	}

	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public Timestamp getAppdate() {
		return appdate;
	}
	public void setAppdate(Timestamp appdate) {
		this.appdate = appdate;
	}

}
