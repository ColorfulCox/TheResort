package cn.sendto.rowmapper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface IRowMapper<T> {
	public T rowMapper(Connection conn,ResultSet rs) throws SQLException;
}
