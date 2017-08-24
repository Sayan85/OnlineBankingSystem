package com.igate.obs.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.igate.obs.bean.PayeeTable;

public class PayeeTableMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {

		PayeeTable payeeTable = new PayeeTable();

		payeeTable.setAccountId(rs.getLong(1));
		payeeTable.setPayeeAccountId(rs.getLong(2));
		payeeTable.setNickName(rs.getString(3));
		payeeTable.setUrn(rs.getInt(4));

		return payeeTable;
	}

}
