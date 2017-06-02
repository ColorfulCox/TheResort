package cn.sendto.model;

public class Member {
private int memid;
private String memtype;
private String discountrate;
private Double minconsumption;
public int getMemid() {
	return memid;
}
public void setMemid(int memid) {
	this.memid = memid;
}
public String getMemtype() {
	return memtype;
}
public void setMemtype(String memtype) {
	this.memtype = memtype;
}
public String getDiscountrate() {
	return discountrate;
}
public void setDiscountrate(String discountrate) {
	this.discountrate = discountrate;
}
public Double getMinconsumption() {
	return minconsumption;
}
public void setMinconsumption(Double minconsumption) {
	this.minconsumption = minconsumption;
}

}
