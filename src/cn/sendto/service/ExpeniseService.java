package cn.sendto.service;

import java.sql.SQLException;

import org.apache.log4j.Logger;

import cn.sendto.dao.ExpeniseDao;

public class ExpeniseService {
	ExpeniseDao exp=new ExpeniseDao();
	// 创建日志对象
	Logger lo = Logger.getLogger("Doremind.class");
	/**
	 * 删除消费表中的数据
	 * @param memt 卡号
	 * @return 影响的行数
	 * @throws SQLException
	 */
	public int expenise(String memt) throws SQLException{
		try {
			int row = exp.expenise(memt);
			return row;
		} catch (SQLException e) {
			lo.error("返回消费表影响的行数出错");
			e.printStackTrace();
			throw e;
		}
		
	}
}
