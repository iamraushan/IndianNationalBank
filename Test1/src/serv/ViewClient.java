package serv;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class ViewClient
 */
@WebServlet("/ViewClient")
public class ViewClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewClient() {
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
		HttpSession session = request.getSession();
		session.setAttribute("Admincid", cid);
		String fname,lname,adl1,adl2,adlm,adcity,adstate,coun,email,contact;
		try
		{

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String query="select * from client where c_id='"+cid+"'";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
			{
				fname=rs.getString(2);
				lname=rs.getString(3);
				adl1=rs.getString(4);
				adl2=rs.getString(5);
				adlm=rs.getString(6);
				adcity=rs.getString(7);
				adstate=rs.getString(8);
				coun=rs.getString(9);
				email=rs.getString(10);
				contact=rs.getString(12);
				session.setAttribute("Adminfname", fname);
				session.setAttribute("Adminlname",lname);
				session.setAttribute("Adminadl1", adl1);
				session.setAttribute("Adminadl2", adl2);
				session.setAttribute("Adminadlm", adlm);
				session.setAttribute("Adminadcity", adcity);
				session.setAttribute("Adminadstate", adstate);		
				session.setAttribute("Admincoun", coun);
				session.setAttribute("Adminemail", email);
				session.setAttribute("Admincontact", contact);
				response.sendRedirect("admin_viewclients_page.jsp");
		
			}
			else
			{
				String message="Not Found";
				HttpSession session1 = request.getSession();
				session1.setAttribute("msg", message);
				response.sendRedirect("admin_viewclients.jsp");
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
