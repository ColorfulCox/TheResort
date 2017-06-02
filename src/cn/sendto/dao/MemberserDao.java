package cn.sendto.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.sendto.dbhelper.ConnectionManager;
import cn.sendto.dbhelper.DbHelper;
import cn.sendto.model.Member;
import cn.sendto.rowmapper.impl.CustomerRowMapper;
import cn.sendto.rowmapper.impl.MemberRowMapper;

public class MemberserDao {
	//创建数据库连接对象
	Connection conn = ConnectionManager.getConnection();
	// 创建执行SQL语句的DbHelper对象
	DbHelper<Member> helper = new DbHelper<Member>();
	/**
	 * 查询会员等级
	 * 
	 * @return 返回集合
	 * @throws SQLException
	 */
	public List<Member> Memberd() throws SQLException {
		try {
			String sql = "select * from member";
			List<Member> list = new ArrayList<Member>();
			list = helper.executeList(conn, sql, new MemberRowMapper(), null);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

}
