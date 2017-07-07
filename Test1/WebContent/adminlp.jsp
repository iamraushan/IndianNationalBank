<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Indian National Bank</title>
        <link rel="icon" href="Images/ava.ico"></link>
        <link href="Style/style.css" type="text/css" rel="stylesheet"></link>
         <%
        	HttpSession session1=request.getSession(false);
     	String msg = (String)session1.getAttribute("msg");
    	String ok = (String)session1.getAttribute("ok");
    	if(ok!="ok")
    	{
    		response.sendRedirect("index.html");
    	}
        	
        	
        	if(msg!= null)
        	{
        		out.print("<script>{ alert('"+msg+"');}</script>");
        		session1.setAttribute("msg", null);
 			}
        	//String data;
        	//data=lin.getData(n, 2);
        	
        	%>
        	<script>
    			history.forward();
    			window.oncontextmenu = function () {
    				   return false;
    				}
			</script>
    </head>
    <body>
        
        
        
        <!----This stuff down below is for navigation------>
        
     <div id="nav">
       <ul>
           <div id="nav-wrapper">
               <li><a href="adminlp.jsp "><img height="40px" width="40px" src ="Images/ava.ico"><b>Indian National Bank</b></a></li>
               <li><a href="index.jsp">Home</a></li>
               <li><a href="about.html">About</a></li>
               
               <li><a href="#">Log in as</a>
                   
                   <ul>
                        <li><a href="index.jsp">Client</a></li>
                         

                    </ul>
               </li>
               
              
               
               </li>              
           </div>
            <hr>
       </ul>
       </div>
    
       
 <!-----The Webpage is down below---------->   
        
        
        <h2 align="center">Manager Log in Portal</h2><!--  marquee behavior="slide" direction="left">Please enter your credentials to see use the web portal</marquee-->
        
       
          <form action="AdminLogin" method="post">
          
              <table align="center" >
                  <tr><td>Username:</td><td><input type="text" name="adminid" required="required"></td></tr>
                  <tr><td>Password:</td><td><input type="password" name="pwd" required="required"></td></tr>
                  <tr><td colspan="2" align="center"><input type="image" src="Images/submit.png" height="50px" width="90px"  ></td></tr>
                  
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