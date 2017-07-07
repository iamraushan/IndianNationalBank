package serv;

import java.io.IOException;
import java.sql.Connection;
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

import bean.LoginCheck;

/**
 * Servlet implementation class FD
 */
@WebServlet("/FD")
public class FD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FD() {
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
		//***getting data from form and session ******
		Float amount = Float.parseFloat(request.getParameter("amount"));//getting amount from jsp filr
		
		int time = Integer.parseInt(request.getParameter("time"));//getting time in months from jsp file
		
		HttpSession session1=request.getSession(false);//Intialising session
    	String n=(String)session1.getAttribute("uid");//session is stored in n (getting from uid)
    	String s = (String)session1.getAttribute("savaccbal");
    	float savaccbal = Float.parseFloat(s);
    	String savaccno = (String)session1.getAttribute("savaccno");
    	//****interest calculation*****
 
    	if(amount<savaccbal)
    	{
    		Float maturity_amount=amount + (((amount*7*(time/12))/100));
    		savaccbal = savaccbal - amount;
    		
    		//***date and time work ***
    		LocalDate localDate = LocalDate.now();//intialisong localdate objexct from localdate class
            String currdate=DateTimeFormatter.ofPattern("dd/MMM/yy").format(localDate);//getting current date
        	String matdate = DateTimeFormatter.ofPattern("dd/MMM/yy").format(localDate.plusMonths(time));
    	
	
        	try
        	{
        		Class.forName("oracle.jdbc.driver.OracleDriver");
        		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
        		Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        		String query1 = "select * from rdca where c_id = '"+n+"'";
        		ResultSet rs1 = stmt.executeQuery(query1);
        		String ifd  = null;
        		if(rs1.next())
        		{
        			 ifd= rs1.getString(3);
        		}
        		int acc_no = 700000000;
        		if(ifd==null)//means user don't have fd account
        		{
        			String query2 = "select acc_no from fd order by acc_no";
        			ResultSet rs2 = stmt.executeQuery(query2);
        			if(rs2.last())//here we are getting account number for fd account
        			{
        				acc_no = Integer.parseInt(rs2.getString(1));
        				++acc_no;
        			}
        			System.out.print(acc_no);
        			String query3 = "insert into fd values('"+acc_no+"','"+amount+"','"+currdate+"','"+matdate+"','"+currdate+"','"+maturity_amount+"','"+amount+"')";
        			String query4 = "update accounts set balc='"+savaccbal+"' where acc_no ='"+savaccno+"'";
        			String query5 = "update rdca set fd ='"+acc_no+"' where c_id='"+n+"'";
        			//Those two are sql queries for 
        			int rs3 = stmt.executeUpdate(query3);
        			int rs4 = stmt.executeUpdate(query4);
        			int rs5 = stmt.executeUpdate(query5);
        			LoginCheck fd = new LoginCheck();
        			if(conn!=null)
        			{
        				conn.close();
        				Thread.sleep(1000);
        			}
        			if(rs3==1 && rs4 ==1 && rs5==1  && fd.setTransaction(savaccno, String.valueOf(acc_no) ,amount, savaccbal,amount))
        			{
        				String message = "FD Account created successfully ,account number is "+acc_no+"";
        				System.out.println(message);
        				HttpSession session = request.getSession();
        				session.setAttribute("msg", message);
        				response.sendRedirect("home.jsp");
        			}
        			else
        			{
        				String message = "FD account not created";
        				System.out.println(message);
        				HttpSession session = request.getSession();
        				session.setAttribute("msg", message);
        				if(conn!=null)
            			{
            				conn.close();
            				Thread.sleep(1000);
            			}
        				response.sendRedirect("home.jsp");
        				
        			}
        			
        			
        		}
        		else
        		{
        			String message = "You have already have FD";
    				System.out.println(message);
    				HttpSession session = request.getSession();
    				session.setAttribute("msg", message);
    				response.sendRedirect("home.jsp");
        			
        		}
        	}
        	catch(Exception e)
        	{
        		System.out.println(e);
        		System.out.println("Exception from FD servlet");
        		String message = "FD account not created";
				System.out.println(message);
				HttpSession session = request.getSession();
				session.setAttribute("msg", message);
				response.sendRedirect("home.jsp");
				
        		
        	}
    	
    	}
    	else
    	{
    		String message = "FD account not created";
    		System.out.println(message);
    		HttpSession session = request.getSession();
			session.setAttribute("msg", message);
			response.sendRedirect("home.jsp");
    	}
	}

}
