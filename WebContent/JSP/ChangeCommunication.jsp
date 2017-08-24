<!-- 
/*******************************************************************
* File name    :   ChangeCommunication.jsp
* Description  :   This jsp page helps the user in changing his/her
                   details in the bank database
* Functionality:   This jsp page helps the user in changing his/her
                   details in the bank database
* Models Used :    
* Restrictions:   
* Creation date:   19/11/2015)
* Modifications:
* Author:          Group-6	    Date:  19/11/2015        
* Author_Initials     19-11-2015     Initial Version	
*****************************************************************/	
-->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Bank of Chennai</title>
<link rel="stylesheet" href="css/UserStyle.css" type="text/css" />
<script type="text/javascript">
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
            <li><a href="transfer.obj">Transfer</a></li>
            <li><a href="showStatementsPage.obj">Statements</a></li>
            <li><a href="showServiceRequestPage.obj">Service Request</a></li>
            <li><a href="trackService.obj">Track Service</a></li>
            <li class="start selected"><a href="showChangeCommPage.obj">Change Communication</a></li>
        </ul>
    </nav>
	
    <div id="body">
		<center>
			<br>
			<br>
			<c:if test="${!empty Error}">
				<p align="center"><font color="red">${Error }</font></p>
				<c:set var="Error" value="" scope="session"></c:set>
			</c:if>
			<h2>Change Communication</h2>
			<table border="0" cellpadding="15px" align="center" cellspacing="15px">
				<tr>
					<td width="200px;">Name Of Account Holder</td>
					<td width="auto">:&nbsp;&nbsp;&nbsp;<label>${CustInfo.customerName}</label></td>
				</tr>
				<tr>
					<td>Account Number</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${AccountId}</label></td>
				</tr>
				<tr>
					<td>User Id</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${UserInfo.userId}</label></td>
				</tr>
				<tr>
					<td>Mobile Number</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${CustInfo.mobileNo}</label></td>
				</tr>
				<tr>
					<td>Current Address</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${CustInfo.address}</label></td>
				</tr>
			</table>
			<br>
			<form action="updateMobileNo.obj" method="post">
				<c:if test="${!empty Mobile}">
					<p align="center"><font color="green">${Mobile }</font></p>
					<c:set var="Mobile" value="" scope="session"></c:set>
				</c:if>
				<table cellpadding="15px" cellspacing="15px" style="border: 1px solid gray">
					<tr>
						<td width="300px;">Enter new Mobile Number to Update</td>
						<td>:&nbsp;&nbsp;&nbsp;<input type="text" class="txtbox" name="newmobileno" placeholder="Enter New Mobile Number" 
						required pattern="[9|8|7]{1}[0-9]{9}" maxlength="10"
						oninvalid="this.setCustomValidity('Mobile number should contain numbers(0-9) only and start with 7,8 or 9')" 
						onchange="this.setCustomValidity('')"></td>
					</tr>
					<tr>
						<td></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="submit" value=" Update Mobile No "></td>
					</tr>
				</table>
			</form>
			<br>
			<form action="updateAddress.obj" method="post">
				<c:if test="${!empty Address}">
					<p align="center"><font color="green">${Address }</font></p>
					<c:set var="Address" value="" scope="session"></c:set>
				</c:if>
				<table cellpadding="15px" cellspacing="15px" style="border: 1px solid gray">
					<tr>
						<td width="300px;">Enter new Address to Update</td>
						<td>:&nbsp;&nbsp;&nbsp;<textarea rows=3 cols=33 class="txtarea" name="newaddress" placeholder="Enter New Address"
						oninvalid="this.setCustomValidity('Please enter communication address')" 
						onchange="this.setCustomValidity('')" required></textarea></td>
					</tr>
					<tr>
						<td></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value=" Update Address " class="submit"></td>
					</tr>
				</table>
			</form>
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