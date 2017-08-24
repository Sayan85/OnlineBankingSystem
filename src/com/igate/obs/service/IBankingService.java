package com.igate.obs.service;

import java.util.ArrayList;
import java.util.List;

import com.igate.obs.bean.AccountMaster;
import com.igate.obs.bean.CustomerInformation;
import com.igate.obs.bean.LoginRole;
import com.igate.obs.bean.PayeeTable;
import com.igate.obs.bean.ServiceTracker;
import com.igate.obs.bean.Transactions;
import com.igate.obs.bean.UserInfo;
import com.igate.obs.exception.BankingException;

public interface IBankingService {

	public boolean isValidUser(String username, String password)
			throws BankingException;

	public AccountMaster fetchAccountDetails(long accountId)
			throws BankingException;

	public LoginRole checkRole(String username, String password)
			throws BankingException;

	public int insertNewUser(CustomerInformation customerinfo,
			UserInfo userInfo, String accOpenDate) throws BankingException;

	public boolean transferAccount(long transferAccount)
			throws BankingException;

	public double getAvailableBalance(long accountNumber)
			throws BankingException;

	public int updateAccountBalance(long accId, double transferAmount)
			throws BankingException;

	public UserInfo fetchAccountId(String userName, String password)
			throws BankingException;

	public int updateReceiverAccountBalance(long accId, double transferAmount)
			throws BankingException;

	public int insertFundTransfer(long transferFrom, double transferAmount,
			long transferTo) throws BankingException;

	public ArrayList<ServiceTracker> fetchServiceRequests(long accountId)
			throws BankingException;

	public boolean checkServiceRequest(long accountId, String type)
			throws BankingException;

	public int insertServiceTracker(long accountId, String serviceType)
			throws BankingException;

	public CustomerInformation fetchCustomerInfo(long accountId)
			throws BankingException;

	public boolean updateMobileNo(long accountId, String mobileno)
			throws BankingException;

	public boolean updateAddress(long accountId, String address)
			throws BankingException;

	public ArrayList<AccountMaster> fetchAllAccountDetails()
			throws BankingException;

	public ArrayList<Transactions> getAllTransactions(long accountId)
			throws BankingException;

	public long getServiceRequestId(long accountId, String serviceType)
			throws BankingException;

	public ArrayList<Transactions> getDetailedStatement(String startDate,
			String endDate, long accountId) throws BankingException;

	public ArrayList<Transactions> getMiniStatement(long accountId)
			throws BankingException;

	public int rightAccIDUserID(long accountId, String userId)
			throws BankingException;

	public String fetchSecurityQuestion(long accountId, String userId)
			throws BankingException;

	public int updatePassword(String userid, String answer, String password)
			throws BankingException;

	public List<PayeeTable> getAllPayee(long accountId) throws BankingException;

	public boolean insertPayee(PayeeTable payeeBean) throws BankingException;

	public boolean checkTransactionPass(String pwd, long accID)
			throws BankingException;

}
