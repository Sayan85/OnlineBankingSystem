<!-- 
/*******************************************************************
* File name    :   UserHome.jsp
* Description  :   This jsp page displays the home page for user
* Functionality:   This jsp page displays the home page for user
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
        	<li class="start selected"><a href="home.obj">Home</a></li>
            <li><a href="transfer.obj">Transfer</a></li>
            <li><a href="showStatementsPage.obj">Statements</a></li>
            <li><a href="showServiceRequestPage.obj">Service Request</a></li>
            <li><a href="trackService.obj">Track Service</a></li>
            <li class="end"><a href="showChangeCommPage.obj">Change Communication</a></li>
        </ul>
    </nav>
	
    <div id="body">
		<div class="welcomeuser">
			
			<center>
			<br>
			<c:if test="${!empty Error}">
				<p align="center"><font color="red">${Error }</font></p>
				<c:set var="Error" value="" scope="session"></c:set>
			</c:if>
			<br>
			<h4><b>Account Balance</b> --- Rs. ${AccountInfo.accountBalance }</h4><br>
			<br>
			<h4><b>Account Type</b> --- ${AccountInfo.accountType } Account</h4>
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