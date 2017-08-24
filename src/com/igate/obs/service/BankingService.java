package com.igate.obs.service;

import com.igate.obs.bean.AccountMaster;
import com.igate.obs.bean.CustomerInformation;
import com.igate.obs.bean.LoginRole;
import com.igate.obs.bean.PayeeTable;
import com.igate.obs.bean.ServiceTracker;
import com.igate.obs.bean.Transactions;
import com.igate.obs.bean.UserInfo;
import com.igate.obs.dao.IBankingDAO;
import com.igate.obs.exception.BankingException;
import com.igate.obs.service.IBankingService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BankingService implements IBankingService {
	@Autowired
	private IBankingDAO bankingDAO;

	public boolean isValidUser(String username, String password)
			throws BankingException {
		return this.bankingDAO.isValidUser(username, password);
	}

	public AccountMaster fetchAccountDetails(long accountId)
			throws BankingException {
		return this.bankingDAO.fetchAccountDetails(accountId);
	}

	public LoginRole checkRole(String username, String password)
			throws BankingException {
		return this.bankingDAO.checkRole(username, password);
	}

	public int insertNewUser(CustomerInformation customerinfo,
			UserInfo userInfo, String accOpenDate) throws BankingException {
		return this.bankingDAO.insertNewUser(customerinfo, userInfo, accOpenDate);
	}

	public boolean transferAccount(long transferAccount)
			throws BankingException {
		return this.bankingDAO.transferAccount(transferAccount);
	}

	public double getAvailableBalance(long accountNumber)
			throws BankingException {
		return this.bankingDAO.getAvailableBalance(accountNumber);
	}

	public int updateAccountBalance(long accId, double transferAmount)
			throws BankingException {
		return this.bankingDAO.updateAccountBalance(accId, transferAmount);
	}

	public UserInfo fetchAccountId(String userName, String password)
			throws BankingException {
		return this.bankingDAO.fetchAccountId(userName, password);
	}

	public int updateReceiverAccountBalance(long accId, double transferAmount)
			throws BankingException {
		return this.bankingDAO.updateReceiverAccountBalance(accId,
				transferAmount);
	}

	public int insertFundTransfer(long transferFrom, double transferAmount,
			long transferTo) throws BankingException {
		return this.bankingDAO.insertFundTransfer(transferFrom, transferAmount,
				transferTo);
	}

	public ArrayList<ServiceTracker> fetchServiceRequests(long accountId)
			throws BankingException {
		return this.bankingDAO.fetchServiceRequests(accountId);
	}

	public boolean checkServiceRequest(long accountId, String type)
			throws BankingException {
		return this.bankingDAO.checkServiceRequest(accountId, type);
	}

	public int insertServiceTracker(long accountId, String serviceType)
			throws BankingException {
		return this.bankingDAO.insertServiceTracker(accountId, serviceType);
	}

	public CustomerInformation fetchCustomerInfo(long accountId)
			throws BankingException {
		return this.bankingDAO.fetchCustomerInfo(accountId);
	}

	public boolean updateMobileNo(long accountId, String mobileno)
			throws BankingException {
		return this.bankingDAO.updateMobileNo(accountId, mobileno);
	}

	public boolean updateAddress(long accountId, String address)
			throws BankingException {
		return this.bankingDAO.updateAddress(accountId, address);
	}

	public ArrayList<AccountMaster> fetchAllAccountDetails()
			throws BankingException {
		return this.bankingDAO.fetchAllAccountDetails();
	}

	public ArrayList<Transactions> getAllTransactions(long accountId)
			throws BankingException {
		return this.bankingDAO.getAllTransactions(accountId);
	}

	public long getServiceRequestId(long accountId, String serviceType)
			throws BankingException {
		return this.bankingDAO.getServiceRequestId(accountId, serviceType);
	}

	public ArrayList<Transactions> getDetailedStatement(String startDate,
			String endDate, long accountId) throws BankingException {
		return this.bankingDAO.getDetailedStatement(startDate, endDate,
				accountId);
	}

	public ArrayList<Transactions> getMiniStatement(long accountId)
			throws BankingException {
		return this.bankingDAO.getMiniStatement(accountId);
	}

	public int rightAccIDUserID(long accountId, String userId)
			throws BankingException {
		return this.bankingDAO.rightAccIDUserID(accountId, userId);
	}

	public String fetchSecurityQuestion(long accountId, String userId)
			throws BankingException {
		return this.bankingDAO.fetchSecurityQuestion(accountId, userId);
	}

	public int updatePassword(String userid, String answer, String password)
			throws BankingException {
		return this.bankingDAO.updatePassword(userid, answer, password);
	}

	public List<PayeeTable> getAllPayee(long accountId) throws BankingException {
		return this.bankingDAO.getAllPayee(accountId);
	}

	public boolean insertPayee(PayeeTable payeeBean) throws BankingException {
		return this.bankingDAO.insertPayee(payeeBean);
	}

	public boolean checkTransactionPass(String pwd, long accID)
			throws BankingException {
		return this.bankingDAO.checkTransactionPass(pwd, accID);
	}
}
