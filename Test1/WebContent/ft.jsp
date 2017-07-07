<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lin" class="bean.LoginCheck" scope="session"/>
    
    <!DOCTYPE HTML>
<html>
    <head>
        <title>Indian National Bank</title>
        <link rel="icon" href="Images/ava.ico">
        <link href="Style/style.css" type="text/css" rel="stylesheet"/>
    </head>
     <script type="text/javascript">
    window.oncontextmenu = function () {
		   return false;
		}</script>
    <body>
    <%@ page import="java.sql.*" %>
        
        <%
        	HttpSession session1=request.getSession(false);
        	String n=(String)session.getAttribute("uid");
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	
        %>
        
        
        
        <!----This stuff down below is for navigation------>
        
              <div id="nav">
       <ul>
           <div id="nav-wrapper">
               <li><a href="home.jsp"><img height="40px" width="40px" src ="Images/ava.ico"><b>Indian National Bank</b></a></li>
                <li><a href="home.jsp">Accounts</a>
                	<ul>
                	 <li><a href="FormFD.jsp">Fixed Deposit</a></li>
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
        <h2 align="center">Fund Transfer</h2>
        <form action="FundTransfer" method="post">
            <table align="center">
                <tr><td>Amount</td><td><input type="number" min="0" placeholder ="Enter Amount in INR" name="amnt" required="required"></td></tr>
                <tr><td>From</td><td><%=lin.getAccDetails(n, 1, 0)%></td></tr>
                <tr><td>To</td><td><input type ="number" placeholder= "Enter Account number of Payee" name="toacc" required="required"></td></tr>
                <!--tr><td colspan="2" align ="center"><input type ="button" value ="Pay"></td></tr-->
                <tr><td colspan="2" align ="center"><input type="image" src="Images/pay-button.png" height="40px" width="90px"></td></tr>
                
            </table>
            
            <p style="font-size: 12px" align ="center">You have <%=lin.accounts(lin.getAccDetails(n, 1, 0),2 )%> INR left in your saving accounts</p>
        </form>
    
        <!-----footer starts from here--->
        <div id="footer">
            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>