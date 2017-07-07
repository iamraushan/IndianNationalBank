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
        	
			String msg = (String)session1.getAttribute("msg");
        	if(msg!= null)
        	{
        		out.print("<script>{ alert('"+msg+"');}</script>");
        		session1.setAttribute("msg", null);
 			}
        	String cid = (String)session1.getAttribute("ad_cid");
        	if(cid!=null)
        	{
        		session1.setAttribute("ad_cid", null);

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
		<form action="ViewClient" method="post">
		<table align="center">
		<tr><td>Enter Client id</td><td><input type="number" name="cid" min="0" value =<%=cid %>></td>
		<tr><td colspan="2" align="center"><input type="image" src="Images/submit.png" height="40px" width="80px"></td></tr>
		
		</table>
		</form> 
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