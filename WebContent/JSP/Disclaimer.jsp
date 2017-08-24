<!-- 
/*******************************************************************
* File name    :   Disclaimer.jsp
* Description  :   This jsp page displays the details about the 
*                  disclaimer of the bank
* Functionality:   This jsp page displays the details about the 
*                  disclaimer of the bank
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
        	<li><a href="showHomePage.obj">Home</a></li>
            <li class=""><a href="showFindAtmPage.obj">Find ATM</a></li>
            <li><a href="showAboutUsPage.obj">About Us</a></li>
            <li><a href="showContactUsPage.obj">Contact Us</a></li>
            <li class="start selected"><a href="showDisclaimerPage.obj">Disclaimer</a></li>
        </ul>
    </nav>
	 <div id="body">
<h2 align="center">Bank Of Chennai Terms Of Use For Website</h2><br>
<h4>Please read these terms of use carefully before using this site.<br>
Acknowledgement Of Terms And Conditions.</h4>
Bank Of Chennai (BOC) requires that all persons visiting this site on the Internet adhere to the following terms and conditions. By using the Site, you agree to abide by these terms and conditions.<br>
<br><h4>Use Of Information And Materials</h4>
The Bank maintains this Site to provide you with information about its products and services and to facilitate communication with you. Product offers, rates, terms and other information provided on the Site<br>
are subject to change without notice. We reserve the right to change, update, add or remove portions of these terms and conditions at any time. Please check this Site periodically for changes. The date on which<br>
these Terms of Use was last revised is 12/12/08.
<br><br><h4>Availability Of Products And Services/Eligibilty</h4>
Not all of the products or services described on the Site are available in all geographic areas. You may not be eligible for all the products or services described. We reserve the right to determine eligibility <br>
for any product or service.
<br><br><h4>Confidentiality Of User Communications</h4>
We welcome your comments and suggestions. We will use reasonable efforts to keep any communication or material you transmit to us via the Site or Internet electronic mail which contains personal user information<br>
confidential, except as required by law or as otherwise specifically agreed. Please view the Bank’s<br>
Privacy Policy. Comments, suggestions, and similar submissions containing non-personal information will be the property of the Bank and will not be treated as confidential and the Bank may use information contained<br>
in any such submissions for any purpose.
<br><br><h4>Ownership Of Copyright and trademarks</h4>
Copyright in the pages, screens, text and images appearing at the Site, and their arrangement, is owned by the Bank or others as indicated, and is protected by U.S. and international copyright laws. The trademarks,<br>
logos and service marks displayed on the Site are the property of the Bank and other<br>
parties. Users are prohibited from using any Marks or copyrighted material for any purpose without the prior written permission of the Bank, and users are specifically prohibited from modifying, copying, distributing,<br>
transmitting, displaying, creating derivative works or using any content available on or through<br>
the Site for commercial or public purposes.
<br><br><h4>Governing Law</h4>
You agree that your use of this Site shall be governed by the laws of the Commonwealth of Massachusetts without regard to conflicts of law principles.
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