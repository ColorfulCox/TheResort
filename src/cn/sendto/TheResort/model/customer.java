package cn.sendto.TheResort.model;

import java.util.Date;

public class customer {
	private char cusid;
	private String memid;
	private String cusname;
	private char cusage;
	private String tel;
	private Date birthday;
	private int idcard;
	private String address;
	private String demo1;
	public char getCusid() {
		return cusid;
	}
	public void setCusid(char cusid) {
		this.cusid = cusid;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getCusname() {
		return cusname;
	}
	public void setCusname(String cusname) {
		this.cusname = cusname;
	}
	public char getCusage() {
		return cusage;
	}
	public void setCusage(char cusage) {
		this.cusage = cusage;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getIdcard() {
		return idcard;
	}
	public void setIdcard(int idcard) {
		this.idcard = idcard;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDemo1() {
		return demo1;
	}
	public void setDemo1(String demo1) {
		this.demo1 = demo1;
	}
	
	
}
