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
        	String cid= (String)session1.getAttribute("Admincid");
        	
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	String msg= (String)session1.getAttribute("msg");
        	if(msg!= null)
        	{
        		out.print("<script>{ alert('"+msg+"');}</script>");
        		session1.setAttribute("msg", null);
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
 		<h3 align ="center">View Transactions</h3>
		<form action="AdminViewTransaction" method="post">
		<table align="center">
		<tr><td> ID/Acc</td><td><input type ="number" min="0" name="anyid" required="required" value=<%=cid %>></td>
		<tr><td style="font-size: 12px"><input type ="radio" name="coa" value="c_id" required="required">Search with Customer id <br> </td><td style="font-size: 12px"><input type="radio" name="coa" value="acc_no" required="required">Search with Account No.</td><tr>
		 <tr><td>
        	<select required="required" name="month">
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
        	<select required="required" name="year">
        	<option value="">Select Year</option>
        	<option value="2017">2017</option>
        	<option value="2016">2016</option>
        	<option value="2015">2015</option>
        	</select>
        	</td>
        	</tr>
		<tr><td colspan="2" align="center"><input type="image" src="Images/submit.png" height="40px" width="80px"></td></tr>
		
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