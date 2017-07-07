<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lin" class="bean.LoginCheck" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
             String name=null;
             String al1=null;
             String al2=null;
             String al3=null;
             String coun =null;
             String email=null;
             String cont=null;
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
     			cont=rs.getString(12);
     			
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
               <h3 align = "center">Profile</h3>
               <table align ="center">
               <tr><td>Name</td><td>:<%=name%></td></tr>
				<tr><td>Address</td><td>:<%=al1%> </td></tr>
               					<tr ><td ></td><td>&nbsp<%=al2 %></td></tr>
               					<tr><td ></td><td>&nbsp<%=al3 %></td></tr>
    			<tr><td>Country</td><td>:<%=coun %></td></tr>
    			<tr><td>email</td><td>:<%=email %></td></tr>
    			<tr><td>Contact Number</td><td>:<%=cont %></td></tr>
                              
               </table>
               
               
        <!-----footer starts from here--->
        <div id="footer">
            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>

</body>
</html>