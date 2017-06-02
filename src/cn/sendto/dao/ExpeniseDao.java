package cn.sendto.dao;

import java.sql.Connection;
import java.sql.SQLException;

import cn.sendto.dbhelper.ConnectionManager;
import cn.sendto.dbhelper.DbHelper;
import cn.sendto.model.Expenise;

public class ExpeniseDao {
	//创建数据库连接对象
	Connection conn = ConnectionManager.getConnection();
	// 创建执行SQL语句的DbHelper对象
	DbHelper<Expenise> helper = new DbHelper<Expenise>();
	/**
	 * 删除消费表中的数据
	 * 
	 * @param memt 卡号
	 * @return 影响的行数
	 * @throws SQLException
	 */
	public int expenise(String memt) throws SQLException {
		try {
			String sql = "delete from expenise where cusnumber=?";
			int row = helper.executeUpdate(conn, sql, memt);
			return row;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}
}
