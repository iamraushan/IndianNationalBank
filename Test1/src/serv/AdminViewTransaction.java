package serv;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class AdminViewTransaction
 */
@WebServlet("/AdminViewTransaction")
public class AdminViewTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminViewTransaction() {
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
		HttpSession session = request.getSession();
		String anyid=request.getParameter("anyid");
		String op= request.getParameter("coa");
		String month= request.getParameter("month");
		String year= request.getParameter("year");
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
	    Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
		if(op.equals("c_id"))
    	{
    		String query0="select acc_no from rdca where c_id="+anyid+"";
    		ResultSet rs0 = stmt.executeQuery(query0);
    		if(rs0.next())
    		{
    			anyid=rs0.getString(1);
    		}
    		else
    		{
    			String message="User do not exist";
    			session.setAttribute("msg", message);
				response.sendRedirect("adminhome.jsp");
    		}
    	}
    	else
    	{
    		String query001="select * from rdca where acc_no ="+anyid+"";
    		ResultSet rs001=stmt.executeQuery(query001);
    		if(!rs001.isBeforeFirst())
    		{
    			String message="Account do not exist";
    			session.setAttribute("msg", message);
				response.sendRedirect("adminhome.jsp");
    		}
    	}
		session.setAttribute("anyid", anyid);
		session.setAttribute("op", op);
		session.setAttribute("tmonth", month);
		session.setAttribute("tyear", year);
		response.sendRedirect("admin_viewtransaction_page.jsp");
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		
		
	}

}
