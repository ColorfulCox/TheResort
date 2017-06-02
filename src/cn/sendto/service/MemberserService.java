package cn.sendto.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.log4j.Logger;

import cn.sendto.dao.MemberserDao;
import cn.sendto.model.Member;
/**
 * 会员等级
 * 
 */
public class MemberserService {
		// 创建数据层访问类对象
		MemberserDao mem = new MemberserDao();
		// 创建日志对象
		Logger lo = Logger.getLogger("Doremind.class");

		/**
		 * 查询会员等级表
		 * @return 会员等级的集合
		 * @throws SQLException
		 */
		public List<Member> Reminder() throws SQLException {
			try {
				List<Member> list=mem.Memberd();
				if(list.size()>0){
					return list;
				}else {
					return null;
				}
			} catch (SQLException e) {
				lo.error("返回会员等级的集合出错");
				e.printStackTrace();
				throw e;
			}
		}
		
}
