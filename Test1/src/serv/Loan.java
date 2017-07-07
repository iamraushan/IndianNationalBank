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


/**
 * Servlet implementation class Loan
 */
@WebServlet("/Loan")
public class Loan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Loan() {
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
		String c_id = request.getParameter("c_id");
        HttpSession session = request.getSession();
		String message;
		float principl = Float.parseFloat(request.getParameter("amount"));
		int rate = Integer.parseInt(request.getParameter("rate"));
		int time = Integer.parseInt(request.getParameter("time"));
		int acc_no;
		float amount;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			String query001 = "select * from client where c_id='"+c_id+"'";
			ResultSet rs001 = stmt.executeQuery(query001);
			if(rs001.next()!=false)//cheching whether customer exist or not
			{
				Thread.sleep(1000);

				System.out.println("Customer exists");
		
				String query0 = "select loan from rdca where c_id='"+c_id+"'";
				ResultSet rs0 = stmt.executeQuery(query0);
				if(rs0.next()!=false && rs0.getString("loan")==null) //checking whther customer has loan account or not
				{
					System.out.println("Customer doesn't have loan account");
			
					LocalDate localDate = LocalDate.now();
					String currdate=DateTimeFormatter.ofPattern("dd/MMM/yy").format(localDate);
					System.out.println(currdate);
					String matdate =DateTimeFormatter.ofPattern("dd/MMM/yy").format(localDate.plusMonths(time));
					System.out.println(matdate);
					
					String branch=(String)session.getAttribute("branch");
					float interest=(float) ((principl*rate*(time/(12.0))/100));
					amount = principl+ interest;
					double mamnt= amount/time;
					String query01 = "select balc from  accounts where acc_no=(select acc_no from rdca where c_id='"+c_id+"' )";
					ResultSet rs01 = stmt.executeQuery(query01);
					if(rs01.next()!=false)
					{
						if(Double.parseDouble(rs01.getString(1))>mamnt)//check whther customer has sufficient amount of money or not
						{
							System.out.println("Customer eligible for loan");
	
							String query1="select acc_no from loan order by acc_no";
							ResultSet rs1 = stmt.executeQuery(query1);
							if(rs1.last())
							{
								acc_no=Integer.parseInt(rs1.getString(1));
								++acc_no;
			
							}
							else
							{
								acc_no=800000000;
							}
		
							String type;
							if(rate==4)
							{
								type="EDU";
							}
							else if( rate == 5)
							{
								type="HME";
							}
							else if(rate == 3)
							{
								type="HLT";
							}
							else if(rate == 7)
							{
								type="CAR";
							}
							else if(rate == 8)
							{
								type ="PER";
							}
							else
							{
								type="ERR";
							}
					
						System.out.println(type);
					
						String query2 = "insert into loan values('"+acc_no+"','"+amount+"','"+currdate+"','1','"+matdate+"','"+currdate+"','"+branch+"','"+type+"','"+rate+"','"+mamnt+"','1','"+principl+"')";
						int c=0;
						if(stmt.executeUpdate(query2)==1)
						{
							System.out.println("Account successfully updated");
							c++;
						}
						else
						{
							System.out.println("Account insertion failed");
						}
					String query3 = "update rdca set loan='"+acc_no+"' where c_id='"+c_id+"'";
					if(stmt.executeUpdate(query3)==1)
					{
						System.out.println("RDCA successfully updated");
						c++;
					}
					else
					{
						System.out.println("RDCA not updated");
					}
		
					if(c==2)
					{
						message = "Loan account successfully created, account number is "+acc_no+"";
						session.setAttribute("msg", message);
						response.sendRedirect("adminhome.jsp");
						System.out.println(message);
					}
					else
					{
						message = "Loan account not created";
						session.setAttribute("msg", message);
						response.sendRedirect("adminhome.jsp");	
						System.out.println(message);
					}
		
		
		
				}
			
				else
				{
					message = "Client does not have suffiecient amount of money";
					session.setAttribute("msg", message);
					response.sendRedirect("adminhome.jsp");
					System.out.println(message);
				}
						
						
			}
			else
			{
				message = "Error in getting information";
				session.setAttribute("msg", message);
				response.sendRedirect("adminhome.jsp");
				System.out.println(message);
			}
				
		}
		else
		{
			message = "Client already have an loan account";
			session.setAttribute("msg", message);
	    	response.sendRedirect("adminhome.jsp");
	    	System.out.println(message);
		}
		}
		else
		{
			message = "Client do not exist";
			session.setAttribute("msg", message);
	    	response.sendRedirect("adminhome.jsp");//alert not showing ix that
	    	System.out.println(message);
			
		}
		
		
		
		
		}
		catch(Exception e)
		{
			message = "Server Error";
			session.setAttribute("msg", message);
	    	response.sendRedirect("adminhome.jsp");//alert not showing ix that
			System.out.println(e);
			System.out.println("Exception from Loan servlet");
		}
		
		
	}

}
