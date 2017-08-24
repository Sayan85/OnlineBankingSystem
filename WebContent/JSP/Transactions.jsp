<!-- 
/*******************************************************************
* File name    :   Transactions.jsp
* Description  :   This jsp page displays the transactions of user
                   and displays the same for admin 
* Functionality:   This jsp page displays the transactions of user
                   and displays the same for admin 
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
<link rel="stylesheet" href="css/AdminStyle.css" type="text/css" />
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
    </header>
    <nav>
    	<ul>
        	<li><a href="showAdminHomePage.obj">Admin Home</a></li>
            <li class="start selected"><a href="#">View Transactions</a></li>
            <li><a href="showCustRegistrationPage.obj">Add Customer</a></li>
            <li><a href="signout.obj">Log out</a></li>
        </ul>
    </nav>
    <div id="body">
	    <center>
			<div class="admincontent1">
			<h4>Transactions for account id "${Id}"</h4>
			<br><br>
			<c:if test="${!empty Status}">
			<%-- <c:set var="Status" value="" scope="session" /> --%>
			<table cellpadding="15px" cellspacing="15px">
				<tr>
					<td align="center"><h4>Account ID</h4></td>
					<td align="center"><h4>Transaction ID</h4></td>
					<td align="center"><h4>Transaction Description</h4></td>
					<td align="center"><h4>Date of Transaction</h4></td>
					<td align="center"><h4>Transaction Type</h4></td>
					<td align="center"><h4>Transaction Amount</h4></td>
				</tr>
				<%-- Using JSTL --%>
			 	<c:forEach var="t" items="${Transactions}">
			     <tr>
					<td align="center">${t.accountId}</td> 
					<td align="center">${t.transactionId}</td>
					<td align="center">${t.transcationDescription}
					<td align="center">${t.dateOfTransaction}</td>
					<td align="center">${t.transactionType}</td>
					<td align="center">${t.transactionAmount}</td>
				</tr>
			  	</c:forEach>
			</table>
			</c:if>
			<c:if test="${empty Status}">
				<h4>There are no transaction to display</h4>
			</c:if>
			</div>
			<c:if test="${!empty Error}">
				<p align="center"><font color="red">${Error }</font></p>
				<c:set var="Error" value="" scope="session"></c:set>
			</c:if>
		 	<div class="clear"></div>
	 	</center>
    </div>
     
 
    <footer>
        <div class="footer-bottom">
            <p>Copyright&copy; 2015 Bank Of Chennai interactive. All rights reserved.</p>
         </div>
    </footer> 
</body>
</html>