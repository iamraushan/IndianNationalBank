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
 * Servlet implementation class ViewAccount
 */
@WebServlet("/ViewAccount")
public class ViewAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAccount() {
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
		String op = request.getParameter("coa");//from radio buttom 
		String type = request.getParameter("atype");//type of account
		String anum = request.getParameter("anum");//Number which we are getting from form (cd b c_id or acc_no)
		String actype=type;
		HttpSession session = request.getSession();
		session.setAttribute("actype", actype);
		String query1;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","1234");
			Statement stmt  = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			if(op.equals("c_id"))
			{
				
				if( type.equals("accounts"))
				{
					actype = "acc_no";
				}
				query1= "select * from "+type+" where acc_no = (select "+actype+" from rdca where c_id='"+anum+"')";
			}
			else
			{
				query1="select * from "+type+" where acc_no = '"+anum+"'";
			}
				System.out.println(query1);
				ResultSet rs1 = stmt.executeQuery(query1);
				if(rs1.next())
				{
					String acc_no,balc,in_date,mat_date,loan_type,rate,branch;
					if(type.equals("accounts"))
					{
						//System.out.println("From accounts line no 77");
						acc_no=rs1.getString(1);
						balc = rs1.getString(2);
						in_date = rs1.getString(6).substring(0,10);
						branch = rs1.getString(7);
						session.setAttribute("vacc_no", acc_no);
						session.setAttribute("vbalc", balc);
						session.setAttribute("vindate", in_date);
						session.setAttribute("vbranch", branch);
						response.sendRedirect("admin_show_account.jsp");
						
					}
					else if(type.equals("curr"))
					{
						acc_no=rs1.getString(1);
						balc = rs1.getString(2);
						in_date = rs1.getString(6).substring(0,10);
						branch = rs1.getString(7);
						session.setAttribute("vacc_no", acc_no);
						session.setAttribute("vbalc", balc);
						session.setAttribute("vindate", in_date);
						session.setAttribute("vbranch", branch);
						response.sendRedirect("admin_show_account.jsp");
						
					}
					else if(type.equals("fd"))
					{
						
						System.out.println("fd");
						response.sendRedirect("admin_viewaccounts.jsp");
					}
					else
					{
						acc_no=rs1.getString(1);
						balc = rs1.getString(2);
						in_date = rs1.getString(6).substring(0,10);
						mat_date = rs1.getString(5).substring(0,10);
						loan_type= rs1.getString(8);
						rate =rs1.getString(9);
						session.setAttribute("vacc_no", acc_no);
						session.setAttribute("vbalc", balc);
						session.setAttribute("vindate", in_date);
						session.setAttribute("vmatdate", mat_date);
						session.setAttribute("vloantype", loan_type);
						session.setAttribute("vrate", rate);
						response.sendRedirect("admin_show_loanacc.jsp");
						
					}
				}
				else
				{
					String message = "Not Found";
					session.setAttribute("msg", message);
					response.sendRedirect("admin_viewaccounts.jsp");
				}

			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		
	}

}
