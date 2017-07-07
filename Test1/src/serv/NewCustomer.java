 package serv;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class NewCustomer
 */
@WebServlet("/NewCustomer")
public class NewCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewCustomer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		//PrintWriter out = response.getWriter();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String al1 = request.getParameter("adl1");
		String al2 = request.getParameter("adl2");
		String lm = request.getParameter("adlm");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String cnry = request.getParameter("coun");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		System.out.println("Bullock point 1");
		int c_id=0;
		int acc_no=0;
		int c = 0;
		try 
		{
			
		    HttpSession session = request.getSession();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    String query1 ="select c_id from client order by c_id";
		    ResultSet rs1 = stmt.executeQuery(query1);
			System.out.println("Bullock point 2");

		    if(rs1.last())
		    {
		    	c_id = Integer.parseInt(rs1.getString(1));
		    	++c_id;
		    }
		    else
		    {
		    	c_id=1000;
		    }
		    String query12 = "select email from client where email ='"+email+"'";
		    String query13 = "select contact_no from client where contact_no ='"+contact+"' ";
		    ResultSet rs12 = stmt.executeQuery(query12);
		    String s1=null;
			System.out.println("Bullock point 3");

		    if(rs12.next())
		    {
		    s1 = (String)rs12.getString(1);
		    
		    }
		    ResultSet rs13 = stmt.executeQuery(query13);
			System.out.println("Bullock point 4");

		    String s2=null;
		    if(rs13.next())
		    {
		    s2 = (String)rs13.getString(1);
		    
		    }
			System.out.println("Bullock point 5");

		    

		    
		   // System.out.println(rs12.beforeFirst());
		    
		    //System.out.println(rs13.next());
		   if( s1==null && s2==null)
		   {
		    String query2 = "insert into client values('"+c_id+"','"+fname+"','"+lname+"','"+al1+"','"+al2+"','"+lm+"','"+city+"','"+state+"','"+cnry+"','"+email+"','12345678','"+contact+"')";
		    if(stmt.executeUpdate(query2)==1)
		    {
		    	System.out.println("Client table updated successfully ");
		    	++c;
		    }
		    else
		    {
		    	System.out.println("Client table updatation failed ");
		    }
		    String query3="select acc_no from accounts order by acc_no";
		    ResultSet rs2=stmt.executeQuery(query3);
		    if(rs2.last())
		    {
		    	acc_no=Integer.parseInt(rs2.getString(1));
		    	++acc_no;
		    }
		    else
		    {
		    	acc_no=900000000;
		    }
		    HttpSession session1=request.getSession(false);
        	String branch=(String)session1.getAttribute("branch");
        	System.out.println(branch);
        	LocalDate localDate = LocalDate.now();
	        String currdate=DateTimeFormatter.ofPattern("dd/MMM/yy").format(localDate);
		    String query4="insert into accounts values('"+acc_no+"','1000','"+currdate+"','Savings','','"+currdate+"','"+branch+"')";
		    int rs4=stmt.executeUpdate(query4);
		    if(rs4==1)
		    {
		    	System.out.println("Account table updated successfully ");
		    	++c;
		    }
		    else
		    {
		    	System.out.println("Account table updatation failed ");
		    }
		    String query5="insert into rdca values('"+c_id+"','"+acc_no+"','','','')";
		    int rs5 =stmt.executeUpdate(query5) ;
		    if(rs5==1)
		    {
		    	System.out.println("rdca table updated successfully ");
		    	++c;
		    }
		    else
		    {
		    	System.out.println("rdca table updatation failed ");
		    }
		    String message;		    	
		    
		    if(c==3)
		    {
		    	message = "Client successfully added, Client id is "+c_id+", Account number is "+acc_no+"";
				session.setAttribute("msg", message);
		    	response.sendRedirect("adminhome.jsp");
		    }
		    else
		    {
		    	message = "Client not added";
				session.setAttribute("msg", message);
		    	response.sendRedirect("adminhome.jsp");	
		    }
		   }
		   else
		   {
			   String message = "Client already exist";
				session.setAttribute("msg", message);
		    	response.sendRedirect("adminhome.jsp");
			   
		   }

		    
		}
		catch (Exception e) 
		{
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		
		
		
		
		
		
	}

}
