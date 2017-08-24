package com.igate.obs.bean;

import org.springframework.stereotype.Component;

@Component
public class PayeeTable {
	private long accountId;
	private long payeeAccountId;
	private String nickName;
	private int urn;

	public PayeeTable() {
	}

	public long getAccountId() {
		return this.accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	public long getPayeeAccountId() {
		return this.payeeAccountId;
	}

	public void setPayeeAccountId(long payeeAccountId) {
		this.payeeAccountId = payeeAccountId;
	}

	public String getNickName() {
		return this.nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getUrn() {
		return this.urn;
	}

	public void setUrn(int urn) {
		this.urn = urn;
	}

	public PayeeTable(long accountId, long payeeAccountId, String nickName,
			int urn) {
		this.accountId = accountId;
		this.payeeAccountId = payeeAccountId;
		this.nickName = nickName;
		this.urn = urn;
	}

	public String toString() {
		return "PayeeTable [accountId=" + this.accountId + ", payeeAccountId="
				+ this.payeeAccountId + ", nickName=" + this.nickName
				+ ", urn=" + this.urn + "]";
	}
}
