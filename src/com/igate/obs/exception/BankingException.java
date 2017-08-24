package com.igate.obs.exception;

public class BankingException extends Exception {
	private static final long serialVersionUID = 1;
	private String message;

	@Override
	public String getMessage() {
		return this.message;
	}

	public BankingException() {
	}

	public BankingException(String message) {
		this.message = message;
	}
}
