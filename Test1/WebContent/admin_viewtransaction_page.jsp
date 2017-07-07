<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="lin" class="bean.LoginCheck" scope="session"/>
<%@ page import ="java.sql.*" %>
<style>
    #footer2 {
   position:relative;
   bottom:0;
    font-style: italic;
    font-size: 10px;
    color: beige;
    width:100%;
   height:80px;   /* Height of the footer */
   background-color:dimgrey;
   padding-top:4px;
}

</style>
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
<%
			int i=0;
        	HttpSession session1=request.getSession(false);
        	String n=(String)session1.getAttribute("aid");
        	String month=(String)session1.getAttribute("tmonth");
        	String year=(String)session1.getAttribute("tyear");
        	 
        	//out.print(n);
        	if(n==null)
        	{
        		response.sendRedirect("adminlp.jsp");
        	}
        	else
        	{
        	String myacc=(String)session1.getAttribute("anyid");
        	String anyid=myacc;
        	String op=(String)session1.getAttribute("op");
        	Class.forName("oracle.jdbc.driver.OracleDriver");
		    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        	String query = "select * from transaction where (f_acc="+myacc+" or t_acc="+myacc+")and (to_char(t_date,'MON')='"+month+"' and to_char(t_date,'YYYY')='"+year+"') order by t_id desc";
		    ResultSet rs = stmt.executeQuery(query);
		    float balance=1000;
        	
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
    
        <!------------Main Content starts from here--------->
        <h2 align="center">View Transactions</h2>
        <form>
            <table align ="center" border="1px" style="border-collapse:collapse">
                <tr><td>Sr.no</td><td>Date</td><td>Decription</td><td>Debit</td><td>Credit</td><td>Balance</td></tr>
                <%
                while(rs.next())
                	{
                    ++i;
                	%>
                <tr><td><%=i %></td><td><%=rs.getString(2).substring(0,10) %></td><td>
                <%
                	String t = rs.getString(3);
                	String s= rs.getString(4);
                	String c=lin.isCompany(s);
                	if(c!=null)
                	{
                		out.print("Bill Payed to "+c);
                	}
                	else
                	{
                		out.println(rs.getString(6));
                	}
                
                
                
                %>
                </td><td align="right">
                <%
                		
                	if(myacc.equals(t))
                	{
                		out.print(rs.getString(5));
                		balance=Float.valueOf(rs.getString(7));
                	}
                	else
                	{
                		out.print("...");
                	}
                %>
                </td><td align="right">
                <%
                	
                	if(myacc.equals(s))
                	{
                		out.print(rs.getString(5));
                		balance=Float.valueOf(rs.getString(8));
                	}
                	else
                	{
                		out.print("...");
                	}
                 %>
               </td><td align="right">
               <%
               
               	if(myacc.equals(t))
               	{
               		out.print(rs.getString(7));
               	}
               	else
               	if(myacc.equals(s))
               	{
               		out.print(rs.getString(8));
               	}
               	else
               	{
               		out.print("...");
               	}
               %>
               </td></tr>
               <%
              
               } %>
            </table>
            <%
            if(conn!=null)
			{
				conn.close();
				Thread.sleep(1000);
			}
            
        	}
            %>
            <br>
            <!--  >br>
           <center><input type="image" src="Images/button_previous.png">
           <image src="Images/button.png">
            <input type="image" src="Images/button_next.png"></center--> 
        </form>
        
        <!-----footer starts from here--->
        <%
        if(i==0)
        {
        	String message = "No Transaction recorded";
			session.setAttribute("msg", message);
			response.sendRedirect("adminhome.jsp");
		}
        if(i>13)
        {
        	%><div id="footer2"><%
        }
        else
        {
        	%><div id="footer"><%
        }
        
        %>
        

            
        <p> Made by Raushan Kumar <br> CSE Roll no: 26 <br>
        Dipankar Barui <br>CSE Roll no:59</p>
            <b>Mentor: Sunanda Sinha</b>
            
            
        </div>
</body>
</html>