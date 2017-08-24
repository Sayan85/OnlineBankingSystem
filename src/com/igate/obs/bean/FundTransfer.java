package com.igate.obs.bean;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class FundTransfer {
	private long fundTransferId;
	private long payeeAccountId;
	private Date dateOfTransfer;
	private double transferAmount;
	private long accountId;

	public FundTransfer() {
	}

	public long getFundTransferId() {
		return this.fundTransferId;
	}

	public void setFundTransferId(long fundTransferId) {
		this.fundTransferId = fundTransferId;
	}

	public long getPayeeAccountId() {
		return this.payeeAccountId;
	}

	public void setPayeeAccountId(long payeeAccountId) {
		this.payeeAccountId = payeeAccountId;
	}

	public Date getDateOfTransfer() {
		return this.dateOfTransfer;
	}

	public void setDateOfTransfer(Date dateOfTransfer) {
		this.dateOfTransfer = dateOfTransfer;
	}

	public double getTransferAmount() {
		return this.transferAmount;
	}

	public void setTransferAmount(double transferAmount) {
		this.transferAmount = transferAmount;
	}

	public long getAccountId() {
		return this.accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	public FundTransfer(long fundTransferId, long payeeAccountId,
			Date dateOfTransfer, double transferAmount, long accountId) {
		this.fundTransferId = fundTransferId;
		this.payeeAccountId = payeeAccountId;
		this.dateOfTransfer = dateOfTransfer;
		this.transferAmount = transferAmount;
		this.accountId = accountId;
	}

	public String toString() {
		return "FundTransfer [fundTransferId=" + this.fundTransferId
				+ ", payeeAccountId=" + this.payeeAccountId
				+ ", dateOfTransfer=" + this.dateOfTransfer
				+ ", transferAmount=" + this.transferAmount + ", accountId="
				+ this.accountId + "]";
	}
}
