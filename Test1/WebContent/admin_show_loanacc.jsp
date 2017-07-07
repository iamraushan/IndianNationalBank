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
    
    
    <%@ page import="java.sql.*" %>
        
        <%
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("aid");
        	String msg = (String)session1.getAttribute("msg");
        	
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	
        	if(msg!=null)
        	{
        		out.print("<script>{ alert('"+msg+"');}</script>");
        		session1.setAttribute("msg", null);
 			}
        	
        
			
			String acc_no= (String)session1.getAttribute("vacc_no");
			String balc= (String)session1.getAttribute("vbalc");
			String in_date= (String)session1.getAttribute("vindate");
			String mat_date= (String)session1.getAttribute("vmatdate");
			String loan_type= (String)session1.getAttribute("vloantype");
			String rate= (String)session1.getAttribute("vrate");
        
			
        	//String data;
        	//data=lin.getData(n, 2);
        	
        	%>
        
        </head>
    <body>
        
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
        <h3 align = "center">Loan Account Details</h3>
        <form action="AccRedirect" method="post">
        <table align= "center" border="1px" style="border-collapse:collapse;">
        	<tr><td><b>Account Number</td><td><b>Balance</td><td><b>Date Created</td><td><b>Maturity Date</td><td><b>Loan Type</td><td><b>Rate</td></tr>
        	<tr><td><%=acc_no %></td><td><%=balc %></td><td><%=in_date %></td><td><%=mat_date %></td><td><%= loan_type%></td><td><%=rate %></td></tr>
        	
        	
        	
        </table>
        <br>
       <center><input type="image" src="Images/button_view-clients.png" ></center>
        </form>
        <br>
        
        
        
<!--footer is down below-->       
        <div id="footer">
            <!--p>A PROJECT ON ONLINE BANKING SYSTEM</p-->
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>