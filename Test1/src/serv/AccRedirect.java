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
 * Servlet implementation class AccRedirect
 */
@WebServlet("/AccRedirect")
public class AccRedirect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccRedirect() {
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
		System.out.println("Hello");
		HttpSession session = request.getSession(false);
		String acc_no = (String)session.getAttribute("vacc_no");
		int acc = Integer.parseInt(acc_no);
		System.out.println(acc);
		System.out.println(acc_no);
		String query =null;
		if(acc > 900000000)
		{
			 query = "select c_id from rdca where acc_no  = '"+acc+"'";
		}
		else if(acc<800000000 && acc>699999999)
		{
			 query = "select c_id from rdca where fd  = '"+acc+"'";

		}
		else if(acc<900000000 && acc> 799999999)
		{
			 query = "select c_id from rdca where loan  = '"+acc+"'";

		}
		else
		{
			 query = "select c_id from rdca where curr  = '"+acc+"'";

		}
		System.out.println(query);
		System.out.println("from line number 69 AccRedirect java servlet");

		try
		{
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next())
			{
				String cid = rs.getString(1);
				session.setAttribute("ad_cid", cid);
				response.sendRedirect("admin_viewclients.jsp");
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("admin_viewclients.jsp");

		}
		
	}

}
