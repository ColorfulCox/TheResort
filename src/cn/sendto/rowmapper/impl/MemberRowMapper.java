package cn.sendto.rowmapper.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.sendto.model.Member;
import cn.sendto.rowmapper.IRowMapper;

public class MemberRowMapper implements IRowMapper<Member>{

	@Override
	public Member rowMapper(Connection conn, ResultSet rs) throws SQLException{
		Member mem=new Member();
		mem.setMemid(rs.getInt("memid"));
		mem.setMemtype(rs.getString("memtype"));
		mem.setDiscountrate(rs.getString("discountrate"));
		mem.setMinconsumption(rs.getDouble("minconsumption"));
		return mem;
	}

}
