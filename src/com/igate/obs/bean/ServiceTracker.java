package com.igate.obs.bean;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class ServiceTracker {
	private long accountId;
	private long serviceId;
	private String serviceDescription;
	private Date serviceRaisedDate;
	private String serviceStatus;

	public ServiceTracker() {
	}

	public ServiceTracker(long accountId, long serviceId,
			String serviceDescription, Date serviceRaisedDate,
			String serviceStatus) {
		this.accountId = accountId;
		this.serviceId = serviceId;
		this.serviceDescription = serviceDescription;
		this.serviceRaisedDate = serviceRaisedDate;
		this.serviceStatus = serviceStatus;
	}

	public long getAccountId() {
		return this.accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	public long getServiceId() {
		return this.serviceId;
	}

	public void setServiceId(long serviceId) {
		this.serviceId = serviceId;
	}

	public String getServiceDescription() {
		return this.serviceDescription;
	}

	public void setServiceDescription(String serviceDescription) {
		this.serviceDescription = serviceDescription;
	}

	public Date getServiceRaisedDate() {
		return this.serviceRaisedDate;
	}

	public void setServiceRaisedDate(Date serviceRaisedDate) {
		this.serviceRaisedDate = serviceRaisedDate;
	}

	public String getServiceStatus() {
		return this.serviceStatus;
	}

	public void setServiceStatus(String serviceStatus) {
		this.serviceStatus = serviceStatus;
	}

	public String toString() {
		return "ServiceTracker [accountId=" + this.accountId + ", serviceId="
				+ this.serviceId + ", serviceDescription="
				+ this.serviceDescription + ", serviceRaisedDate="
				+ this.serviceRaisedDate + ", serviceStatus="
				+ this.serviceStatus + "]";
	}
}
