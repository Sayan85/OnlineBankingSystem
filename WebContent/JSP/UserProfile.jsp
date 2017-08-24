<!-- 
/*******************************************************************
* File name    :   UserProfile.jsp
* Description  :   This jsp page displays the profile details of user
                   stored in bank database
* Functionality:   This jsp page displays the profile details of user
                   stored in bank database
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
            <li><a href="showChangeCommPage.obj">Change Communication</a></li>
        </ul>
    </nav>
	
    <div id="body">
    <div class="content1">
		<center>
			<br>
			<br>
			<h2>Profile</h2><br>
			<table cellpadding="15px" cellspacing="15px">
				<tr>
					<td width="200px;">Account Number</td>
					<td width="auto">:&nbsp;&nbsp;&nbsp;<label>${AccountId}</label></td>
				</tr>
				<tr>
					<td>User Id</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${UserInfo.userId}</label></td>
				</tr>
				<tr>
					<td>Name Of Account Holder</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${CustInfo.customerName}</label></td>
				</tr>
				<tr>
					<td>Email ID</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${CustInfo.email}</label></td>
				</tr>
				<tr>
					<td>Mobile Number</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${CustInfo.mobileNo}</label></td>
				</tr>
				<tr>
					<td>Date of Birth</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${CustInfo.dob}</label></td>
				</tr>
				<tr>
					<td>Current Address</td>
					<td>:&nbsp;&nbsp;&nbsp;<label>${CustInfo.address}</label></td>
				</tr>
			</table>
		</center>
	</div>
    </div>
    <footer>
        <div class="footer-bottom">
            <p>Copyright&copy; 2015 Bank Of Chennai interactive. All rights reserved.</p>
         </div>
    </footer>
</div>
</body>
</html>