<!-- 
/*******************************************************************
* File name    :   HomePage.jsp
* Description  :   This jsp page displays the home page of the bank
* Functionality:   This jsp page displays the home page of the bank
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
</script>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<div id="container">
    <header>
    	<h1><a href="">Bank of <span>Chennai</span></a></h1>
        <h2>Tradition of trust...</h2>
    </header>
    <nav>
    	<ul>
        	<li class="start selected"><a href="#">Home</a></li>
            <li><a href="showFindAtmPage.obj">Find ATM</a></li>
            <li><a href="showAboutUsPage.obj">About Us</a></li>
            <li><a href="showContactUsPage.obj">Contact Us</a></li>
            <li><a href="showDisclaimerPage.obj">Disclaimer</a></li>
        </ul>
    </nav>
	
	<div class="sliderdiv">
		<div id="slider">
			<figure>
				<img src="images/slider1.jpg" alt="">
				<img src="images/slider2.jpg" alt="">
				<img src="images/slider3.jpg" alt="">
				<img src="images/slider4.jpg" alt="">
				<img src="images/slider1.jpg" alt="">
			</figure>
		</div>
	</div>
	
    <div id="body">
    
	<section id="content">
		<div class="logintable">
		<form:form action="login.obj" method="post" modelAttribute="LoginRole">
			<center>
				<table cellpadding="15px" cellspacing="15px"> 
					<caption><h4>Sign in to BANK OF CHENNAI</h4></caption>
					<tr>
						<td colspan="2" style="height: 25px" align="center">
							<font color="red">
							<c:if test="${!empty InvalidUser}">
								<p align="center"><font color="red">${InvalidUser }</font></p>
								<c:set var="InvalidUser" value="" scope="session"></c:set>
							</c:if>
							</font>
						</td>
					</tr>
					<tr>
						<td width="150px">User Name</td>
						<td><form:input path="userId" oninvalid="this.setCustomValidity('Please enter a valid alphanumeric user name to proceed')" 
						onchange="this.setCustomValidity('')" pattern="[A-Z0-9]+" maxlength="10" placeholder="Enter User Name" required="true"/></td>
					</tr>
					<tr>
						<td width="150px">Password</td>
						<td><form:input path="loginPassword" type="password" oninvalid="this.setCustomValidity('Please enter a valid alphanumeric password to proceed')" 
						onchange="this.setCustomValidity('')" pattern="[A-Za-z0-9]+" maxlength="20" placeholder="Enter Password" required="true"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" class="submit" value=" Login "/></td>
					</tr>
					<tr>
						<td></td>
						<td><a href="showForgotPasswordPage.obj" class="button">Forgot Password</a></td>
					</tr>
				</table>
			</center>
			</form:form>
		</div>
	</section>
    <!-- <aside class="sidebar"> -->
	<div class="sidebar">
		<h4>Features Of Net Banking:</h4><br>
		1.Bank 24x7- anywhere, any time.<br><br>
		2.View account details for savings account and current account.<br><br>
		3.Transfer funds online between your third party accounts with Bank Of Chennai or any other bank accounts.<br><br>
		4.Online password regeneration.<br><br>
		5.View account balance,account activities and track services.
	</div>
    <!-- </aside> -->
    <div class="clear"></div>
    </div>
    <footer>
        <div class="footer-bottom">
            <p>Copyright&copy; 2015 Bank Of Chennai interactive. All rights reserved.</p>
         </div>
    </footer>
</div>
</body>
</html>