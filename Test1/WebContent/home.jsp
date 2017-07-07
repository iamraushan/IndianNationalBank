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
     <script type="text/javascript">
    window.oncontextmenu = function () {
		   return false;
		}</script>
    <body>
        
        
        <%@ page import="java.sql.*" %>
        
        <%
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("uid");
        	String client_name=lin.getData(n, 2);
        	session1.setAttribute("cname", client_name);
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	String savaccbal = lin.getAccDetails(n, 2, 0);
        	String savaccno = lin.getAccDetails(n, 1, 0);
        	session1.setAttribute("savaccbal", savaccbal);
        	session1.setAttribute("savaccno", savaccno);
        	String msg = (String)session1.getAttribute("msg");
        	String date_started=null;
        	String branch=null;
        	if(n!=null){
        	date_started=lin.getAccDetails(n, 6, 0).substring(0,10);
        	branch=lin.getAccDetails(n, 7, 0);
        	}

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
               <li><a href="home.jsp"><img height="40px" width="40px" src ="Images/ava.ico"><b>Indian National Bank</b></a></li>
                <li><a href="home.jsp">Accounts</a>
                	<ul>
                	 <li><a href="FormFD.jsp">Fixed Deposit</a></li>
					<li><a href="ViewFD.jsp">View FD</a></li>                	
					  <li><a href="loan.jsp">Loans</a></li>
                	  <li><a href="es.jsp">Mini-Statement</a></li>
                 	  <li><a href="ds.jsp">Detail Statement</a></li>
                	  
                	</ul>
                	</li>
                <li><a href="#">Payments</a>
                	<ul>
                	 <li><a href="ft.jsp">Fund Transfer</a>
                	 <li><a href="paybills.jsp">Pay Bills</a></li>
                	</ul>
 			 </li>
               
               <li><a href="home.jsp"><% String cname = (String)session1.getAttribute("cname"); out.print(cname);%></a>
                <ul>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="setting.jsp">Settings</a></li>
                    <li><a href="LogOut.jsp">Log Out</a></li>
                </ul>
               
               </li>              
           </div>
            <hr>
       </ul>
       </div>
        <!------------Main Content starts from here--------->
        
        <h2 align = "center">Welcome <%=client_name %></h2>
        <form>
            <table align="center" border="1px" style="border-collapse:collapse;font-size: 18px">
                <tr><td>Account Number<td><b>Currency</td><td><b>Account Balance</td><td><b>Date Started</td><td><b>Branch</b></td></tr>
                <tr><td><%=savaccno %></td><td>INR</td><td align="right"><%=savaccbal %></td><td><%=date_started %></td><td><%=branch %></td></tr>
            </table>
        </form>
  <!--    <a href="FormFD.jsp"><img src="Images/button_open-fixed-diposit.png"></a> -->
        <!-----footer starts from here--->
        <div id="footer">
            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>