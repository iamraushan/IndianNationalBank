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
       <!-- admin new client // work yet to be done--->
       <h3 align="center">Add New Client</h3>
       <form action="NewCustomer" method="post">
         <table align ="center">
       			<tr><td>First Name </td><td><input type="text" name="fname" required="required"></td></tr> 
        		<tr><td>Last Name </td><td><input type="text" name="lname" required="required"></td></tr>       
        		<tr><td>Address Line 1</td><td><input type="text" name="adl1" required="required"></td></tr>
                <tr><td>Address Line 2</td><td><input type="text" name="adl2" required="required"></td></tr>       
                <tr><td>Landmark</td><td><input type="text" name="adlm" required="required"></td></tr>
                <tr><td>City</td><td><input type="text" name="city" required="required"></td></tr>       
                <tr><td>State</td><td><input type="text" name="state" required="required"></td></tr>       
                <tr><td>Country</td><td><input type="text" name="coun" required="required"></td></tr>       
                <tr><td>email</td><td><input type="email" name="email" required="required"></td></tr>       
                <tr><td>Contact Number</td><td><input type="number" name="contact" min = "0" required="required"></td></tr>       
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