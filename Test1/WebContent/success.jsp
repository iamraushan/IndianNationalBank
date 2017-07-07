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
    <body>
    <%
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("uid");
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
   	%>
        
        
        
        <!----This stuff down below is for navigation------>
        
     <div id="nav">
       <ul>
           <div id="nav-wrapper">
               <li><a href="index.jsp"><img height="40px" width="40px" src ="Images/ava.ico"><b>Indian National Bank</b></a></li>
               <li><a href="home.jsp">Home</a></li>
               <li><a href="es.jsp">Mini-Statement</a></li>
               
               <li><a href="ft.jsp">Fund Transfer</a>
                   
                   
               </li>
               
               <li><a href="home.jsp"><%=lin.getData(n, 2)%></a>
                <ul>
                    <li><a href="#">Accounts</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="#">Loans</a></li>
                    <li><a href="paybills.jsp">Pay Bills</a></li>
                    <li><a href="setting.jsp">Settings</a></li>
                    <li><a href="LogOut.jsp">Log Out</a></li>
                </ul>
               
               </li>              
           </div>
            <hr>
       </ul>
       </div>
        <!--content is here-->
        <br><br><br><br>
        
        <h2 align="center" style="color:Blue">Success</h2>
        
        
        <!-----footer starts from here--->
        <div id="footer">
            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>