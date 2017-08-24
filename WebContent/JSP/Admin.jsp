<!-- 
/*******************************************************************
* File Name      : Admin.jsp		
* Description    : This jsp page displays the admin page that displays 
                   transactions of account holders and to add new user.
* Functionality:   This jsp page displays the admin page that displays 
                   transactions of account holders and to add new user.
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
        	<li class="start selected"><a href="showAdminHomePage.obj">Admin Home</a></li>
            <li><a href="#">View Transactions</a></li>
            <li><a href="showCustRegistrationPage.obj">Add Customer</a></li>
            <li><a href="signout.obj">Log out</a></li>
        </ul>
    </nav>
    <div id="body">
	    <center>
			<div class="admincontent1">
			<c:if test="${!empty NoAccount}">
				<p>There are no accounts to display</p>
				<p>Please <a href="showCustRegistrationPage.obj">Register a Customer</a></p>
			</c:if>
			<c:if test="${empty NoAccount}">
				<h2>Details of all Account Holders</h2>
				<br><br>
				<table cellpadding="15px" cellspacing="15px">
					<tr>
						<td align="center"><h4>Account ID</h4></td>
						<td align="center"><h4>Account Type</h4></td>
						<td align="center"><h4>Account balance</h4></td>
						<td align="center"><h4>Account opening date</h4></td>
					</tr>
					<%-- Using JSTL --%>
				 	<c:forEach var="d" items="${AccountList}">
				     <tr>
						<td align="center"><a href="viewTransactions.obj?id=${d.accountId}">${d.accountId}</a></td> 
						<td align="center">${d.accountType}</td>
						<td align="center">${d.accountBalance}</td>
						<td align="center">${d.openDate}</td>
					</tr>
		 			</c:forEach>
				</table>
			</c:if>
			</div>
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