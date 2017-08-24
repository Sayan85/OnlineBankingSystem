package com.igate.obs.bean;

import org.springframework.stereotype.Component;

@Component
public class UserInfo {
	private long accountId;
	private String userId;
	private String loginPassword;
	private String secretQuestion;
	private String secretAnswer;
	private String transactionPassword;
	private String lockStatus;

	public UserInfo() {
	}

	public UserInfo(long accountId, String userId, String loginPassword,
			String secretQuestion, String secretAnswer,
			String transactionPassword, String lockStatus) {
		this.accountId = accountId;
		this.userId = userId;
		this.loginPassword = loginPassword;
		this.secretQuestion = secretQuestion;
		this.secretAnswer = secretAnswer;
		this.transactionPassword = transactionPassword;
		this.lockStatus = lockStatus;
	}

	public long getAccountId() {
		return this.accountId;
	}

	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}

	public String getUserId() {
		return this.userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLoginPassword() {
		return this.loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getSecretQuestion() {
		return this.secretQuestion;
	}

	public void setSecretQuestion(String secretQuestion) {
		this.secretQuestion = secretQuestion;
	}

	public String getSecretAnswer() {
		return this.secretAnswer;
	}

	public void setSecretAnswer(String secretAnswer) {
		this.secretAnswer = secretAnswer;
	}

	public String getTransactionPassword() {
		return this.transactionPassword;
	}

	public void setTransactionPassword(String transactionPassword) {
		this.transactionPassword = transactionPassword;
	}

	public String getLockStatus() {
		return this.lockStatus;
	}

	public void setLockStatus(String lockStatus) {
		this.lockStatus = lockStatus;
	}

	public String toString() {
		return "UserInfo [accountId=" + this.accountId + ", userId="
				+ this.userId + ", loginPassword=" + this.loginPassword
				+ ", secretQuestion=" + this.secretQuestion + ", secretAnswer="
				+ this.secretAnswer + ", transactionPassword="
				+ this.transactionPassword + ", lockStatus=" + this.lockStatus
				+ "]";
	}
}
