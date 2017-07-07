package serv;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		try{
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

		//above three line is for connecting jsp to oracle database
		String email = request.getParameter("uname");//recives email
		String pw = request.getParameter("passw");//recievs password
		
		String query="select * from client where c_id='"+email+"' and pw='"+pw+"'";//sql query
		ResultSet rs = stmt.executeQuery(query);//runnning sql query
		
		
			if (rs.next())
			{
				String id=rs.getString(1);//getting customer id from sql query
				HttpSession session=request.getSession();//setting session variable
				session.setAttribute("uid",id);//copying id into session named uid
				response.sendRedirect("home.jsp");//sending user to home page
			}
			else
			{
				String message = "Login Failed UNAUTHORISED ACCESS";
				System.out.println(message);
				HttpSession session = request.getSession();
				session.setAttribute("msg", message);
				response.sendRedirect("index.jsp");
				//response.sendRedirect("failed.jsp");//fail page
			}
		}
		catch(Exception e)
		{
			out.println(e);//view any exception
			System.out.println(e);
			String message = "Server Failure";
			System.out.println(message);
			HttpSession session = request.getSession();
			session.setAttribute("msg", message);
			response.sendRedirect("index.jsp");
		}
		
	}

}
