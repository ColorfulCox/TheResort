package cn.sendto.rowmapper.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.sendto.model.Expenise;
import cn.sendto.rowmapper.IRowMapper;

public class ExpeniseRowMapper implements IRowMapper<Expenise>{

	public Expenise rowMapper(Connection conn, ResultSet rs) throws SQLException {
		
		Expenise exp=new Expenise();
		exp.setExpid(rs.getInt("expid"));
		exp.setCusnumber(rs.getString("cusnumber"));
		exp.setHousing(rs.getDouble("housing"));
		exp.setResconsumption(rs.getDouble("resconsumption"));
		exp.setRececost(rs.getDouble("rececost"));
		exp.setExpcount(rs.getDouble("expcount"));
		exp.setRecconst(rs.getDouble("recconst"));
		exp.setCondate(rs.getDate("condate"));
		exp.setRemarks(rs.getString("remarks"));
		return exp;
	}
}
