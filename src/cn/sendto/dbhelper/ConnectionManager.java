package cn.sendto.dbhelper;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionManager {
	
	private static String driver;
	private static String dburl;
	private static String user;
	private static String password;
	/**
	 * 加载驱动
	 */
	static {
		// 创建Properties类对象
		Properties prop = new Properties();
		// 输入流
		InputStream in = ConnectionManager.class.getClassLoader()
				.getResourceAsStream("dbconfig.properties");

		try {
			// 加载输入流
			prop.load(in);

			driver = prop.getProperty("driver");
			dburl = prop.getProperty("dburl");
			user = prop.getProperty("user");
			password = prop.getProperty("password");

			in.close();

		} catch (IOException e1) {
			e1.printStackTrace();
			System.err.println("读取配置文件出错。");
		}

		try {
			if (driver.equals("")) {
				Class.forName("com.mysql.jdbc.Driver");
			} else {
				Class.forName(driver);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("加载数据库驱动出错。");
		}
	}

	/**
	 * 创建数据库连接对象
	 * 
	 * @return 返回连接对象
	 * @throws SQLException
	 */
	public static Connection getConnection(){
		try {
			if (!dburl.equals("") && !user.equals("") && !password.equals("")) {
				return DriverManager.getConnection(dburl, user, password);
			} else {
				return DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/theresort", "root", "root");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 关闭当前连接对象
	 * 
	 * @param conn
	 */
	public static void close(Connection conn) {
		try {
			if (conn != null || !conn.isClosed()) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}
}
