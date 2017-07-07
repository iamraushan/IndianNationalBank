package serv;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ModifyCustomer
 */
@WebServlet("/ModifyCustomer")
public class ModifyCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCustomer() {
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
		String cid = request.getParameter("cid");
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
		
		
		String query1= "select * from client where email='"+email+"' and c_id<>'"+cid+"'";
		String query2= "select * from client where contact_no='"+contact+"' and c_id<>'"+cid+"'";
		
		try
		{
			HttpSession session = request.getSession();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
		    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		    ResultSet rs1 = stmt.executeQuery(query1);
		    String cemail = null;
		    if(rs1.next())
		    {
		    	 cemail = rs1.getString(1);
		    }
		    if(cemail == null)
		    {
		    	ResultSet rs2 = stmt.executeQuery(query2);
		    	String ccontact = null;
		    	if(rs2.next())
		    	{
		    		ccontact = rs2.getString(1);
		    	}
		    	if(ccontact == null)
		    	{
		    		String query3 = "update client set c_f_name='"+fname+"',c_l_name='"+lname+"',c_ad_l1='"+al1+"',c_ad_l2='"+al2+"',c_ad_landmark='"+lm+"',c_ad_city='"+city+"',c_ad_state='"+state+"',c_ad_country='"+cnry+"',email='"+email+"',contact_no='"+contact+"' where c_id='"+cid+"'";
		    		int rs3 = stmt.executeUpdate(query3);
		    		if(rs3 == 1)
		    		{
		    			String message = "Client updated successfully";
		    			System.out.println(message);
		    			session.setAttribute("msg", message);
				    	response.sendRedirect("adminhome.jsp");
		    		}
		    		else
		    		{
		    			String message = "Client updation failed";
		    			System.out.println(message);
		    			session.setAttribute("msg", message);
				    	response.sendRedirect("adminhome.jsp");
		    		}
		    	}
		    	else
		    	{
		    		String message = "Another client has same contact";
			    	System.out.println(message);
			    	session.setAttribute("msg", message);
			    	response.sendRedirect("adminhome.jsp");
		    	}
		    	
		    }
		    else
		    {
		    	String message = "Another client has same email id";
		    	System.out.println(message);
		    	session.setAttribute("msg", message);
		    	response.sendRedirect("adminhome.jsp");
		    }
			
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			String message = "Client updation failed EXCEPTION failure";
			System.out.println(message);
			HttpSession session = request.getSession();
			session.setAttribute("msg", message);
	    	response.sendRedirect("adminhome.jsp");
			
		}
		
		
		
	}

}
