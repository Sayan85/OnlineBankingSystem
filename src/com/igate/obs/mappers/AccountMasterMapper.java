package com.igate.obs.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.igate.obs.bean.AccountMaster;

public class AccountMasterMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {
		AccountMaster accountMaster = new AccountMaster();
		accountMaster.setAccountId(rs.getLong(1));
		accountMaster.setAccountType(rs.getString(2));
		accountMaster.setAccountBalance(rs.getDouble(3));
		accountMaster.setOpenDate(rs.getDate(4));
		return accountMaster;
	}

}
