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
 <%@ page import="java.sql.*" %>
       <%
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("uid");
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	//String data;
        	//data=lin.getData(n, 2);
        	
        	%>
        <!----This stuff down below is for navigation------>
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
               <h2 align ="center">Detailed Statement</h2>
               <form action="ClientDS" method="post">
        <table align="center">
        <tr><td>
        	<select required="required" name="selmon">
        	<option value="">Select Month</option>
        	<option value="JAN">January</option>
        	<option value="FEB">February</option>
        	<option value="MAR">March</option>
        	<option value="APR">April</option>
        	<option value="MAY">May</option>
        	<option value="JUN">June</option>
        	<option value="JUL">July</option>
        	<option value="AUG">August</option>
        	<option value="SEP">September</option>
        	<option value="OCT">October</option>
        	<option value="NOV">Nobember</option>
        	<option value="DEC">December</option>
        	</select>
        	</td>
        	<td>
        	<select required="required" name="selyear">
        	<option value="">Select Year</option>
        	<option value="2017">2017</option>
        	<option value="2016">2016</option>
        	<option value="2015">2015</option>
        	</select>
        	</td>
        	</tr>
        <tr><td colspan="2" align="center"><input type="image" src="Images/button_detailed-statement.png"></td></tr>
        </table>
        </form>
               
               
                       <!-----footer starts from here--->
                <div id="footer">
            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>

</body>
</html>