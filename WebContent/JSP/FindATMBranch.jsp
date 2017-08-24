<!-- 
/*******************************************************************
* File name    :   FindATMBranch.jsp
* Description  :   This jsp page directs you to the list of all ATM/
*                  branches of the bank in all cities
* Functionality:   This jsp page directs you to the list of all ATM/
*                  branches of the bank in all cities
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
            <li class="start selected"><a href="showFindAtmPage.obj">Find ATM</a></li>
            <li><a href="showAboutUsPage.obj">About Us</a></li>
            <li><a href="showContactUsPage.obj">Contact Us</a></li>
            <li class="end"><a href="showDisclaimerPage.obj">Disclaimer</a></li>
        </ul>
    </nav>
 <div id="body">
 <center>
<form name="atm">
<h2>Our ATM Branches</h2>
<table border="0" cellpadding="15px" cellspacing="15px">
<tr>
<th>S.No.</th><th>City</th><th>Address</th><th>Pincode</th></tr>
<tr><td>1.</td><td>Ahmedabad</td><td>Bank Of Chennai, Ground Floor, Shop No.6/7, Safal Pegasus, Opp Reliance Petrol Pump, 100 Feet Road, Prahladnagar</td><td>380015</td></tr>
<tr><td>2.</td><td>Ahmedabad</td><td>Bank Of Chennai, Pooname plaza, Rambaug,ManiNagar</td><td>380028</td></tr>
<tr><td>3.</td><td>Bangalore</td><td>Bank Of Chennai, No; 4, M417, 80 Feet Road, H R B R 3Rd Block, Kamanahalli, Kalyan Nagar</td><td>560043</td></tr>
<tr><td>4.</td><td>Bangalore</td><td>Bank Of Chennai, Survey No. 80/2 , Plot No 23, 24 & 25, Bellandur Village, Varthur Hobli</td><td>560103</td></tr>
<tr><td>5.</td><td>Bangalore</td><td>Bank Of Chennai,, No.5, P & T Colony, R.T. Nagar Main Road, R.T. Nagar</td><td>560032</td></tr>
<tr><td>5.</td><td>Bhopal</td><td>Bank Of Chennai, Plot No. 11, Zone II, Alankar Palace, Near Pragati Petrol Pump, M.P. Nagar</td><td>462003</td></tr>
<tr><td>6.</td><td>Bhopal</td><td>Bank Of Chennai, Shop No - 7, 8, 9 & 10, Centre Point, New Market</td><td>462011</td></tr>
<tr><td>7.</td><td>Bhubaneswar</td><td>Bank Of Chennai,OCCF Building, Opposite Sriya Cinema Hall, Kharvelanagar Unit III</td><td>751001</td></tr>
<tr><td>8.</td><td>Chennai</td><td>Bank Of Chennai, A78, Plot No 3211, 3rd Avenue, Anna Nagar</td><td>600102</td></tr>
<tr><td>9.</td><td>Chennai</td><td>Bank Of Chennai, P.B. No. 1610, Dare House, Annexe 44, Moore Street</td><td>600001</td></tr>
<tr><td>10.</td><td>Chennai</td><td>Bank Of Chennai,2/1, L.B. Road, Adyar </td><td>60020</td></tr>
<tr><td>11.</td><td>Chennai</td><td>Bank Of Chennai,R.K. Salai ICICI Bank Ltd., NAC Towers, No. - 85, Dr. R.K. Salai, Mylapore</td><td>600004</td></tr>
<tr><td>12.</td><td>Chennai</td><td>Bank Of Chennai,Velachery ICICI Bank Ltd., 137, LIC Colony Main Road, Velachery</td><td>600042</td></tr>
<tr><td>13.</td><td>Hyderabad</td><td>Bank Of Chennai,DLF Cyber City, Block No-3, Plot No -129-132,APHB Colony, Gachibowli</td><td>500019</td></tr>
<tr><td>13.</td><td>Hyderabad</td><td>Bank Of Chennai,Titus, Building No 10, Mindspace, Raheja IT Park Pvt Limited, Madhapur</td><td>500072</td></tr>
<tr><td>14.</td><td>Hyderabad</td><td>Bank Of Chennai,69-MIG, Dharmareddy Colony, OPP JNTU, KPHB Colony, Kukatpally</td><td>500081</td></tr>
<tr><td>15.</td><td>Indore</td><td>Bank Of Chennai,Malav Parisar, 4 Chhoti Khajrani, Opposite Hotel Shreemaya, A.B. Road</td><td>452008</td></tr>
<tr><td>16.</td><td>Jaipur</td><td>Bank Of Chennai,Jaipur Infosys, Mahindra World City, SEZ, Ajmer Road</td><td>302037</td></tr>
<tr><td>17.</td><td>Jaipur</td><td>Bank Of Chennai,Bhagat Bhawan, M.I. Road</td><td>302001</td></tr>
<tr><td>18.</td><td>Kanpur</td><td>Bank Of Chennai,In Front of Hall Residence No – 7, IIT Kanpur, Kalyanpur</td><td>208016</td></tr>
<tr><td>19.</td><td>Lucknow</td><td>Bank Of Chennai,Shalimar Tower, 31/54 M.G. Marg, Hazratganj</td><td>226001</td></tr>
<tr><td>20.</td><td>Mumbai</td><td>Bank Of Chennai,B 6, Ground Floor, Lokmilan, Chandivali, Andheri</td><td>400064</td></tr>
<tr><td>21.</td><td>Mumbai</td><td>Bank Of Chennai,Ground Floor, Eureka Towers, Mindspace, Link Road, Malad</td><td>400028</td></tr>
<tr><td>22.</td><td>Kochi</td><td>Bank Of Chennai,Emgee Square, M.G. Road, Ernakulam, Kochi</td><td>450025</td></tr>
<tr><td>23.</td><td>Kochi</td><td>Bank Of Chennai,Tejomaya, L&T Techpark, Infopark, Kakkanad</td><td>450026</td></tr>
<tr><td>24.</td><td>Kolkata</td><td>Bank Of Chennai,Elgin Apartment, 1A, Ashutosh Mukherjee Road, Bhowanipore</td><td>250024</td></tr>
<tr><td>25.</td><td>Kolkata</td><td>Bank Of Chennai,Plot A2, M2 and N2, Block EP & GP, Sector V, Salt Lake, Bidhan Nagar, North 24 Parganas</td><td>250025</td></tr>
<tr><td>26.</td><td>Mysore</td><td>Bank Of Chennai,2950,Aiswarya arcade,v.v.mohalla</td><td>570002</td></tr>
</table>
</form>
<div class="clear"></div>
</center>
    </div>
    <footer>
        <div class="footer-bottom">
            <p>Copyright&copy; 2015 Bank Of Chennai interactive. All rights reserved.</p>
         </div>
    </footer>
</div>
</body>
</html>