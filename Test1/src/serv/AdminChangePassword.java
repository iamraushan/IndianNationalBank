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
 * Servlet implementation class AdminChangePassword
 */
@WebServlet("/AdminChangePassword")
public class AdminChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminChangePassword() {
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
		String p1 = request.getParameter("p1");
		String p2 = request.getParameter("p2");
		HttpSession session = request.getSession();
		String aid = (String)session.getAttribute("aid");

		if(p1.equals(p2))
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
				Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				String query ="update admin set pw='"+p1+"' where a_id='"+aid+"'";
				int rs = stmt.executeUpdate(query);
				if(rs == 1)
				{
					String message = "Passwords successfully changed";
					session.setAttribute("msg", message);
					response.sendRedirect("adminhome.jsp");
				}
				else
				{
					String message = "Passwords not changed";
					session.setAttribute("msg", message);
					response.sendRedirect("adminhome.jsp");
				}
				
			}
			catch(Exception e)
			{
				System.out.println(e);
				String message = "Passwords not changed";
				session.setAttribute("msg", message);
				response.sendRedirect("adminhome.jsp");
				
			}
			
		}
		else
		{
			String message = "Passwords do not match";
			session.setAttribute("msg", message);
			response.sendRedirect("admin_changepassword.jsp");
			
		}
		
	}

}
