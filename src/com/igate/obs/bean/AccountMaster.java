package com.igate.obs.bean;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class AccountMaster {
	private long accountId;
	private String accountType;
	private double accountBalance;
	private Date openDate;

	public AccountMaster() {
	}

	public AccountMaster(long accountId, String accountType,
			double accountBalance, Date openDate) {
		this.accountId = accountId;
		this.accountType = accountType;
		this.accountBalance = accountBalance;
		this.openDate = openDate;
	}

	public long getAccountId() {
		return this.accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	public String getAccountType() {
		return this.accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public double getAccountBalance() {
		return this.accountBalance;
	}

	public void setAccountBalance(double accountBalance) {
		this.accountBalance = accountBalance;
	}

	public Date getOpenDate() {
		return this.openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
	}

	public String toString() {
		return "AccountMaster [accountId=" + this.accountId + ", accountType="
				+ this.accountType + ", accountBalance=" + this.accountBalance
				+ ", openDate=" + this.openDate + "]";
	}
}
