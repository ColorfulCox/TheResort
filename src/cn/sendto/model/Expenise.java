package cn.sendto.model;

import java.util.Date;

public class Expenise {
	private int expid;
	private String cusnumber;
	private double housing;
	private double resconsumption;
	private double rececost;
	private double expcount;
	private double recconst;
	private Date condate;
	private String remarks;
	
	public int getExpid() {
		return expid;
	}
	public void setExpid(int expid) {
		this.expid = expid;
	}
	public String getCusnumber() {
		return cusnumber;
	}
	public void setCusnumber(String cusnumber) {
		this.cusnumber = cusnumber;
	}
	public double getHousing() {
		return housing;
	}
	public void setHousing(double housing) {
		this.housing = housing;
	}
	public double getResconsumption() {
		return resconsumption;
	}
	public void setResconsumption(double resconsumption) {
		this.resconsumption = resconsumption;
	}
	public double getRececost() {
		return rececost;
	}
	public void setRececost(double rececost) {
		this.rececost = rececost;
	}
	public double getExpcount() {
		return expcount;
	}
	public void setExpcount(double expcount) {
		this.expcount = expcount;
	}
	public double getRecconst() {
		return recconst;
	}
	public void setRecconst(double recconst) {
		this.recconst = recconst;
	}
	public Date getCondate() {
		return condate;
	}
	public void setCondate(Date condate) {
		this.condate = condate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
