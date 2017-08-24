package com.igate.obs.dao;

import com.igate.obs.bean.AccountMaster;
import com.igate.obs.bean.CustomerInformation;
import com.igate.obs.bean.LoginRole;
import com.igate.obs.bean.PayeeTable;
import com.igate.obs.bean.ServiceTracker;
import com.igate.obs.bean.Transactions;
import com.igate.obs.bean.UserInfo;
import com.igate.obs.dao.IBankingDAO;
import com.igate.obs.exception.BankingException;
import com.igate.obs.mappers.AccountMasterMapper;
import com.igate.obs.mappers.CustomerInformationMapper;
import com.igate.obs.mappers.LoginRoleMapper;
import com.igate.obs.mappers.PayeeTableMapper;
import com.igate.obs.mappers.ServiceTrackerMapper;
import com.igate.obs.mappers.TransactionsMapper;
import com.igate.obs.mappers.UserInfoMapper;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
@SuppressWarnings({ "deprecation", "unchecked", "rawtypes" })
public class BankingDAO extends JdbcDaoSupport implements IBankingDAO {
	@Autowired
	private DataSource myDataSource;

	LocalDate localDate = LocalDate.now();
	String date = localDate.getDayOfWeek().toString();

	@PostConstruct
	private void initialize() {
		this.setDataSource(this.myDataSource);
	}

	public boolean isValidUser(String username, String password)
			throws BankingException {
		String sql = "SELECT COUNT(*) FROM user_role WHERE user_id=? AND login_password=?";
		Object[] params = new Object[] { username, password };
		int count = this.getJdbcTemplate().queryForInt(sql, params);
		if (count > 0) {
			return true;
		}
		return false;
	}

	public AccountMaster fetchAccountDetails(long accountId)
			throws BankingException {
		String sql = "SELECT account_id,account_type,account_balance,open_date FROM account_master WHERE account_id=?";
		AccountMasterMapper mapper = new AccountMasterMapper();
		AccountMaster accountmaster = (AccountMaster) this.getJdbcTemplate()
				.queryForObject(sql, (RowMapper) mapper,
						new Object[] { accountId });
		return accountmaster;
	}

	public LoginRole checkRole(String username, String password)
			throws BankingException {
		String sql = "SELECT user_id,login_password,user_role FROM user_role WHERE user_id=? AND login_password=?";
		Object[] params = new Object[] { username, password };
		LoginRoleMapper mapper = new LoginRoleMapper();
		LoginRole loginrole = (LoginRole) this.getJdbcTemplate()
				.queryForObject(sql, (RowMapper) mapper, params);
		return loginrole;
	}

	public int insertNewUser(CustomerInformation customerinfo, UserInfo userInfo, String accOpenDate)
			throws BankingException {
		/*
		 * String sequenceAccSql = "SELECT seq_acc_id.nextval FROM dual"; long
		 * accountId = this.getJdbcTemplate().queryForLong(sequenceAccSql);
		 */
		/*
		 * String sequenceUserSql = "SELECT seq_user_id.nextval FROM dual"; long
		 * userIdSeq = this.getJdbcTemplate().queryForLong(sequenceUserSql);
		 * String userId = String.valueOf(customerinfo.getCustomerName()
		 * .substring(0, 2).toUpperCase()) + userIdSeq;
		 */
		String insertInsertUser = "INSERT INTO customer_information VALUES(?,?,?,?,?,?,?,?,?)";
		Object[] params1 = new Object[] { customerinfo.getAccountId(),
				customerinfo.getCustomerName(), customerinfo.getEmail(),
				customerinfo.getGender(), customerinfo.getDob().toString(),
				customerinfo.getMobileNo(), customerinfo.getAddress(),
				customerinfo.getPancardNo(), customerinfo.getAadharcardNo() };
		int insertedUser = this.getJdbcTemplate().update(insertInsertUser,
				params1);

		String insertUserInfo = "INSERT INTO user_info VALUES(?,?,?,?,?,?,'n')";
		Object[] params2 = new Object[] { userInfo.getAccountId(),
				userInfo.getUserId(), userInfo.getLoginPassword(),
				userInfo.getSecretQuestion(), userInfo.getSecretAnswer(),
				userInfo.getTransactionPassword() };
		int insertedInfo = this.getJdbcTemplate().update(insertUserInfo,
				params2);
		
		String insertAccMaster = "INSERT INTO account_master VALUES(?,'Savings',0,?)";
		int insertedAccMaster = this.getJdbcTemplate().update(insertAccMaster,
				new Object[] { customerinfo.getAccountId(), accOpenDate });
		String insertUserRole = "INSERT INTO user_role VALUES(?,?,'user')";
		Object[] params3 = new Object[] { userInfo.getUserId(),
				userInfo.getLoginPassword() };
		int insertedUserRole = this.getJdbcTemplate().update(insertUserRole,
				params3);
		return 1;
	}

	public boolean transferAccount(long transferAccount)
			throws BankingException {
		String sql = "SELECT COUNT(*) FROM account_master where account_id=?";
		int count = this.getJdbcTemplate().queryForInt(sql,
				new Object[] { transferAccount });
		if (count > 0) {
			return true;
		}
		return false;
	}

	public double getAvailableBalance(long accountNumber)
			throws BankingException {
		String sql = "SELECT account_id,account_type,account_balance,open_date FROM account_master WHERE account_id=?";
		AccountMaster avlBal = (AccountMaster) this.getJdbcTemplate()
				.queryForObject(sql, (RowMapper) new AccountMasterMapper(),
						new Object[] { accountNumber });
		return avlBal.getAccountBalance();
	}

	public int updateAccountBalance(long accId, double transferAmount)
			throws BankingException {
		String description = "Account was debited with " + transferAmount;
		String type = "Debit";
		Object[] params = new Object[] { accId, description, type,
				transferAmount };
		if ("SATURDAY".equals(this.date)) {
			int count = this
					.getJdbcTemplate()
					.update("INSERT INTO transactions VALUES(?,seq_trans_id.nextval,?,NEXT_DAY(SYSDATE,'monday'),?,?)",
							params);
		} else if ("SUNDAY".equals(this.date)) {
			int count = this
					.getJdbcTemplate()
					.update("INSERT INTO transactions VALUES(?,seq_trans_id.nextval,?,NEXT_DAY(SYSDATE,'monday'),?,?)",
							params);
		} else {
			int count = this
					.getJdbcTemplate()
					.update("INSERT INTO transactions VALUES(?,seq_trans_id.nextval,?,SYSDATE,?,?)",
							params);
		}
		int updateBal = this
				.getJdbcTemplate()
				.update("UPDATE account_master SET account_balance=account_balance-? WHERE account_id=?",
						new Object[] { transferAmount, accId });
		if (updateBal > 0) {
			return updateBal;
		}
		return 0;
	}

	public UserInfo fetchAccountId(String userName, String password)
			throws BankingException {
		String sql = "SELECT account_id,user_id,login_password,secret_question,secret_answer,transaction_password,lock_status FROM user_info WHERE user_id=? AND login_password=?";
		Object[] params = new Object[] { userName, password };
		UserInfo uInfo = (UserInfo) this.getJdbcTemplate().queryForObject(sql,
				(RowMapper) new UserInfoMapper(), params);
		return uInfo;
	}

	public int updateReceiverAccountBalance(long accId, double transferAmount)
			throws BankingException {
		int count = 0;
		String description = "Account was credited with " + transferAmount;
		String type = "Credit";
		String insertSql = "SATURDAY".equals(this.date) ? "INSERT INTO transactions VALUES(?,seq_trans_id.nextval,?,NEXT_DAY(SYSDATE,'monday'),?,?)"
				: ("SUNDAY".equals(this.date) ? "INSERT INTO transactions VALUES(?,seq_trans_id.nextval,?,NEXT_DAY(SYSDATE,'monday'),?,?)"
						: "INSERT INTO transactions VALUES(?,seq_trans_id.nextval,?,SYSDATE,?,?)");
		Object[] params = new Object[] { accId, description, type,
				transferAmount };
		count = this.getJdbcTemplate().update(insertSql, params);
		String sql = "UPDATE account_master SET account_balance=account_balance+? WHERE account_id=?";
		Object[] param = new Object[] { transferAmount, accId };
		count = this.getJdbcTemplate().update(sql, param);
		return count;
	}

	public int insertFundTransfer(long transferFrom, double transferAmount,
			long transferTo) throws BankingException {
		int count = 0;
		String insertSql = "SATURDAY".equals(this.date) ? "INSERT INTO fund_transfer VALUES(?,seq_service_id.nextval,?,NEXT_DAY(SYSDATE,'monday'),?)"
				: ("SUNDAY".equals(this.date) ? "INSERT INTO fund_transfer VALUES(?,seq_service_id.nextval,?,NEXT_DAY(SYSDATE,'monday'),?)"
						: "INSERT INTO fund_transfer VALUES(?,seq_service_id.nextval,?,sysdate,?)");
		Object[] params = new Object[] { transferFrom, transferTo,
				transferAmount };
		count = this.getJdbcTemplate().update(insertSql, params);
		return count;
	}

	public ArrayList<ServiceTracker> fetchServiceRequests(long accountId)
			throws BankingException {
		String sql = "SELECT account_id,service_id,service_description,service_raised_date,service_status FROM service_tracker WHERE account_id=?";
		ServiceTrackerMapper mapper = new ServiceTrackerMapper();
		ArrayList serviceList = (ArrayList) this.getJdbcTemplate().query(sql,
				(RowMapper) mapper, new Object[] { accountId });
		return serviceList;
	}

	public boolean checkServiceRequest(long accountId, String type)
			throws BankingException {
		String sql = "SELECT COUNT(*) FROM service_tracker WHERE account_id=? AND SERVICE_DESCRIPTION=?";
		Object[] params = new Object[] { accountId, type };
		int iStatus = getJdbcTemplate().queryForInt(sql, params);
		if (iStatus > 0) {
			return false;
		}
		return true;
	}

	public int insertServiceTracker(long accountId, String serviceType)
			throws BankingException {
		String sequenceSql = "SELECT seq_service_id.NEXTVAL FROM DUAL";
		int serviceId = this.getJdbcTemplate().queryForInt(sequenceSql);
		String sql = "INSERT INTO service_tracker VALUES(?,?,?,sysdate,'Requested')";
		Object[] params = new Object[] { accountId, serviceId, serviceType };
		return this.getJdbcTemplate().update(sql, params);
	}

	public CustomerInformation fetchCustomerInfo(long accountId)
			throws BankingException {
		String sql = "SELECT account_id,customer_name,email,gender,dob,mobile_no,address,pancard_no,aadharcard_no FROM customer_information WHERE account_id=?";
		CustomerInformation custInfo = (CustomerInformation) this
				.getJdbcTemplate().queryForObject(sql,
						(RowMapper) new CustomerInformationMapper(),
						new Object[] { accountId });
		return custInfo;
	}

	public boolean updateMobileNo(long accountId, String mobileno)
			throws BankingException {
		boolean flag = false;
		String sql = "UPDATE customer_information SET mobile_no=? WHERE account_id=?";
		Object[] params = new Object[] { mobileno, accountId };
		int iStatus = this.getJdbcTemplate().update(sql, params);
		if (iStatus > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean updateAddress(long accountId, String address)
			throws BankingException {
		boolean flag = false;
		String sql = "UPDATE customer_information SET address=? WHERE account_id=?";
		Object[] params = new Object[] { address, accountId };
		int iStatus = this.getJdbcTemplate().update(sql, params);
		if (iStatus > 0) {
			flag = true;
		}
		return flag;
	}

	public ArrayList<AccountMaster> fetchAllAccountDetails()
			throws BankingException {
		String sql = "SELECT account_id,account_type,account_balance,open_date FROM account_master ORDER BY account_id";
		ArrayList accountMaster = (ArrayList) this.getJdbcTemplate().query(sql,
				(RowMapper) new AccountMasterMapper());
		return accountMaster;
	}

	public ArrayList<Transactions> getAllTransactions(long accountId)
			throws BankingException {
		ArrayList getalltransactions = new ArrayList();
		String sql = "SELECT account_id,transaction_id,transaction_description,date_of_transaction,transaction_type,transaction_amount FROM transactions WHERE account_id=? ORDER BY date_of_transaction DESC";
		getalltransactions = (ArrayList) this.getJdbcTemplate().query(sql,
				(RowMapper) new TransactionsMapper(),
				new Object[] { accountId });
		return getalltransactions;
	}

	public long getServiceRequestId(long accountId, String serviceType)
			throws BankingException {
		String sql = "SELECT service_id FROM service_tracker WHERE account_id=? AND service_description=?";
		Object[] params = new Object[] { accountId, serviceType };
		long serviceId = this.getJdbcTemplate().queryForLong(sql, params);
		return serviceId;
	}

	public ArrayList<Transactions> getDetailedStatement(String startDate,
			String endDate, long accountId) throws BankingException {
		String[] dateSplit = endDate.split("-");
		int day = Integer.parseInt(dateSplit[2]) + 1;
		String date = String.valueOf(dateSplit[0]) + "-" + dateSplit[1] + "-"
				+ day;
		Object[] params = new Object[] { accountId, Date.valueOf(startDate),
				Date.valueOf(date) };
		ArrayList detailedStatement = new ArrayList();
		String sql = "SELECT account_id,transaction_id,transaction_description,date_of_transaction,transaction_type,transaction_amount FROM transactions WHERE account_id=? AND date_of_transaction BETWEEN ? AND ? ";
		detailedStatement = (ArrayList) this.getJdbcTemplate().query(sql,
				(RowMapper) new TransactionsMapper(), params);
		return detailedStatement;
	}

	public ArrayList<Transactions> getMiniStatement(long accountId)
			throws BankingException {
		String sql = "SELECT account_id,transaction_id,transaction_description,date_of_transaction,transaction_type,transaction_amount FROM transactions WHERE account_id=? AND rownum <=11 order by date_of_transaction DESC";
		ArrayList miniStatement = (ArrayList) this.getJdbcTemplate().query(sql,
				(RowMapper) new TransactionsMapper(),
				new Object[] { accountId });
		return miniStatement;
	}

	public int rightAccIDUserID(long accountId, String userId)
			throws BankingException {
		String sql = "SELECT Count(*) FROM user_info WHERE account_id=? AND user_id=?";
		Object[] params = new Object[] { accountId, userId };
		int count = this.getJdbcTemplate().queryForInt(sql, params);
		return count;
	}

	public String fetchSecurityQuestion(long accountId, String userId)
			throws BankingException {
		String sql = "SELECT secret_question FROM user_info WHERE account_id=? AND user_id=?";
		Object[] params = new Object[] { accountId, userId };
		String securityQuestion = (String) this.getJdbcTemplate()
				.queryForObject(sql, params, String.class);
		return securityQuestion;
	}

	public int updatePassword(String userid, String answer, String password)
			throws BankingException {
		String sql = "SELECT secret_answer from user_info where user_id=?";
		String secretAns = (String) this.getJdbcTemplate().queryForObject(sql,
				String.class, new Object[] { userid });
		int status = 0;
		int iStatus = 0;
		if (secretAns.equals(answer)) {
			String updateQuery = "UPDATE user_info SET login_password=? WHERE user_id=?";
			Object[] params = new Object[] { password, userid };
			iStatus = this.getJdbcTemplate().update(updateQuery, params);
			String update = "UPDATE user_role SET login_password=? WHERE user_id=?";
			Object[] param = new Object[] { password, userid };
			status = this.getJdbcTemplate().update(update, param);
		}
		if (iStatus > 0 && status > 0) {
			return 1;
		}
		return 0;
	}

	public List<PayeeTable> getAllPayee(long accountId) throws BankingException {
		String sql = "SELECT ACCOUNT_ID,PAYEE_ACCOUNT_ID,NICK_NAME FROM payee_table WHERE ACCOUNT_ID=?";
		PayeeTableMapper mapper = new PayeeTableMapper();
		List payeeList = this.getJdbcTemplate().query(sql, (RowMapper) mapper,
				new Object[] { accountId });
		return payeeList;
	}

	public boolean insertPayee(PayeeTable payeeBean) throws BankingException {
		boolean flag = false;
		long accountId = payeeBean.getAccountId();
		long payeeAccId = payeeBean.getPayeeAccountId();
		String nickName = payeeBean.getNickName();
		String sql = "INSERT INTO payee_table VALUES(?,?,?)";
		Object[] params = new Object[] { accountId, payeeAccId, nickName };
		int count = this.getJdbcTemplate().update(sql, params);
		if (count > 0) {
			flag = true;
		}
		return flag;
	}

	public boolean checkTransactionPass(String pwd, long accID)
			throws BankingException {
		String sql = "SELECT COUNT(*) FROM user_info WHERE account_id=? AND TRANSACTION_PASSWORD=?";
		Object[] params = new Object[] { accID, pwd };
		int count = this.getJdbcTemplate().queryForInt(sql, params);
		if (count > 0) {
			return true;
		}
		return false;
	}
}
