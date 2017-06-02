package cn.sendto.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.sendto.dbhelper.ConnectionManager;
import cn.sendto.dbhelper.DbHelper;
import cn.sendto.model.Proscenium;
import cn.sendto.rowmapper.impl.ProsceniumRowMapper;

/**
 * 登陆
 *
 */
public class ProsceniumDao {
	// 创建数据库连接对象
	Connection conn = ConnectionManager.getConnection();
	// 创建执行SQL语句的DbHelper对象
	DbHelper<Proscenium> helper = new DbHelper<Proscenium>();

	/**
	 * 登陆的实现
	 * 
	 * @param username
	 *            用户名
	 * @param userpass
	 *            密码
	 * @throws SQLException
	 */
	public List<Proscenium> connect(String username) throws SQLException {
		try {
			String sql = "select * from proscenium where proname=?";
			List<Proscenium> list = new ArrayList<Proscenium>();
			list = helper.executeList(conn, sql, new ProsceniumRowMapper(), username);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}
}
