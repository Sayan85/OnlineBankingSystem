package com.igate.obs.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.igate.obs.bean.LoginRole;

public class LoginRoleMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {
		LoginRole loginRole = new LoginRole();
		loginRole.setUserId(rs.getString(1));
		loginRole.setLoginPassword(rs.getString(2));
		loginRole.setUserRole(rs.getString(3));
		return loginRole;
	}
}
