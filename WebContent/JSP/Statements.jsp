<!-- 
/*******************************************************************
* File name    :   Statements.jsp
* Description  :   This jsp page displays the mini statements of user
* Functionality:   This jsp page displays the mini statements of user
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
<script type="text/javascript">
window.history.forward();
function noBack() 
{
	window.history.forward();
}
function checkDates() {
	
	var from1 = document.statements.from.value;
	var from2 = from1.split("-");
	var from3 = from2[0] + "/" + from2[1] + "/" + from2[2];
	var fromDate = new Date(from3);
	
	var to1 = document.statements.to.value;
	var to2 = to1.split("-");
	var to3 = to2[0] + "/" + to2[1] + "/" + to2[2];
	var toDate = new Date(to3);
	
	if(fromDate > toDate) { 
		document.getElementById('Error').innerHTML = "From Date should be less than To Date";
		document.statements.from.value = "";
		document.statements.to.value = "";
		return false;
	}

}
function validateDate() {
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0
	var yyyy = today.getFullYear();
	
	if(dd<10) {
		dd='0'+dd;
	}
	if(mm<10) {
		mm='0'+mm;
	}
	today = yyyy + "-" + mm + "-" + dd;
	document.statements.from.max = today;
	document.statements.to.max = today;
}


</script>
</head>
<body onload="noBack(); validateDate();" onpageshow="if(event.persisted) noBack();" onunload="">
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
            <li class="start selected"><a href="showStatementsPage.obj">Statements</a></li>
            <li><a href="showServiceRequestPage.obj">Service Request</a></li>
            <li><a href="trackService.obj">Track Service</a></li>
            <li><a href="showChangeCommPage.obj">Change Communication</a></li>
        </ul>
    </nav>
	
	<!-- <div id="body"> -->
    	<center>
    	<div style="height: auto;">
	    	<br>
	    	<br>
	    	<c:if test="${!empty Error}">
				<p align="center"><font color="red">${Error }</font></p>
				<c:set var="Error" value="" scope="session"></c:set>
			</c:if>
	    	<h2>Show Detailed Statement:</h2><br>
	    	<h4><b>Account Balance</b> --- Rs. ${AccountInfo.accountBalance }</h4><br>
		    	<form:form action="showDetailedStatement.obj" method="post" name="statements" onsubmit="return checkDates();">
					<table border='0' class="statementtable" cellpadding="15px" cellspacing="15px">
						<tr>
							<td>From :&nbsp;&nbsp;&nbsp;<input type="date" name="from" class="txtbox" required
								oninvalid="this.setCustomValidity('Please select start date')"	
								onchange="this.setCustomValidity('')" /></td>
							<td>To :&nbsp;&nbsp;&nbsp;<input type="date" name="to" class="txtbox" required
								oninvalid="this.setCustomValidity('Please select end date')"	
								onchange="this.setCustomValidity('')"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><span id="Error" style="color: red"></span></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><br><input type="submit" value=" Submit " class="submit">&nbsp;&nbsp;<input type="reset" value="Reset" class="submit"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><br><a href="showMiniStatement.obj"><b style="font-style: calibri">Show Mini Statement (Last 10 Transaction)</b></a></td>
						</tr>
					</table>
				</form:form>
			
			<c:if test="${!empty msg1}">
				<p align="center"><font color="red">${msg1 }</font></p>
				<c:set var="msg1" value="" scope="session"></c:set>
			</c:if>
			<c:if test="${!empty msg2}">
				<p align="center"><font color="red">${msg2 }</font></p>
				<c:set var="msg2" value="" scope="session" />
			</c:if>
		</div>
			
    	<c:if test="${!empty DetailStatement }">
	    	<div style="height: auto; margin-top: 0px">
				<form name="frm">
					<table cellpadding="15px" cellspacing="15px">
						<caption><font color="#AD0000">Detailed Statement</font></caption>
						<tr>
							<th width="200px"><u>Transaction id</u></th>
							<th width="350px"><u>Transaction Description</u></th>
							<th width="200px"><u>Transaction Date</u></th>
							<th width="200px"><u>Transaction Type</u></th>
							<th width="200px"><u>Transaction Amount</u></th>
						</tr>
						<tr><td colspan="4"><br></td></tr>
						<c:forEach var="list" items="${DetailStatement}">
						<tr>
							<td align="center">${list.transactionId}</td>
							<td align="left">${list.transcationDescription}</td>
							<td align="center">${list.dateOfTransaction}</td>
							<td align="center">${list.transactionType}</td>
							<td align="center">${list.transactionAmount}</td>
						</tr>
						</c:forEach>
						<tr><td colspan="5"></td></tr>
					</table>
				</form>
			</div>
			<c:set var="DetailStatement" value="" scope="session" />
		</c:if>
		
		
		<c:if test="${!empty MiniStatement }">
			<div style="height: auto; margin-top: 0px">
				<form name="frm">
					<table class="statementtable" cellpadding="15px" cellspacing="15px">
						<caption><font color="#AD0000">Mini Statement</font></caption>
						<tr> 
							<th width="200px"><u>Transaction Date</u></th>
							<th width="300px"><u>Transaction Description</u></th>
						</tr>
						<tr><td colspan="4"></td></tr>
						<c:forEach var="list" items="${MiniStatement}">
						<tr>
							<td align="center">${list.dateOfTransaction}</td>
							<td align="left">${list.transcationDescription}</td>
						</tr>
						</c:forEach>
						<tr><td colspan="5"></td></tr>
					</table>
				</form>
			</div>
			<c:set var="MiniStatement" value="" scope="session" />
		</c:if>
		
		</center>
   <!--  </div> -->
    <footer>
        <div class="footer-bottom">
            <p>Copyright&copy; 2015 Bank Of Chennai interactive. All rights reserved.</p>
         </div>
    </footer>
</div>
</body>
</html>