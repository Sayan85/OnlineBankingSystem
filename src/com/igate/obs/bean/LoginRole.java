package com.igate.obs.bean;

import org.springframework.stereotype.Component;

@Component
public class LoginRole {
	private String userId;
	private String loginPassword;
	private String userRole;

	public LoginRole() {
	}

	public LoginRole(String userId, String loginPassword, String userRole) {
		this.userId = userId;
		this.loginPassword = loginPassword;
		this.userRole = userRole;
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

	public String getUserRole() {
		return this.userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String toString() {
		return "LoginRole [userId=" + this.userId + ", loginPassword="
				+ this.loginPassword + ", userRole=" + this.userRole + "]";
	}
}
