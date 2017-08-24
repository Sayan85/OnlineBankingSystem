<!-- 
/*******************************************************************
* File name    :   Transfer.jsp
* Description  :   This jsp page displays the transferring amount details
* Functionality:   This jsp page displays the transferring amount details
* Models Used :    
* Restrictions:   
* Creation date:   19/11/2015
* Modifications:
* Author:          Group-6	    Date:  19/11/2015        
* Author_Initials     19-11-2015     Initial Version	
*****************************************************************/	
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Bank of Chennai</title>
<link rel="stylesheet" href="css/UserStyle.css" type="text/css" />
<script>
function validateAccNo()
{
	var transferfrom=document.user.transferfrom.value;
  	var transferto=document.user.transferto.value;
	var bankType = document.user.bank.value;
	
  	if(transferto==transferfrom)
	{
    	alert("Both the account numbers cannot be same. Please enter valid account number");
        return false;
	}
}
window.history.forward();
function noBack() 
{
	window.history.forward();
}
</script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<div id="container">
    <header>
    	<h1><a href="#">Bank of <span>Chennai</span></a></h1>
        <h2>Tradition of trust...</h2>
        <table align="right" style="font-size: small; float: right; margin-top: -80px">
			<tr><td>Welcome,</td></tr>
			<tr><td>${CustInfo.customerName }</td></tr>
			<tr><td><a href="showUserProfilePage.obj" class="button">Profile</a></td></tr>
			<tr><td><a href="signout.obj" class="button">Sign out</a></td></tr>
		</table>
    </header>
    <nav>
    	<ul>
        	<li><a href="home.obj">Home</a></li>
            <li class="start selected"><a href="transfer.obj">Transfer</a></li>
            <li><a href="showStatementsPage.obj">Statements</a></li>
            <li><a href="showServiceRequestPage.obj">Service Request</a></li>
            <li><a href="trackService.obj">Track Service</a></li>
            <li class="end"><a href="showChangeCommPage.obj">Change Communication</a></li>
        </ul>
    </nav>
	
	<div id="body">
		
		    <center>
		    <div class="" style="height: auto;">
		    	<br>
		    	<c:if test="${!empty Error}">
					<p align="center"><font color="red">${Error }</font></p>
					<c:set var="Error" value="" scope="session"></c:set>
				</c:if>
		    	<h2>Fund Transfer</h2>
		    	<h4><b>Account Balance</b> --- Rs. ${AccountInfo.accountBalance }</h4><br>
		    	
		    	<c:if test="${!empty NoPayee}">
			    	<c:set var="NoPayee" value="" scope="session"></c:set>
			    	You don't have any Payee. Please <a href="AddPayeeLink.obj">Add a Payee</a> to transfer amount to other account.
			    </c:if>
		    	
		    	<c:if test="${!empty PayeeAdded}">
			    	<c:set var="PayeeAdded" value="" scope="session"></c:set>
			    	<font color="green">Payee Successfully Added</font>
			    </c:if>
		    	
		    	<c:if test="${!empty SelectPayee}">
		    	<!-- Make a transfer -->
			    	<c:if test="${!empty PayeeList}">
				    	<form action="fundTransfer.obj" method="post">
				    		<table style="width: 500px" cellpadding="15px" cellspacing="15px">
				    			<tr>
				    				<td colspan="2" align="center"><h4>Make a Transfer</h4></td>
				    			</tr>
				    			<tr>
				    				<td>Payee List :</td>
				    				<td>
				    					<select name="payee" class="txtselectbox" required
				    					 oninvalid="this.setCustomValidity('Please select a Payee')"	
						    			 onchange="this.setCustomValidity('')">
				    						<option value="" disabled>-- Select --</option>
											<c:forEach var="list" items="${PayeeList }">
												<option value="${list.payeeAccountId }">${list.nickName} - ${list.payeeAccountId}</option>
											</c:forEach>		    				
				    					</select>
				    				</td>
				    			</tr>
				    			<tr>
				    				<td>Transfer Amount :</td>
				    				<td><input type="text" name="transferamount" class="txtbox" pattern="[1-9][0-9]{2,}([.][0-9]{2})?" required 
						    		oninvalid="this.setCustomValidity('Please enter a valid amount for transfer. Amount should be greater than 100 e.g. 210,210.50 and should not start with 0')"	
						    		onchange="this.setCustomValidity('')" placeholder="Enter Amount to Transfer"/></td>
				    			</tr>
				    			<tr>
				    				<td>Transaction Password :</td>
				    				<td><input type="password" name="transactionpassword" class="txtbox" pattern="[0-9 A-Z a-z]+" required 
						    		oninvalid="this.setCustomValidity('Please enter a valid alphanumeric transaction password.')"	
						    		onchange="this.setCustomValidity('')" placeholder="Enter Transaction Password" maxlength="15"/></td>
				    			</tr>
				    			<tr><td></td><td><input type="submit" value=" Pay " class="submit">&nbsp;&nbsp;<input type="reset" value="Reset" class="submit"></td></tr>
				    			<tr><td></td><td><input type="button" value=" Add Payee " class="submit" onclick="location.href='AddPayeeLink.obj'"></td></tr>
				    		</table>
				    	</form>
				    	<c:set var="PayeeList" value="" scope="session"></c:set>
				    	<c:set var="SelectPayee" value="" scope="session"></c:set>
			    	</c:if>
			    	
		    	</c:if>
		    	
		    	<c:if test="${!empty SuccessTransfer}">
					<p align="center"><font color="green">${SuccessTransfer}</font></p>
					<c:set var="SuccessTransfer" value="" scope="session"></c:set>
				</c:if>
		    	
		    	<c:if test="${!empty InvalidTP}">
					<p align="center"><font color="red">Invalid transaction password</font></p>
					<c:set var="InvalidTP" value="" scope="session"></c:set>
				</c:if>
		    	
		    	<c:if test="${!empty FailTransfer}">
					<p align="center"><font color="red">${FailTransfer }</font></p>
					<c:set var="FailTransfer" value="" scope="session"></c:set>
				</c:if>
				
				<c:if test="${!empty NotEnoughBalance}">
					<p align="center"><font color="red">${NotEnoughBalance }</font></p>
					<c:set var="NotEnoughBalance" value="" scope="session"></c:set>
				</c:if>
		    	
		    	<c:if test="${!empty AddPayee}">
		    	<c:set var="AddPayee" value="" scope="session"></c:set>
		    	<!-- Add Payee -->
		    	<form action="addNewPayee.obj" method="post">
		    		<table style="width: 500px" cellpadding="15px" cellspacing="15px">
		    			<tr><td colspan="2" align="center"><h4>Add a Payee</h4></td></tr>
		    			<tr>
		    				<td>Payee Account Number :</td>
		    				<td><input type="text" name="payeeAccountId" class="txtbox" pattern="[1-9][0-9]{9}" required="true" 
						    oninvalid="this.setCustomValidity('Please enter 10 digit account number to proceed')"
						    onchange="this.setCustomValidity('')" placeholder="Enter Payee Account Number" maxlength="10"/></td>
		    			</tr>
		    			<tr>
		    				<td>Payee Nick Name :</td>
		    				<td><input type="text" name="nickName" class="txtbox" pattern="[A-Z a-z 0-9]+" required="true"
		    				oninvalid="this.setCustomValidity('Please enter a nick name. It should not contain special characters')" 
						    onchange="this.setCustomValidity('')" placeholder="Enter Nick Name" maxlength="40"/></td>
		    			</tr>
		    			<tr><td></td><td><input type="submit" value=" Add Payee " class="submit">&nbsp;&nbsp;<input type="reset" value="Reset" class="submit"></td></tr>
		    		</table>
		    	</form>
		    	<c:if test="${!empty WrongURN}">
		    		<p align="center"><font color="red">${WrongURN }</font></p>
		    		<c:set var="WrongURN" value="" scope="session"></c:set>
		    	</c:if>
		    	</c:if>
		    	
		    	<c:if test="${!empty NotACustomer}">
					<p align="center"><font color="red">${NotACustomer }</font></p>
					<c:set var="NotACustomer" value="" scope="session"></c:set>
				</c:if>
		    	
		    	<c:if test="${!empty CheckURN}">
		    	<c:set var="CheckURN" value="" scope="session"></c:set>
		    	<!-- Confirm the Payee Account Number -->
		    	<form action="insertPayee.obj" method="post">
		    		<table style="width: 600px" cellpadding="15px" cellspacing="15px">
		    			<tr>
		    				<td colspan="2" align="center"><h4>Confirm Payee</h4></td>
		    			</tr>
		    			<tr><td>Enter URN Number :</td><td><input type="password" name="urn" class="txtbox" pattern="[0-9]{6}" required="true"
		    				oninvalid="this.setCustomValidity('Please enter 6 digits URN number')" 
						    onchange="this.setCustomValidity('')" placeholder="Enter URN number" maxlength="6" /></td></tr>
		    			<tr><td></td><td>(Please enter 6 digits URN number send to your mobile)</td></tr>
		    			<tr><td></td><td><input type="submit" value=" Confirm " class="submit">&nbsp;&nbsp;<input type="reset" value="Reset" class="submit"></td></tr>
		    		</table>
		    	</form>
		    	</c:if>
				
			</div>
		    </center>
	</div>
    <footer>
        <div class="footer-bottom">
            <p>Copyright&copy; 2015 Bank Of Chennai interactive. All rights reserved.</p>
         </div>
    </footer>
</div>
</body>
</html>