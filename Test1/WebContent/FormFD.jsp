<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="lin" class="bean.LoginCheck" scope="session">
    </jsp:useBean> 
            <%@ page import="java.sql.*" %>
    
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
<body>

<%
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("uid");
        	String message = (String)session1.getAttribute("message");
        	//out.print(n);
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	
 %>
 
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
        <%
        message = null;
        String name=null;
        String al1=null;
        String al2=null;
        String al3=null;
        String coun =null;
        String email=null;
        request.getSession().setAttribute("message", message);
        Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		String query="select * from client where c_id="+n+"";
		ResultSet rs= stmt.executeQuery(query);
		if(rs.next())
		{
			name=rs.getString(2)+" "+rs.getString(3);
			al1=rs.getString(4)+" , "+rs.getString(5);
			al2=rs.getString(6)+" , "+rs.getString(7);
			al3=rs.getString(8);
			coun=rs.getString(9);
			email=rs.getString(10);
			
		}
        %>

<h2 align="center">Fixed Deopsit</h2>
<!--  p align = "center" style="color:red" >Please fill out the form</p-->
<form action ="FD" method="post">
<table align ="center">
	<tr><td>Name</td><td>:<%=name%></td></tr>
	<tr><td>Address</td><td>:<%=al1%> </td></tr>
               					<tr ><td ></td><td>&nbsp<%=al2 %></td></tr>
               					<tr><td ></td><td>&nbsp<%=al3 %></td></tr>
    <tr><td>Country</td><td>:<%=coun %></td></tr>
    <tr><td>email</td><td>:<%=email %></td></tr>
    <tr><td>Amount</td><td><input type="number" name ="amount" min ="1000" required="required">INR</td></tr>
    <tr><td>Period</td><td><input type="number" name = "time" step ="6" min="6" required="required">Months</td></tr>
    <tr><td><br></td><td></td></tr>
    <tr><td colspan="2" align = "center"><input type="image" src="Images/button_submit.png"></td></tr>
	
	
</table>
</form>
<!-----footer starts from here--->
    

        <div id="footer">
            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>


</body>
</html>