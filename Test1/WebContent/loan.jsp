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
        <%@ page import="java.util.Date" %>
        <%@ page import="java.text.DateFormat" %>
        <%@ page import ="java.text.SimpleDateFormat" %>
        <%@ page import ="java.util.Formatter" %>
        
        <%
			java.util.Formatter formatter = new java.util.Formatter();
        	int datediff=0;
        	int acc_no=0;
        	float left=0;
        	float paid=0;
        	String mat_date=null;
        	String in_date=null;
        	Date id=null;
        	Date md=null;
        	String type=null;
        	float rate=0;
        	float emi=0;
        	float principal=0;
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("uid");
        	if(n==null)
        	{
        		response.sendRedirect("index.jsp");
        	}
        	if(n!=null ){
        	
        	int uid = Integer.parseInt(n);//user id
        	String query ="select * from loan where acc_no =(select loan from rdca where c_id="+uid+")";
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
			{
				acc_no=Integer.parseInt(rs.getString(1));
				left = Float.parseFloat(rs.getString(2));
				mat_date=rs.getString(5);
				md=new SimpleDateFormat("dd/MM/yyyy").parse(mat_date);
				in_date=rs.getString(6);
				id=new SimpleDateFormat("dd/MM/yyyy").parse(in_date);
				type=rs.getString(8);
				rate=Float.parseFloat(rs.getString(9));
				emi=Float.parseFloat(rs.getString(10));
				principal=Float.parseFloat(rs.getString(12));
				datediff=md.compareTo(id);
				paid=(principal +((principal*rate*datediff)/100))-left;
				in_date=in_date.substring(0,10);
				mat_date=mat_date.substring(0,10);
				
			}
			else
			{
				String message = "Loan Account do not exist";
				session.setAttribute("msg", message);
				response.sendRedirect("home.jsp");
			}}
        	
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
                	  <li><a href="ds.jsp">Detail-Statement</a></li>
                	</ul>
                	</li>
                <li><a href="#">Payments</a>
                	<ul>
                	 <li><a href="ft.jsp">Fund Transfer</a>
                	 <li><a href="paybills.jsp">Pay Bills</a></li>
                	</ul>
 			 </li>
               
               <li><a href="home.jsp"><%String cname = (String)session1.getAttribute("cname"); out.print(cname);%></a>
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
        
        <h3 align = "center">Loan</h3>
        
            <table align="center" border="1px" style="border-collapse:collapse;font-size: 18px">
                <tr><td><b>Type</td><td><b>Account Number</td><td><b>Pricipal</td><td><b>Start Date</td><td><b>Years</b></td><td><b>EMI</b></td><td><b>Paid</b></td>
                <td><b>Left</b></td>
                <td><b>Rate</b></td>
                <td><b>Maturity Date</b></td>
                </tr>
                <tr>
                <td><%=type %></td><td><%=acc_no %></td><td><%=principal %></td><td><%=in_date %></td><td><%=datediff %></td><td><%=emi %></td>
                <td><%out.println(formatter.format("%.2f", paid));%></td>
                <td><%=left %></td>
                <td><%=rate %></td>
                <td><%=mat_date %></td>
                
                </tr>
            </table>
        
  <!--    <a href="FormFD.jsp"><img src="Images/button_open-fixed-diposit.png"></a> -->
        <!-----footer starts from here--->
        <div id="footer">
            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
    </body>
</html>