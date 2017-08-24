package com.igate.obs.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.igate.obs.bean.Transactions;

public class TransactionsMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {

		Transactions transactions = new Transactions();

		transactions.setAccountId(rs.getLong(1));
		transactions.setTransactionId(rs.getLong(2));
		transactions.setTranscationDescription(rs.getString(3));
		transactions.setDateOfTransaction(rs.getDate(4));
		transactions.setTransactionType(rs.getString(5));
		transactions.setTransactionAmount(rs.getDouble(6));

		return transactions;
	}

}
