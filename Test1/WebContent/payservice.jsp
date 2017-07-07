<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lin" class="bean.LoginCheck" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Indian National Bank</title>
	<link rel="icon" href="Images/ava.ico">
    <link href="Style/style.css" type="text/css" rel="stylesheet"/>
</head>
 <script type="text/javascript">
    window.oncontextmenu = function () {
		   return false;
		}</script>
<body>
<%

HttpSession session1=request.getSession(false);
String n=(String)session1.getAttribute("uid");
//out.print(n);
if(n==null)
{
	response.sendRedirect("index.jsp");
}
String choice = null;
choice = (String)session1.getAttribute("service");
%>
         <div id="nav">
       <ul>
           <div id="nav-wrapper">
               <li><a href="home.jsp"><img height="40px" width="40px" src ="Images/ava.ico"><b>Indian National Bank</b></a></li>
                <li><a href="home.jsp">Accounts</a>
                	<ul>
                	 <li><a href="FormFD.jsp">Fixed Deposit</a></li>
 					<li><a href="ViewFD.jsp">View FD</a></li>                	
                	 
                	  <li><a href="loan.jsp">Loans</a></li>
                	  <li><a href="es.jsp">Mini-Statement</a></li>
                	  <li><a href="ds.jsp">Detail Statement</a></li>
                	  
                	</ul>
                	</li>
                <li><a href="#">Payments</a>
                	<ul>
                	 <li><a href="ft.jsp">Fund Transfer</a>
                	 <li><a href="paybills.jsp">Pay Bills</a></li>
                	</ul>
 			 </li>
               
               <li><a href="home.jsp"><% String cname = (String)session1.getAttribute("cname"); out.print(cname);%></a>
                <ul>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="setting.jsp">Settings</a></li>
                    <li><a href="LogOut.jsp">Log Out</a></li>
                </ul>
               
               </li>              
           </div>
            <hr>
       </ul>
       </div>
        <!------------Main Content starts from here--------->
 		<h2 align="center">Pay Bills</h2>
 		<form action="PayService" method="post">
        <%
        if(choice.equals("1"))
        {
        	%>
        	<table align="center">
        	<tr><td>Select Company</td><td>
        	<select name="company" required>
        	<option value=''>Select</option>
        	<option value='1000001011' >WBSEDL, West Bengal</option>
        	<option value='1000001012'>JSEB, Jharkhand</option>
        	<option value='1000001013'>SBPDCL, Bihar</option>
        	<option value='1000001014'>Tata Power Delhi Distribution Limited (NDPL), Delhi</option>
        	</select>
        	</td></tr>
        	<tr><td>Enter Client ID</td><td><input type="number" min=0 name="id" required="required"></td></tr>
        	<tr><td>Enter Amount</td><td><input type="number" min = 0 name="amount" required="required"></td></tr>
        	<tr><td colspan="2" align="center"><input type="image" src="Images/pay-button.png" height="40px" width="90px"></td></tr>
        	</table>
        	<%
        }
        else
        if(choice.equals("2"))
        {
         %>
           	<table align="center">
            <tr><td>Select Company</td><td>
            <select name="company" required>
            <option value=''>Select</option>
            <option value='1000002011'>HP Gas</option>
            <option value='1000002012'>Indane</option>
            <option value='1000002013'>Reliance</option>
            <option value='1000002014'>GE</option>
            </select>
            </td></tr>
            <tr><td>Enter Client ID</td><td><input type="number" min=0 name="id" required="required"></td></tr>
            <tr><td>Enter Amount</td><td><input type="number" min = 0 name="amount" required="required"></td></tr>
            <tr><td colspan="2" align="center"><input type="image" src="Images/pay-button.png" height="40px" width="90px"></td></tr>
            </table>
           <%
         }
        else
            if(choice.equals("3"))
            {
               %>
                <table align="center">
                <tr><td>Select Carrier</td><td>
                <select name="company" required>
                <option value=''>Select</option>
                <option value='1000003011'>Reliance Jio</option>
                <option value='1000003012'>Vodafone</option>
                <option value='1000003013'>Airtel</option>
                <option value='1000003014'>Idea</option>
                <option value='1000003015'>Aircel</option>
                
                </select>
                </td></tr>
                <tr><td>Enter Mobile number</td><td><input type="number" min=0 name="id" required="required"></td></tr>
                <tr><td>Enter Amount</td><td><input type="number" min = 0 name="amount" required="required"></td></tr>
                <tr><td colspan="2" align="center"><input type="image" src="Images/pay-button.png" height="40px" width="90px"></td></tr>
                </table>
                   <%
                 }
            else
            if(choice.equals("4"))
            {
            %>
            	<table align="center">
            	<tr><td>Select Carrier</td><td>
                <select name="company" required>
                <option value=''>Select</option>
                <option value='1000004011'>Reliance Digital</option>
                <option value='1000004012'>Dish TV</option>
                <option value='1000004013'>Airtel TV</option>
                </select>
                </td></tr>
                <tr><td>Enter ID</td><td><input type="number" min=0 name="id" required="required"></td></tr>
                <tr><td>Enter Amount</td><td><input type="number" min = 0 name="amount" required="required"></td></tr>
                <tr><td colspan="2" align="center"><input type="image" src="Images/pay-button.png" height="40px" width="90px"></td></tr>
                </table>
              <%
              }
            else
            {
            	%>
            	<p align ="center">Select a valid option </p>
            	<%
            }
            
        %>
        
        
        </form> 
        
        
        
        
        
<!--footer is down below-->       
        <div id="footer">
            <!--p>A PROJECT ON ONLINE BANKING SYSTEM</p-->
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>