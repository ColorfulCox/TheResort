package cn.sendto.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import cn.sendto.dbhelper.ConnectionManager;
import cn.sendto.dbhelper.DbHelper;
import cn.sendto.model.Customer;
import cn.sendto.rowmapper.impl.CustomerRowMapper;
import cn.sendtu.util.DateCompare;

/**
 * 业务中心
 *
 */
public class CustomerDao {
	// 创建数据库连接对象
	Connection conn = ConnectionManager.getConnection();
	// 创建执行SQL语句的DbHelper对象
	DbHelper<Customer> helper = new DbHelper<Customer>();

	/**
	 * 查询客户表所有信息
	 * 
	 * @return 客户表的集合
	 * @throws SQLException
	 */
	public List<Customer> BirReminder() throws SQLException {
		try {
			String sql = "select * from customer";
			List<Customer> list = new ArrayList<Customer>();
			list = helper.executeList(conn, sql, new CustomerRowMapper(), null);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}
	/**
	 * 生日提醒
	 * 
	 * @return 最近过生日的集合
	 * @throws SQLException
	 */
	public List<Customer> compareBirReminder() throws SQLException {
		try {
			String sql = "select * from customer";
			sql= sql+" where "+DateCompare.getIntervalQuery(10, new Date(), "birthday");
			List<Customer> list = new ArrayList<Customer>();
			list = helper.executeList(conn, sql, new CustomerRowMapper(), null);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 积分兑换
	 * 
	 * @param integral
	 *            兑换后剩余积分
	 * @param cusnumber
	 *            卡号
	 * @return 影响行数
	 * @throws SQLException
	 */
	public int integer(int integral, String cusnumber) throws SQLException {
		try {
			String sql = "update customer set integral=? where cusnumber=?";
			int row = helper.executeUpdate(conn, sql, integral, cusnumber);
			return row;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 通过卡号查询客户表所有信息
	 * 
	 * @param memtype
	 *            卡号
	 * @return 查询结果集
	 * @throws SQLException
	 */
	public List<Customer> cusnumber(String memtype) throws SQLException {
		try {
			String sql = "select * from customer where cusnumber=?";
			List<Customer> list = helper.executeList(conn, sql, new CustomerRowMapper(), memtype);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 通过卡号查询客户表所有信息
	 * 
	 * @param memtype
	 *            卡号
	 * @return 查询结果集
	 * @throws SQLException
	 */
	public int cusnumberIntegral(String memtype) throws SQLException {
		try {
			String sql = "select integral from customer where cusnumber=?";
			ResultSet rs = helper.executeQuery(conn, sql, memtype);
			if (rs.next()) {
				return rs.getInt("integral");
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * 查询客户表所有信息
	 * 
	 * @return 姓名查询结果集
	 * @throws SQLException
	 */
	public List<Customer> customer(String name) throws SQLException {
		try {
			String sql = "select * from customer where cusname=?";
			List<Customer> list = helper.executeList(conn, sql, new CustomerRowMapper(), name);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 查询会员类型
	 * 
	 * @return 会员类型集合
	 * @throws SQLException
	 */
	public List<Customer> memcustomer() throws SQLException {
		try {
			String sql = "select customer.cusnumber,customer.cusid,customer.cusname,member.memtype,customer.tel,customer.address,customer.demo1 from customer,member where customer.memid=member.memid";
			List<Customer> list = helper.executeList(conn, sql, new CustomerRowMapper(), null);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 删除消费表数据信息
	 * 
	 * @param expid
	 *            要删除的id号
	 * @return 影响的行数
	 * @throws SQLException
	 */
	public int deleteexpenise(String expid) throws SQLException {
		try {
			String sql = "delete from expenise where expid=?";
			int row = helper.executeUpdate(conn, sql, expid);
			return row;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 删除用户表数据信息
	 * 
	 * @param memt
	 *            要删除的id号
	 * @return 影响的行数
	 * @throws SQLException
	 */
	public int delete(String memt) throws SQLException {
		try {
			String sql = "delete from customer where cusnumber=?";
			int row = helper.executeUpdate(conn, sql, memt);
			return row;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 修改用户表数据信息
	 * 
	 * @param cusnumber
	 *            卡号
	 * @param cusname
	 *            姓名
	 * @param cussex
	 *            性别
	 * @param tel
	 *            电话
	 * @param birthday
	 *            生日
	 * @param idcard
	 *            身份证号码
	 * @param address
	 *            住址
	 * @param demo1
	 *            备注
	 * @return 影响的行数
	 * @throws SQLException
	 */
	public int insert(String cusnumber, String cusname, String cussex, String tel, String birthday, String idcard,
			String address, String demo1) throws SQLException {
		try {
			String sql = "update customer set cusname=?,cussex=?,tel=?,birthday=?,idcard=?,address=?,demo1=? where cusnumber=?";
			int row = helper.executeUpdate(conn, sql, cusname, cussex, tel, birthday, idcard, address, demo1,
					cusnumber);
			return row;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 充值
	 * 
	 * @param balance
	 *            充值后的金额
	 * @param integral
	 *            充值后的积分
	 * @return 影响行数
	 * @throws SQLException
	 */
	public int recharge(String balance, String integral, String cusnumber) throws SQLException {
		try {
			String sql = "update customer set balance=?,integral=? where cusnumber=?";
			int row = helper.executeUpdate(conn, sql, balance, integral, cusnumber);
			return row;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}

	/**
	 * 添加会员
	 * 
	 * @param memid
	 *            会员级别
	 * @param cusnumber
	 *            卡号
	 * @param cusname
	 *            姓名
	 * @param cussex
	 *            性别
	 * @param tel
	 *            电话
	 * @param birthday
	 *            生日
	 * @param idcard
	 *            身份证号
	 * @param address
	 *            地址
	 * @param demo1
	 *            备注
	 * @return 主键
	 * @throws SQLException
	 */
	public int insertcus(String memid,String cusname, String cussex, String tel, String birthday,
			String idcard, String address, String demo1) throws SQLException {
		try {
			// 定义SQL语句
			String sql = "insert into customer(memid,cusname,cussex, tel,  birthday, idcard,address,demo1 ) values(?,?,?,?,?,?,?,?)";
			int row = helper.executeInsert(conn, sql,memid,cusname,cussex, tel,  birthday, idcard,address,demo1);
			return row;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}
	/**
	 * 添加会员
	 * 
	 * @param memid
	 *            会员级别
	 * @param cusnumber
	 *            卡号
	 * @param cusname
	 *            姓名
	 * @param cussex
	 *            性别
	 * @param tel
	 *            电话
	 * @param birthday
	 *            生日
	 * @param idcard
	 *            身份证号
	 * @param address
	 *            地址
	 * @param demo1
	 *            备注
	 * @return 影响行数
	 * @throws SQLException
	 */
	public int inname(String memid,String cusnumber,String cusname, String cussex, String tel, String birthday,
			String idcard, String address, String demo1) throws Exception {
		try{
		Connection conn = ConnectionManager.getConnection();
		//创建DBHelper类对象
		DbHelper helper = new DbHelper();

		//定义SQL语句
		String sql = "insert into customer(memid,cusnumber, cusname,cussex, tel,  birthday, idcard,address,demo1 ) values(?,?,?,?,?,?,?,?,?)";
		int row = helper.executeUpdate(conn, sql,memid,cusnumber, cusname,cussex, tel,  birthday, idcard,address,demo1);
		return row;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			ConnectionManager.close(conn);
		}
	}
}
