<!-- 
/*******************************************************************
* File name    :   ContactUs.jsp
* Description  :   This jsp page displays the details about the contact
                   list of the bank
* Functionality:   This jsp page displays the details about the contact
                   list of the bank
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
            <li class="start selected"><a href="showContactUsPage.obj">Contact Us</a></li>
            <li class="end"><a href="showDisclaimerPage.obj">Disclaimer</a></li>
        </ul>
    </nav>
	<div id="body">
	<div class="content1">
	<h2 align="center">Contact Us</h2>
	<br><br>
Write to us at:<br> 
<b>Bank Of Chennai</b>,BOC Banking Center, Chennai Bank Tower, 7th floor,<br>
Survey no: 115/27, Plot no. 12, Mylapore, Chennai-600004.<br>
If you are not satisfied with the resolution provided by above mentioned service channels, you can refer to our grievance redressal policy and escalate the issue to the Nodal Officer.<br>
Registered Office: Bank Of Chennai, Race Course Circle, Vadodara 390 007.<br>
Corporate Office: Bank Of Chennai Towers,Bandra-Kurla Complex, Mumbai 400 051.<br>
Customer-care: +91 22 26531414.(toll free). 
</div>
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