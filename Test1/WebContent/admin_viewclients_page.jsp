<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE HTML>
    <jsp:useBean id="lin" class="bean.LoginCheck" scope="session"/>
<html>
    <head>
        <title>Indian National Bank</title>
        <link rel="icon" href="Images/ava.ico">
        <link href="Style/style.css" type="text/css" rel="stylesheet"/>
        <script type="text/javascript">
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
        	String cid=(String)session1.getAttribute("Admincid");
        	String fname=(String)session1.getAttribute("Adminfname");
        	String lname=(String)session1.getAttribute("Adminlname");
        	String adl1=(String)session1.getAttribute("Adminadl1");
        	String adl2=(String)session1.getAttribute("Adminadl2");
        	String adlm=(String)session1.getAttribute("Adminadlm");
        	String adcity=(String)session1.getAttribute("Adminadcity");
        	String state=(String)session1.getAttribute("Adminadstate");
        	String adcoun=(String)session1.getAttribute("Admincoun");
        	String email=(String)session1.getAttribute("Adminemail");
        	String contact=(String)session1.getAttribute("Admincontact");
        	if(contact == null)
        	{
        		contact="Not found";
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
        <h3 align="center"> View Clients</h3>
		<form>
		<table align="center">
		<tr><td>Client id</td><td>:<%=cid %></td>
		<tr><td>Name</td><td>:<%=fname %> <%=lname %></td>
		<tr><td>Address</td><td>:<%=adl1 %>, <%=adl2 %></td>
		
		<tr><td>Landmark</td><td>:<%=adlm %></td>
		<tr><td>City</td><td>:<%=adcity %></td>
		<tr><td>Country</td><td>:<%=adcoun %></td>
		<tr><td>email</td><td>:<%=email %></td>
		<tr><td>Contact</td><td>:<%=contact %></td>
		<tr><td colspan="2" align="center"><a href = "admin_viewaccounts.jsp"><img  src="Images/button_view-accounts.png"></a></td></tr>
		</form>
		</table>
		 
		<!--  img src = "Images/throbber_12.gif" >     -->
        
        
<!--footer is down below-->       
        <div id="footer">
            <!--p>A PROJECT ON ONLINE BANKING SYSTEM</p-->
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>