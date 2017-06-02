package cn.sendto.service;

import java.sql.SQLException;
import java.util.List;
import org.apache.log4j.Logger;

import cn.sendto.dao.ProsceniumDao;
import cn.sendto.model.Proscenium;

/**
 * 登陆的处理
 * 
 */
public class ProsceniumService {

	// 创建数据层访问类对象
	ProsceniumDao log = new ProsceniumDao();
	// 创建日志对象
	//Logger lo = Logger.getLogger("DoLogin.class");

	/**
	 * 用户名查寻
	 * 
	 * @param username
	 *            用户名
	 * @return 返回这一行的集合
	 * @throws SQLException
	 */
	public List<Proscenium> judge(String username) throws SQLException {
		try {
			return log.connect(username);
		} catch (SQLException e) {
			//lo.error("返回用户类所有用户实体类集合出错。");
			e.printStackTrace();
			throw e;
		}
	}
}
