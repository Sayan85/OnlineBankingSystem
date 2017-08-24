<!-- 
/*******************************************************************
* File name    :   TrackService.jsp
* Description  :   This jsp page allows user to track services
* Functionality:   This jsp page allows user to track services
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
            <li class="start selected"><a href="trackService.obj">Track Service</a></li>
            <li><a href="showChangeCommPage.obj">Change Communication</a></li>
        </ul>
    </nav>
	
    <div id="body">
    <div class="content1">
    <center>
    	<br>
    	<br>
    	<h2>Track Service Requests</h2><br>
    	
    	<c:if test="${empty ServiceList}">
    		<br>
    		<br>
    		<p align="center"><font color="green">You have no service pending</font></p>
    	</c:if>
    	<c:if test="${!empty ServiceList}">
		<form name="frm">
			<table class="requestchequetable" cellpadding="10px">
				<tr>
				<th width="200px"><u>Service id</u></th>
				<th width="200px"><u>Service Description</u></th>
				<th width="200px"><u>Service Raised Date</u></th>
				<th width="200px"><u>Service Status</u></th>
				</tr>
				<tr><td colspan="4"><br></td></tr>
				<c:forEach var="list" items="${ServiceList}">
					<tr>
						<td align="center">${list.serviceId }</td>
						<td align="center">${list.serviceDescription}</td>
						<td align="center">${list.serviceRaisedDate}</td>
						<td align="center">${list.serviceStatus}</td>
					</tr><br>
				</c:forEach>
			</table>
		</form>
		</c:if>
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