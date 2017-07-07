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

import bean.LoginCheck;


/**
 * Servlet implementation class BreakFD
 */
@WebServlet("/BreakFD")
public class BreakFD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BreakFD() {
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
		HttpSession session=request.getSession(false);
		LoginCheck bfd = new LoginCheck();
		int fd_acc=0;
		int sav_acc=0;
    	String cid=(String)session.getAttribute("uid");
        try
        {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
    		Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
    		float abs_amount=0;
    		float sav_amount=0;
    		String query1="select * from fd where acc_no=(select fd from rdca where c_id="+cid+")";
    		String query2="select * from accounts where acc_no=(select acc_no from rdca where c_id='"+cid+"')";
    		System.out.println(query1);
    		ResultSet rs1= stmt.executeQuery(query1);
    		if(rs1.next())
    		{
    			abs_amount=Float.parseFloat(rs1.getString(7));
    			fd_acc=Integer.parseInt(rs1.getString(1));
    			
    		}
    		else
    		{
    			String message = "Transaction not successful";
    			System.out.println(message);
    			session.setAttribute("msg", message);
    			response.sendRedirect("home.jsp");
    		}
    		ResultSet rs2= stmt.executeQuery(query2);

    		if(rs2.next())
    		{
    			sav_amount=Float.parseFloat(rs2.getString(2));
    			sav_acc=Integer.parseInt(rs2.getString(1));
    			
    		}
    		else
    		{
    			String message = "Transaction not successful";
    			System.out.println(message);
    			session.setAttribute("msg", message);
    			response.sendRedirect("home.jsp");
    			
    		}
    		sav_amount=sav_amount+abs_amount;
    		String query3="update accounts set balc='"+sav_amount+"' where acc_no=(select acc_no from rdca where c_id="+cid+")";
    		int rs3= stmt.executeUpdate(query3);
    		if(rs3==1)
    		{
    			String query4="update rdca set fd='' where c_id="+cid+"";
    			int rs4=stmt.executeUpdate(query4);
    			if(rs4==1)
    			{
    				String query5="delete from fd where acc_no="+fd_acc+"";
    				int rs5 = stmt.executeUpdate(query5);
    				if(rs5==1 && bfd.setTransaction(String.valueOf(fd_acc),String.valueOf(sav_acc) ,abs_amount,0,sav_amount))
    				{
    					String message = "Transaction successful";
            			System.out.println(message);
            			session.setAttribute("msg", message);
            			if(conn!=null)
            			{
            				Thread.sleep(1000);
            				conn.close();
            			}
            			response.sendRedirect("home.jsp");
    				}
    				else
    				{
    					String message = "Transaction not successful";
            			System.out.println(message);
            			if(conn!=null)
            			{
            				Thread.sleep(1000);
            				conn.close();
            			}
            			session.setAttribute("msg", message);
            			response.sendRedirect("home.jsp");
    					
    				}
    			}
    			else
    			{
    				String message = "Transaction not successful";
        			System.out.println(message);
        			if(conn!=null)
        			{
        				Thread.sleep(1000);
        				conn.close();
        			}
        			session.setAttribute("msg", message);
        			response.sendRedirect("home.jsp");
    			}
    		}
    		else
    		{
    			String message = "Transaction not successful";
    			System.out.println(message);
    			if(conn!=null)
    			{
    				Thread.sleep(1000);
    				conn.close();
    			}
    			session.setAttribute("msg", message);
    			response.sendRedirect("home.jsp");
    			
    		}
    			
    		
    		
        	
        }
        catch(Exception e)
        {
        	System.out.println(e);
        	System.out.println("Exception from BreakFD");
    		String message = "Transaction not successful";
			System.out.println(message);
			session.setAttribute("msg", message);
			response.sendRedirect("home.jsp");
        	
        }
        
        
    	
	}

}
