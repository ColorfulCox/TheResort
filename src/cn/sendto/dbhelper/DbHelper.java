package cn.sendto.dbhelper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.sendto.rowmapper.IRowMapper;

/**
 * CRUD操作 Create(添加数据) Retrieve(读取查询) Update(更新) Delete(删除)
 * 
 * @author Administrator
 * 
 */
public class DbHelper<T> {

	// 执行SQL语句的预编译对象
	private PreparedStatement psmt;

	/**
	 * 执行添加数据、修改数据、删除数据
	 * 
	 * @param conn
	 *            数据库连接对象
	 * @param sql
	 *            要执行的SQL语句
	 * @param objs
	 *            SQL语句赋值的参数数组
	 * @return 返回影响的行数
	 * @throws SQLException
	 *             抛出SQL异常
	 */
	public int executeUpdate(Connection conn, String sql, Object... objs)
			throws SQLException {
		// 创建PreparedStatement对象
		psmt = conn.prepareStatement(sql);

		// 设置SQL语句参数
		setParametter(objs);

		// 执行SQL语句，并返回影响的行数
		return psmt.executeUpdate();
	}

	/**
	 * 执行添加数据，并返回添加数据的主键值
	 * 
	 * @param conn
	 *            连接对象
	 * @param sql
	 *            执行SQL语句
	 * @param objs
	 *            给SQL语句参数赋值
	 * @return 返回添加数据的主键值
	 * @throws SQLException
	 *             抛出SQLException
	 */
	public int executeInsert(Connection conn, String sql, Object... objs)
			throws SQLException {
		// 创建PreparedStatement对象
		psmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

		// 设置SQL语句参数
		setParametter(objs);

		// 执行SQL语句，并返回影响的行数
		psmt.executeUpdate();

		// 返回主键结果集，结果集只有一行一列。如果要想返回主键值，此主键列必须是自增长列，如果不是不能返回主键。
		ResultSet rs = psmt.getGeneratedKeys();

		while (rs.next()) {
			return rs.getInt(1);
		}
		return -1;
	}

	/**
	 * 执行查询数据,并返回查询的结果集
	 * 
	 * @param conn
	 *            数据库连接对象
	 * @param sql
	 *            要执行的SQL语句
	 * @param objs
	 *            SQL语句赋值的参数数组
	 * @return 返回查询的结果集
	 * @throws SQLException
	 *             抛出SQL异常
	 */
	public ResultSet executeQuery(Connection conn, String sql, Object... objs)
			throws SQLException {
		// 创建PreparedStatement对象
		psmt = conn.prepareStatement(sql);

		// 设置SQL语句参数
		setParametter(objs);

		// 执行SQL语句，并返回影响的结果集
		return psmt.executeQuery();
	}

	/**
	 * 执行查询SQL语句,并且返回对应实体集合
	 * 
	 * @param conn 连接对象
	 * @param sql 执行的SQL语句
	 * @param rowmapper 结果集填充实体对象
	 * @param objs  SQL语句赋值的参数数组
	 * @return 返回对应实体集合
	 * @throws SQLException 抛出SQL异常
	 */
	public List<T> executeList(Connection conn, String sql,
			IRowMapper<T> rowmapper, Object... objs) throws SQLException {
		// 创建PreparedStatement对象
		psmt = conn.prepareStatement(sql);

		// 设置SQL语句参数
		setParametter(objs);

		ResultSet rs= psmt.executeQuery();
		
		List<T> list = new ArrayList<T>();
		
		while(rs.next()){
			T t = rowmapper.rowMapper(conn, rs); 
			list.add(t);
		}
		
		return list;
	}

	/**
	 * 设置SQL语句参数值
	 * 
	 * @param objs
	 * @throws SQLException
	 */
	private void setParametter(Object... objs) throws SQLException {
		if (objs != null) {
			for (int i = 0; i < objs.length; i++) {
				psmt.setObject(i + 1, objs[i]);
			}
		}
	}

}
