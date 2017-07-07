<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE HTML>
    <jsp:useBean id="lin" class="bean.LoginCheck" scope="session"/>
<html>
    <head>
        <title>Indian National Bank</title>
        <link rel="icon" href="Images/ava.ico">
        <link href="Style/style.css" type="text/css" rel="stylesheet"/>
        <script>
    			history.forward();
    			window.oncontextmenu = function () {
    				   return false;
    				}
			</script>
    </head>
    <body>
    
    <%@ page import="java.sql.*" %>
        
        <%
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("aid");
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
               <li><a href="adminhome.jsp"><img height="40px" width="40px" src ="Images/ava.ico"><b>Indian National Bank</b></a></li>
               <li><a href="adminhome.jsp">Home</a></li>
               <li><a href = "adminhome.jsp" style="color:gold"><%=lin.getAdminData(n, 2) %></a>
               <ul>
               <li><a href = "LogOut.jsp">Log Out</a><li>
               </ul>
              
               
               
               
               
               
               </li>              
           </div>
            <hr>
       </ul>
       </div>
    
       
 <!-----The Webpage is down below---------->
        <br>
        <h3 align = "center">Add Loan Credentials</h3>
       <form action ="Loan" method="post">
       <table align="center">
       <tr><td>Client id</td><td><input type="number" name="c_id" required="required"></td></tr>
       <tr><td>Amount</td><td><input type="number" name="amount" required="required" min="1" >INR</td></tr>
       <tr><td>Type of Loan</td><td>
       <select name="rate">
			<option value=8>Education Loan</option>
       		<option value=9>Home Loan</option>
       		<option value=7>Health Loan</option>
       		<option value=10>Car Loan</option>       	
       		<option value=12>Personal Loan</option>
   </select>
       </td></tr>
       <tr><td>Time</td><td><input type="number" name="time" required="required" min="6" step="6">months</td></tr>
	   <tr><td colspan="2" align ="center"><input type="image"src="Images/submit.png" height="50px" width="90px"/></td></tr>
       
       </table>
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