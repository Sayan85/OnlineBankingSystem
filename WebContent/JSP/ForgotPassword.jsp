<!-- 
/*******************************************************************
* File name    :   ForgotPassword.jsp
* Description  :   This jsp page allows the user to create a new 
                   password based on security question
* Functionality:   This jsp page allows the user to create a new 
                   password based on security question
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
<link rel="stylesheet" href="css/Style.css" type="text/css" />
<script type="text/javascript">
window.history.forward();
function noBack() 
{
	window.history.forward();
}

function validation() {

	var password = document.forgot.password.value;
	var repassword = document.forgot.repassword.value;

	if(password!=repassword){
		alert("Password does not match");
		document.forgot.password.value = "";
		document.forgot.repassword.value = "";
		document.forgot.password.focus();
		return false;
	}
}
</script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<div id="container">
    <header>
    	<h1><a href="/">Bank of <span>Chennai</span></a></h1>
        <h2>Tradition of trust...</h2>
    </header>
    <nav>
    	<ul>
        	<li><a href="showHomePage.obj">Home</a></li>
            <li><a href="showFindAtmPage.obj">Find ATM</a></li>
            <li><a href="showAboutUsPage.obj">About Us</a></li>
            <li><a href="showContactUsPage.obj">Contact Us</a></li>
            <li><a href="showDisclaimerPage.obj">Disclaimer</a></li>
        </ul>
    </nav>
    <center>
    <div id="body">
    	<div class="content1"><br><br><br>
    		<h2>Forgot Password</h2>
    		
	    	<c:if test="${empty SecretQues}">
				<c:set var="SecretQues" value="" scope="session"></c:set>
				<form action="forgotPassword.obj" method="post">
					<table align="center" cellpadding="15px" cellspacing="15px">
						<tr>
							<td width="200px">Enter your Account Number</td>
							<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="accountid" pattern="[0-9]{10}" class="txtbox" maxlength="10" required
													oninvalid="this.setCustomValidity('Please enter Account Number containing numbers(0-9) only')" 
													oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"
													placeholder="Enter Account Number"></td>
						</tr>
						<tr>
							<td>Enter your User Id</td>
							<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="userid" class="txtbox" maxlength="10" required placeholder="Enter User ID"
													pattern="[A-Z 0-9]{10}"
													oninvalid="this.setCustomValidity('User ID should contains characters & numbers only and Case Sensitive')" 
													oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
						</tr>
						<tr>
							<td></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value=" Proceed " class="submit"></td>
						</tr>
					</table>
				</form>
			</c:if>
			<c:if test="${!empty SecretQues}">
				<form action="changePassword.obj" method="post" onsubmit="return validation()" name="forgot">
					<table align="center" cellpadding="15px" cellspacing="15px">
						<tr>
							<td width="200px">Secret Question</td>
							<td>:&nbsp;&nbsp;&nbsp;<label>${SecretQues}</label></td>
						</tr>
						<tr>
							<td>Enter Secret Answer</td>
							<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="secretans" class="txtbox" maxlength="50" required
							oninvalid="this.setCustomValidity('Please enter secret answer')" 
							onchange="this.setCustomValidity('')" maxlength="50" placeholder="Enter Secret Answer"></td>
						</tr>
						<tr>
							<td>Enter New Password</td>
							<td>:&nbsp;&nbsp;&nbsp;<input type="password" name="password" class="txtbox" maxlength="20" required
							oninvalid="this.setCustomValidity('Please enter a valid alphanumeric password to proceed')" 
							onchange="this.setCustomValidity('')" pattern="[A-Za-z0-9]+" maxlength="20" placeholder="Enter New Password"></td>
						</tr>
						<tr>
							<td>Re-type New Password</td>
							<td>:&nbsp;&nbsp;&nbsp;<input type="password" name="repassword" class="txtbox" maxlength="20" required
							oninvalid="this.setCustomValidity('Please retype new password to proceed')" 
							onchange="this.setCustomValidity('')" pattern="[A-Za-z0-9]+" maxlength="20" placeholder="Confirm New Password"></td>
						</tr>
						<tr>
							<td></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value=" Proceed " class="submit"></td>
						</tr>
					</table>
				</form>
				<c:set var="SecretQues" value="" scope="session"></c:set>
			</c:if>
			<c:if test="${!empty Wrong}">
				<p align="center"><font color="red">${Wrong }</font></p>
				<c:set var="Wrong" value="" scope="session"></c:set>
			</c:if>
			<c:if test="${!empty Success}">
				<p align="center"><font color="green">${Success }</font></p>
				<c:set var="Success" value="" scope="session"></c:set>
			</c:if>
			<c:if test="${!empty Fail}">
				<p align="center"><font color="red">${Fail }</font></p>
				<c:set var="Fail" value="" scope="session"></c:set>
			</c:if>
		</div>
	</center>
    </div>
    <footer>
        <div class="footer-bottom">
            <p>Copyright&copy; 2015 Bank Of Chennai interactive. All rights reserved.</p>
         </div>
    </footer> 
</body>
</html>