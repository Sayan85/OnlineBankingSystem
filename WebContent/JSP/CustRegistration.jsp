<!-- 
/*******************************************************************
* File name    :   NewRegistration.jsp
* Description  :   This jsp page is for new user registration
* Functionality:   This jsp page is for new user registration
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

function validation() {

	var password = document.registration.password.value;
	var repassword = document.registration.repassword.value;
	var transactionpassword = document.registration.transactionpassword.value;
	var retransactionpassword = document.registration.retransactionpassword.value;

	if(password!=repassword){
		alert("Password does not match");
		document.registration.password.value = "";
		document.registration.repassword.value = "";
		document.registration.password.focus();
		return false;
	}
	if(transactionpassword!=retransactionpassword){
		alert("Transaction Password does not match");
		document.registration.transactionpassword.value = "";
		document.registration.retransactionpassword.value = "";
		document.registration.transactionpassword.focus();
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
    </header>
    <nav>
    	<ul>
        	<li><a href="showAdminHomePage.obj">Admin Home</a></li>
            <li><a href="#">View Transactions</a></li>
            <li class="start selected"><a href="showCustRegistrationPage.obj">Add Customer</a></li>
            <li><a href="signout.obj">Log out</a></li>
        </ul>
    </nav>
    <center>
    <div id="body">
		<c:if test="${!empty Error}">
			<p align="center"><font color="red">${Error }</font></p>
			<c:set var="Error" value="" scope="session"></c:set>
		</c:if>
		<form name="registration" action="newCustRegister.obj" method="post" onsubmit="return validation()">
			<table border="0" class=""  cellpadding="15px" cellspacing="15px" align="center">
				<caption><h2><b>New Customer Registration</b></h2></caption>
				<c:if test="${!empty UserID}">
					<h3 style="color: green">You are successfully registered</h3>
					<h4 style="color: green">Please note your User ID : ${UserID}</h4>
					<c:set var="UserID" value="" scope="session"></c:set>
				</c:if>
	
				<c:if test="${!empty Error}">
					<h2>${Error }</h2>
					<c:set var="Error" value="" scope="session"></c:set>
				</c:if>
				
				<tr>
					<td colspan="2" align="center"><b>Personal Information </b></td>
				</tr>
				<tr>
					<td width="200px;">Name</td>
					<td width="300px">:&nbsp;&nbsp;&nbsp;<input type="text" name="custname" class="txtbox" maxlength="40" 
					pattern="[A-Z a-z]{2,}" placeholder="Enter name" required
					oninvalid="this.setCustomValidity('Please enter name. Name should contain alphabets(A-Z a-z) only')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="email" name="custemail" class="txtbox" maxlength="30" 
					placeholder="Enter email" required
					oninvalid="this.setCustomValidity('Please enter valid email id e.g. someone@example.com')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>:&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gender" value="Male" required 
						oninvalid="this.setCustomValidity('Please select gender')" 
					    oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"> Male
						<input type="radio" name="gender" value="Female"> Female
					</td>
				
				<tr>
					<td>Date of Birth</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="date" name="dob" class="txtbox" required
					oninvalid="this.setCustomValidity('Please enter date of birth')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
				</tr>
				
				<tr>
					<td>Mobile Number</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="mobileno" class="txtbox" maxlength="10" 
					placeholder="Enter mobile number" pattern="[7|8|9][0-9]{9}" required
					oninvalid="this.setCustomValidity('Please enter mobile number. Mobile number should contain numbers(0-9) only')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
				</tr>
				<tr>
					<td>Address</td>
					<td>:&nbsp;&nbsp;&nbsp;<textarea rows="5" cols="33" name="custaddress" class="txtarea" required
					placeholder="Enter address"
					oninvalid="this.setCustomValidity('Please enter communication address')" 
					onchange="this.setCustomValidity('')" ></textarea></td>
				</tr>
				<tr>
					<td>Pan Card Number</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="pancard" class="txtbox" maxlength="10" required
					pattern="[A-Z 0-9]{10}" placeholder="Enter Pan Card Number"
					oninvalid="this.setCustomValidity('Please enter Pan Card number. Pan card should not contain any special character.')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
				</tr>
				<tr>
					<td>Aadhar Card Number</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="aadharcard" class="txtbox" maxlength="12" required
					pattern="[0-9]{12}"	oninvalid="this.setCustomValidity('Please enter Aadhar Card number. Aadhar card should contain numbers(0-9) only.')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')" placeholder="Enter Aadhar Card Number"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><b><br>Security Information :<br></b></td>
				</tr>
				<tr>
					<td width="200px;">Enter Account ID</td>
					<td width="300px">:&nbsp;&nbsp;&nbsp;<input type="text" name="accountid" class="txtbox" maxlength="10" 
					pattern="[A-Z a-z 0-9]{5,}" placeholder="Enter Account ID" required
					oninvalid="this.setCustomValidity('Please enter Account ID. It should contain numbers(0-9) only')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
				</tr>
				<tr>
					<td width="200px;">Enter Account Open Date</td>
					<td width="300px">:&nbsp;&nbsp;&nbsp;<input type="date" name="accountopendate" class="txtbox" maxlength="10" 
					pattern="[A-Z a-z 0-9]{5,}" placeholder="Enter Account Open Date" required
					oninvalid="this.setCustomValidity('Please enter Account Open Date')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
				</tr>
				<tr>
					<td width="200px;">Enter User ID</td>
					<td width="300px">:&nbsp;&nbsp;&nbsp;<input type="text" name="userid" class="txtbox" maxlength="40" 
					pattern="[A-Z a-z 0-9]{5,}" placeholder="Enter User ID" required
					oninvalid="this.setCustomValidity('Please enter User ID. It should contain alphabets(A-Z a-z) and numbers(0-9) only')" 
					oninput="this.setCustomValidity('')" onchange="this.setCustomValidity('')"></td>
				</tr>
				<tr>
					<td>Enter Password</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="password" name="password" class="txtbox" maxlength="20" required
					placeholder="Enter Password"
					oninvalid="this.setCustomValidity('Please enter a valid alphanumeric password to proceed')" 
					onchange="this.setCustomValidity('')" pattern="[A-Za-z0-9]+" maxlength="20"></td>
				</tr>
				<tr>
					<td>Re-type Password</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="password" name="repassword" class="txtbox" maxlength="20" required
					placeholder="Retype Password"
					oninvalid="this.setCustomValidity('Please retype password to proceed')" 
					onchange="this.setCustomValidity('')" pattern="[A-Za-z0-9]+" maxlength="20"></td>
				</tr>
				<tr>
					<td>Secret Question</td>
					<td>:&nbsp;&nbsp;
						<select name="secretquestion">
							<option value="What is your Birth Place?">What is your Birth Place?</option>
							<option value="What is your favourite movie?">What is your favourite movie?</option>
							<option value="What is your Grandfather's first name?">What is your Grandfather"s first name?</option>
							<option value="What is your favourite place?">What is your favourite place?</option>
							<option value="What is your first school name?">What is your first school name?</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>Secret Answer</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="text" name="secretanswer" class="txtbox" maxlength="50" required
					placeholder="Enter Secret Answer"
					oninvalid="this.setCustomValidity('Please enter secret answer')" 
					onchange="this.setCustomValidity('')" maxlength="50"></td>
				</tr>
				<tr>
					<td>Transaction Password</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="password" name="transactionpassword" class="txtbox" maxlength="15" 
					placeholder="Enter Transaction Password" required
					oninvalid="this.setCustomValidity('Please enter a valid alphanumeric transaction password to proceed')" 
					onchange="this.setCustomValidity('')" pattern="[A-Za-z0-9]+" maxlength="15"></td>
				</tr>
				<tr>
					<td>Re-type Transaction Password</td>
					<td>:&nbsp;&nbsp;&nbsp;<input type="password" name="retransactionpassword" class="txtbox" maxlength="15" 
					placeholder="Retype Transaction Password" required
					oninvalid="this.setCustomValidity('Please retype transaction password to proceed')" 
					onchange="this.setCustomValidity('')" pattern="[A-Za-z0-9]+" maxlength="15"></td>
				</tr>
				<tr>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value=" Register " class="submit">&nbsp;&nbsp;<input type="reset" value="Reset" class="submit"></td>
				</tr>
			</table>
		</form>	
	
    </div>
    </center>
    <footer>
        <div class="footer-bottom">
            <p>Copyright&copy; 2015 Bank Of Chennai interactive. All rights reserved.</p>
         </div>
    </footer> 
</body>
</html>