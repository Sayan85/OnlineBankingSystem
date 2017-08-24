package com.igate.obs.bean;

import java.util.Date;
import org.springframework.stereotype.Component;

@Component
public class Transactions {
	private long accountId;
	private long transactionId;
	private String transcationDescription;
	private Date dateOfTransaction;
	private String transactionType;
	private double transactionAmount;

	public Transactions() {
	}

	public long getAccountId() {
		return this.accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	public long getTransactionId() {
		return this.transactionId;
	}

	public void setTransactionId(long transactionId) {
		this.transactionId = transactionId;
	}

	public String getTranscationDescription() {
		return this.transcationDescription;
	}

	public void setTranscationDescription(String transcationDescription) {
		this.transcationDescription = transcationDescription;
	}

	public Date getDateOfTransaction() {
		return this.dateOfTransaction;
	}

	public void setDateOfTransaction(Date dateOfTransaction) {
		this.dateOfTransaction = dateOfTransaction;
	}

	public String getTransactionType() {
		return this.transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public double getTransactionAmount() {
		return this.transactionAmount;
	}

	public void setTransactionAmount(double transactionAmount) {
		this.transactionAmount = transactionAmount;
	}

	public Transactions(long accountId, long transactionId,
			String transcationDescription, Date dateOfTransaction,
			String transactionType, double transactionAmount) {
		this.accountId = accountId;
		this.transactionId = transactionId;
		this.transcationDescription = transcationDescription;
		this.dateOfTransaction = dateOfTransaction;
		this.transactionType = transactionType;
		this.transactionAmount = transactionAmount;
	}

	public String toString() {
		return "Transactions [accountId=" + this.accountId + ", transactionId="
				+ this.transactionId + ", transcationDescription="
				+ this.transcationDescription + ", dateOfTransaction="
				+ this.dateOfTransaction + ", transactionType="
				+ this.transactionType + ", transactionAmount="
				+ this.transactionAmount + "]";
	}
}
