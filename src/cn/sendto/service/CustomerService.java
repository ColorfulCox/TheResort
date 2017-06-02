package cn.sendto.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;

import cn.sendto.TheResort.model.customer;
import cn.sendto.dao.CustomerDao;
import cn.sendto.model.Customer;

/**
 * 业务中心
 * 
 */
public class CustomerService {

	// 创建数据层访问类对象
	CustomerDao rem = new CustomerDao();
	// 创建日志对象
	Logger lo = Logger.getLogger("Doremind.class");

	/**
	 * 查询客户表所有信息
	 * 
	 * @return 客户表的集合
	 * @throws SQLException
	 */
	public List<Customer> Reminder() throws SQLException {
		try {
			List<Customer> list = rem.BirReminder();
			if (list.size() > 0) {
				return list;
			} else {
				return null;
			}
		} catch (SQLException e) {
			lo.error("返回客户表的集合出错");
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 生日提醒
	 * 
	 * @return 最近过生日的集合
	 * @throws SQLException
	 */
	public List<Customer> BirReminder() throws SQLException {
		try {
			List<Customer> list = rem.compareBirReminder();
			if (list.size() > 0) {
				return list;
			} else {
				return null;
			}
		} catch (SQLException e) {
			lo.error("返回客户表的集合出错");
			e.printStackTrace();
			throw e;
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
	public int integer(String integral, String cusnumber) throws SQLException {
		try {
			// 1.取积分值
			// 2.判断积分值是否足够兑换礼物
			// 3.如果积分足够兑换礼物，更新客户积分，返回影响行数，如果不够返回-1

			// 1.取积分值
			int myIntegral = rem.cusnumberIntegral(cusnumber);
			// 2.判断积分值是否足够兑换礼物
			int curIntegral = myIntegral - Integer.parseInt(integral);
			if (curIntegral >= 0) {
				// 如果积分足够兑换礼物，更新客户积分
				return rem.integer(curIntegral, cusnumber);
			} else {
				// 如果不够返回-1
				return -1;
			}
		} catch (SQLException e) {
			lo.error("积分兑换功能出错");
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * 查询客户姓名查询信息
	 * 
	 * @return 姓名查询的集合
	 * @throws SQLException
	 */
	public List<Customer> Remin(String name) throws SQLException {
		try {
			List<Customer> list = rem.customer(name);
			if (list.size() > 0) {
				return list;
			} else {
				return null;
			}
		} catch (SQLException e) {
			lo.error("返回客户表的集合出错");
			e.printStackTrace();
			throw e;
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
			List<Customer> list = rem.cusnumber(memtype);
			if (list.size() > 0) {
				return list;
			} else {
				return null;
			}
		} catch (SQLException e) {
			lo.error("返回客户表的集合出错");
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * 查询会员类型
	 * 
	 * @return 会员类型集合
	 * @throws SQLException
	 */
	public List<Customer> memcust() throws SQLException {
		try {
			List<Customer> list = rem.memcustomer();
			if (list.size() > 0) {
				return list;
			} else {
				return null;
			}
		} catch (SQLException e) {
			lo.error("返回会员类型集合出错");
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * 删除消费表数据信息
	 * 
	 * @param memt
	 *            要删除的id号
	 * @return 影响的行数
	 * @throws SQLException
	 */
	public int deleteexpenise(String expid) throws SQLException {
		try {
			return rem.deleteexpenise(expid);
		} catch (SQLException e) {
			lo.error("返回删除用户消费信息出错");
			e.printStackTrace();
			throw e;
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
	public int deletenumber(String memt) throws SQLException {
		try {
			return rem.delete(memt);
		} catch (SQLException e) {
			lo.error("返回删除用户出错");
			e.printStackTrace();
			throw e;
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
			//SimpleDateFormat form = new SimpleDateFormat("yyyy");
			//Date date=new Date();
			//int age=Integer.parseInt(form.format(date))-Integer.parseInt(form.format(birthday));
			return rem.insert(cusnumber, cusname, cussex, tel, birthday, idcard, address, demo1);
		} catch (SQLException e) {
			lo.error("修改用户表数据信息出错");
			e.printStackTrace();
			throw e;
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
			return rem.recharge(balance, integral, cusnumber);
		} catch (SQLException e) {
			lo.error("充值功能出错");
			e.printStackTrace();
			throw e;
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
	public int insertcus(String memid,String cusname, String cussex, String tel, String birthday,
			String idcard, String address, String demo1) throws SQLException {
		try {
			//SimpleDateFormat form = new SimpleDateFormat("yyyy");
			//Date date=new Date();
			//int age=Integer.parseInt(form.format(date))-Integer.parseInt(form.format(birthday));
			return rem.insertcus(memid,cusname, cussex, tel, birthday, idcard, address, demo1);
			
		} catch (SQLException e) {
			lo.error("充值功能出错");
			e.printStackTrace();
			throw e;
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
		try {
			//SimpleDateFormat form = new SimpleDateFormat("yyyy");
			//Date date=new Date();
			//int age=Integer.parseInt(form.format(date))-Integer.parseInt(form.format(birthday));
			int row= rem.inname(memid,cusnumber,cusname, cussex, tel, birthday, idcard, address, demo1);
			if(row>0){
				return 1;
			}else{
				return 0;
			}
		} catch (Exception e) {
			lo.error("充值功能出错");
			e.printStackTrace();
			throw e;
		}
		
	}
	/**
	 * 返回充值奖励的积分
	 * @param balance 充值金额
	 * @return
	 */
	public int points(String balance) {
		int integral=0;
		int money=Integer.parseInt(balance);
		if(money>=30000){
			integral=2500;
		}else if(money>=20000){
			integral=1500;
		}else if(money>=12000){
			integral=1000;
		}else if(money>=8000){
			integral=600;
		}else if(money>=5000){
			integral=300;
		}else if(money>=2000){
			integral=100;
		}else{
			integral=(int)(money*0.01);
		}
		return integral;
	}

}