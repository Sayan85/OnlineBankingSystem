package com.igate.obs.mappers;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.igate.obs.bean.ServiceTracker;

public class ServiceTrackerMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int line) throws SQLException {

		ServiceTracker serviceTracker = new ServiceTracker();

		serviceTracker.setAccountId(rs.getLong(1));
		serviceTracker.setServiceId(rs.getLong(2));
		serviceTracker.setServiceDescription(rs.getString(3));
		serviceTracker.setServiceRaisedDate(rs.getDate(4));
		serviceTracker.setServiceStatus(rs.getString(5));

		return serviceTracker;
	}

}
