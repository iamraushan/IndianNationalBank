<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE HTML>
    <jsp:useBean id="lin" class="bean.LoginCheck" scope="session"/>
<html>
    <head>
        <title>Indian National Bank</title>
        <link rel="icon" href="Images/ava.ico">
        <link href="Style/style.css" type="text/css" rel="stylesheet"/>
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
        <br><br>
        
        <table align = "center" cellpadding="15" cellspacing="0" border="0">
        
        <tr><td align = "center" ><a href = "admin_newclient.jsp"><img src="Images/button_new-customer.png"></a></td>
        	<td align = "center"><a href="admin_loan.jsp"><img src = "Images/button_loan.png"></a></td>
        	<td align = "center"><img  src ="Images/button_view-clients.png"></td>
        </tr>
        <tr><td align = "center"><img  src="Images/button_view-accounts.png"></td>
        	<td align = "center"><img  src = "Images/view_transaction.png"></td>
        	<td align = "center"><img  src ="Images/button_freeze-account.png"></td>
        </tr>
        <tr><td colspan = 3 align = "center"><img src="Images/button_close-account.png"></td>
        </tr>
        
        
        </table>
        
        
        
<!--footer is down below-->       
        <div id="footer">
            <!--p>A PROJECT ON ONLINE BANKING SYSTEM</p-->
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>