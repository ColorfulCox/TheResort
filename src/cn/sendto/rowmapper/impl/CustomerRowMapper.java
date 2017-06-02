package cn.sendto.rowmapper.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.sendto.model.Customer;
import cn.sendto.rowmapper.IRowMapper;

public class CustomerRowMapper  implements IRowMapper<Customer>{

	@Override
	public Customer rowMapper(Connection conn, ResultSet rs) throws SQLException {
		Customer cu=new Customer();
		cu.setMemid(rs.getInt("memid"));
		cu.setCusnumber(rs.getString("cusnumber"));
		cu.setCusage(rs.getInt("cusage"));
		cu.setCusname(rs.getString("cusname"));
		cu.setCussex(rs.getString("cussex").charAt(0));
		cu.setTel(rs.getString("tel"));
		cu.setBirthday(rs.getDate("birthday"));
		cu.setIdcard(rs.getString("idcard"));
		cu.setAddress(rs.getString("address"));
		cu.setDemo1(rs.getString("demo1"));
		cu.setBalance(rs.getDouble("balance"));
		cu.setIntegral(rs.getInt("integral"));
		return cu;
	}

}
