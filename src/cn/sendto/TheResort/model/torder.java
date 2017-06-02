package cn.sendto.TheResort.model;

import java.util.Date;

public class torder {
	private int ornum;
	private String cusname;
	private Date date;
	private Date leavetime;
	private String discount;
	private int accconst;
	private int paycost;
	private int status;
	public int getOrnum() {
		return ornum;
	}
	public void setOrnum(int ornum) {
		this.ornum = ornum;
	}
	public String getCusname() {
		return cusname;
	}
	public void setCusname(String cusname) {
		this.cusname = cusname;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getLeavetime() {
		return leavetime;
	}
	public void setLeavetime(Date leavetime) {
		this.leavetime = leavetime;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public int getAccconst() {
		return accconst;
	}
	public void setAccconst(int accconst) {
		this.accconst = accconst;
	}
	public int getPaycost() {
		return paycost;
	}
	public void setPaycost(int paycost) {
		this.paycost = paycost;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

}
