package com.igate.obs.bean;

import java.sql.Date;
import org.springframework.stereotype.Component;

@Component
public class CustomerInformation {
	private long accountId;
	private String customerName;
	private String email;
	private String gender;
	private Date dob;
	private String mobileNo;
	private String address;
	private String pancardNo;
	private String aadharcardNo;

	public long getAccountId() {
		return this.accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMobileNo() {
		return this.mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPancardNo() {
		return this.pancardNo;
	}

	public void setPancardNo(String pancardNo) {
		this.pancardNo = pancardNo;
	}

	public String getAadharcardNo() {
		return this.aadharcardNo;
	}

	public void setAadharcardNo(String aadharcardNo) {
		this.aadharcardNo = aadharcardNo;
	}

	public Date getDob() {
		return this.dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public String toString() {
		return "CustomerInformation [accountId=" + this.accountId
				+ ", customerName=" + this.customerName + ", email="
				+ this.email + ", gender=" + this.gender + ", dob=" + this.dob
				+ ", mobileNo=" + this.mobileNo + ", address=" + this.address
				+ ", pancardNo=" + this.pancardNo + ", aadharcardNo="
				+ this.aadharcardNo + "]";
	}

	public CustomerInformation() {
	}

	public CustomerInformation(long accountId, String customerName,
			String email, String gender, Date dob, String mobileNo,
			String address, String pancardNo, String aadharcardNo) {
		this.accountId = accountId;
		this.customerName = customerName;
		this.email = email;
		this.gender = gender;
		this.dob = dob;
		this.mobileNo = mobileNo;
		this.address = address;
		this.pancardNo = pancardNo;
		this.aadharcardNo = aadharcardNo;
	}
}
