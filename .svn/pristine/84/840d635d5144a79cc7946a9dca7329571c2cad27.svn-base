package cn.sendto.rowmapper.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.sendto.model.Proscenium;
import cn.sendto.rowmapper.IRowMapper;

public class ProsceniumRowMapper implements IRowMapper<Proscenium>{

	@Override
	public Proscenium rowMapper(Connection conn, ResultSet rs) throws SQLException {
		Proscenium pro=new Proscenium();
		pro.setProid(rs.getInt("proid"));
		pro.setProname(rs.getString("proname"));
		pro.setPropass(rs.getString("propass"));
		pro.setProsex(rs.getString("prosex"));
		pro.setProage(rs.getInt("proage"));
		pro.setProaddress(rs.getString("proaddress"));
		pro.setEmail(rs.getString("email"));
		return pro;
	}
	
}
