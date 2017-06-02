package cn.sendto.model;

import java.util.Date;

public class Customer {
	private int memid;
	private String cusnumber;
	private String cusname;
	private char cussex;
	private int cusage;
	private String tel;
	private Date birthday;
	private String idcard;
	private String address;
	private String demo1;
	private Double balance;
	private int integral;
	public int getMemid() {
		return memid;
	}
	public void setMemid(int memid) {
		this.memid = memid;
	}
	public String getCusname() {
		return cusname;
	}
	public void setCusname(String cusname) {
		this.cusname = cusname;
	}
	
	public String getCusnumber() {
		return cusnumber;
	}
	
	public void setCusnumber(String cusnumber) {
		this.cusnumber = cusnumber;
	}
	public char getCussex() {
		return cussex;
	}
	public int getCusage() {
		return cusage;
	}
	public void setCusage(int cusage) {
		this.cusage = cusage;
	}
	public void setCussex(char cussex) {
		this.cussex = cussex;
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
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
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
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public int getIntegral() {
		return integral;
	}
	public void setIntegral(int integral) {
		this.integral = integral;
	}
	
	
}
