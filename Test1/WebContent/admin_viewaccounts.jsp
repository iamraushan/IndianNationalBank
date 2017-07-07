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
        	String cid= (String)session1.getAttribute("Admincid");
        	String msg = (String)session1.getAttribute("msg");
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	if(msg!=null)
        	{
        		out.print("<script>{ alert('"+msg+"');}</script>");
        		String message = null;
        		session1.setAttribute("msg", message);
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
 <h3 align = "center" >Accounts</h3>
 
 			<form action="ViewAccount" method="post">
 			<table align ="center">
 			<tr><td>Enter </td><td><input type ="number" name="anum" min="0" value=<%=cid %> required="required"></td></tr>
 			<tr><td>Enter Account Type</td><td>
 			<select name="atype">
			<option value='accounts'>Savings</option>
			<option value='curr'>Current</option>
			<option value='loan'>Loan</option>
			<option value='fd'>Fixed Deposit</option>
			</select>
	
			<tr><td style="font-size: 12px"><input type ="radio" name="coa" value="c_id" required="required">Search with Customer id <br> </td><td style="font-size: 12px"><input type="radio" name="coa" value="acc_no" required="required">Search with Account No.</td><tr>
			<br>
			<tr><td colspan="2" align="center"><input type="image" src="Images/submit.png" height="50px" width="90px"></td></tr>
			
 			</table>
 			</form>			
       <%
       if( cid!=null)
       {
    	   cid=null;
    	   session1.setAttribute("Admincid", cid);
       }
       %>
        
        
        
<!--footer is down below-->       
        <div id="footer">
            <!--p>A PROJECT ON ONLINE BANKING SYSTEM</p-->
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>