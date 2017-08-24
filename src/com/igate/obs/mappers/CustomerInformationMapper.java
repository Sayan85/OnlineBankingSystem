package com.igate.obs.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.igate.obs.bean.CustomerInformation;

public class CustomerInformationMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {

		CustomerInformation customerInformation = new CustomerInformation();

		customerInformation.setAccountId(rs.getLong(1));
		customerInformation.setCustomerName(rs.getString(2));
		customerInformation.setEmail(rs.getString(3));
		customerInformation.setGender(rs.getString(4));
		customerInformation.setDob(rs.getDate(5));
		customerInformation.setMobileNo(rs.getString(6));
		customerInformation.setAddress(rs.getString(7));
		customerInformation.setPancardNo(rs.getString(8));
		customerInformation.setAadharcardNo(rs.getString(9));

		return customerInformation;

	}

}
