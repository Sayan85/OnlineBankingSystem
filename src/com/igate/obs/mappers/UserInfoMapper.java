package com.igate.obs.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.igate.obs.bean.UserInfo;

public class UserInfoMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {
		UserInfo userInfo = new UserInfo();
		userInfo.setAccountId(rs.getLong(1));
		userInfo.setUserId(rs.getString(2));
		userInfo.setLoginPassword(rs.getString(3));
		userInfo.setSecretQuestion(rs.getString(4));
		userInfo.setSecretAnswer(rs.getString(5));
		userInfo.setTransactionPassword(rs.getString(6));
		userInfo.setLockStatus(rs.getString(7));
		return userInfo;
	}
}
