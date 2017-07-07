<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="lin" class="bean.LoginCheck" scope="session">
    </jsp:useBean> 
            <%@ page import="java.sql.*" %>
            <%@ page import="java.util.Date" %>
        <%@ page import="java.text.DateFormat" %>
        <%@ page import ="java.text.SimpleDateFormat" %>
        <%@ page import ="java.util.Formatter" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Indian National Bank</title>
	<link rel="icon" href="Images/ava.ico">
    <link href="Style/style.css" type="text/css" rel="stylesheet"/>
     <script type="text/javascript">
    window.oncontextmenu = function () {
		   return false;
		}</script>
</head>
<%
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("uid");
        	//out.print(n);
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	
    		String acc_no=null;
            String principal=null;
            String in_date=null;
            int datediff=0;
            String rate=null;
            String mat_date=null;
            String mat_amount=null;
            String abs_amount=null;
            long  mon=0;
            
            try
            {
            String query ="select * from fd where acc_no =(select fd from rdca where c_id="+n+")";
        	Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
    		Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
    		ResultSet rs = stmt.executeQuery(query);
    			if(rs.next())
    			{
    				acc_no=rs.getString(1);
    				principal=rs.getString(2);
    				in_date=rs.getString(5);
    				Date id = new SimpleDateFormat("yy/MM/dd HH:mm:ss").parse(in_date);
    				rate="7";
    				mat_date=rs.getString(4);
    				Date md = new SimpleDateFormat("yy/MM/dd HH:mm:ss").parse(mat_date);
    				datediff=md.compareTo(id);
    				Date m1 = new SimpleDateFormat("yy/MM/dd").parse(in_date);
    				//out.print(m1);
    				//out.println(in_date.substring(0,2));
    			   // mon =(( m2 - m1 + 1)/(24 * 60 * 60));
    				//mon = 
    				
    				mat_amount=rs.getString(6);
    				abs_amount=rs.getString(7);
    				in_date=in_date.substring(0,10);
    				mat_date=mat_date.substring(0,10);
    				
    				
    				
    			}
    			else
    			{
    				String message = "FD do not exist";
    				session.setAttribute("msg", message);
    	        	response.sendRedirect("home.jsp");
    			}
            }
            catch(Exception e)
            {
            	
            	String message = "FD do not exist ERR L96";
    			session.setAttribute("msg", message);
            	response.sendRedirect("home.jsp");
            }
    	
        	
        	
            
         
            
            %>
<body>


 
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
        <!--  p align = "center" ><if(message!=null){out.print(message);} %>p-->
        

 
        <h3 align = "center">View Fixed Deposit</h3>
        
            <table align="center" border="1px" style="border-collapse:collapse;font-size: 18px">
                <tr><td><b>Account Number</td><td><b>Pricipal</td><td><b>Start Date</td><td><b>Years</b></td>
                <td><b>Rate</b></td>
                <td><b>Maturity Date</b></td>
                <td><b>Maturity Amount</b></td>
                <td><b>Absolute Amount</b></td>
                </tr>
                <tr>
                <td><%=acc_no %></td><td><%=principal %></td>
                <td><%=in_date %></td><td><%=datediff %></td>
                <td><%=rate %></td>
                <td><%=mat_date %></td>
                <td><%=mat_amount %></td>
                <td><%=abs_amount %></td>
                
                </tr>
            </table>
           <br>
			<form action="BreakFD" method="post">
			<center><input type="image" src="Images/button_break-fd.png"></center>
			</form>        
<!-----footer starts from here--->
    

        <div id="footer">
            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>


</body>
</html>