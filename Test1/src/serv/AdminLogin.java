package serv;

import java.io.IOException;
import java.sql.CallableStatement;
//import java.io.PrintWriter;
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

import bean.LoginCheck;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		//System.out.println("The program is served in AdminLogin servlet");
		String id = request.getParameter("adminid");
		String pw = request.getParameter("pwd");
		try
		{
			LoginCheck l1 =new LoginCheck();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String query0="{call loan_cal}";
			String query01="{call fd_cal}";
			String query02="{call fd_trans}";
			CallableStatement st = conn.prepareCall(query0);
			st.execute();
			CallableStatement st1 = conn.prepareCall(query01);
			st1.execute();
			CallableStatement st2 = conn.prepareCall(query02);
			st2.execute();

			
			int rs0 = stmt.executeUpdate(query0);
			if(rs0==1)
			{
				System.out.println("Procedure excuted");
			}
			
			
			
					String query = "select * from admin where a_id = '"+id+"' and pw = '"+pw+"'";
					ResultSet rs = stmt.executeQuery(query);
					if(rs.next())
					{
						String aid = rs.getString(1);
						HttpSession session = request.getSession();
						session.setAttribute("aid", aid);
						String branch = l1.getAdminData(aid, 12);
						session.setAttribute("branch", branch);
						System.out.println("Log in successful");
						if(conn!=null && !conn.isClosed())
						{
							conn.close();
							Thread.sleep(1000);
						}
					
						response.sendRedirect("adminhome.jsp");
					//window.location.href = "adminhome.jsp";
				


				}
				else
				{
					String message = "Wrong username or password  UNAUTHORISED ACCESS";
					System.out.println("Error in Admin Login");
					HttpSession session = request.getSession();
					if(conn!=null && !conn.isClosed())
					{
						conn.close();
						Thread.sleep(1000);
					}
					session.setAttribute("msg",message );
					response.sendRedirect("adminlp.jsp");
					
					
				}
			
		
			
		}
		catch(Exception e)
		{
			String message = "Wrong username or password  UNAUTHORISED ACCESS";
			System.out.println("Error in Admin Login");
			HttpSession session = request.getSession();
			
			session.setAttribute("msg",message );
			response.sendRedirect("adminlp.jsp");
			
			
			System.out.println(e);

			
		}
		
		
	}

}
