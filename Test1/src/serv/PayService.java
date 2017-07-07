package serv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.LoginCheck;

/**
 * Servlet implementation class PayService
 */
@WebServlet("/PayService")
public class PayService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PayService() {
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
		String sacc=request.getParameter("company");//companies account number
		String amount=request.getParameter("amount");//amount to be transacted 
		System.out.println("amount="+amount);
		System.out.println("Company account number "+sacc);
		String client=request.getParameter("id");//clients id like phone number or electricity bill number
		HttpSession session1=request.getSession(false);//
    	String uid=(String)session1.getAttribute("uid");//getting clients id
    	LoginCheck acc = new LoginCheck();//making new instance of class of LoginCheck
    	String facc= acc.getAccDetails(uid, 1, 0);//getting from account number from uid
    	if(acc.isEliglible(facc, amount) && !amount.isEmpty() && !client.isEmpty() && !sacc.isEmpty())//checking facc is eligible and is amount is empty and is client is empty
    	{
    		float smon=Float.valueOf(acc.accounts(sacc, 2));//getting amount of company 
    		float cmon=Float.valueOf(acc.accounts(facc,2));//fetting amount of client
    		float money= Float.valueOf(amount);//money to be transfered in float
    		smon=smon+money;
    		cmon=cmon-money;
    		if(acc.updateAccounts(sacc, smon) && acc.updateAccounts(facc, cmon) && acc.setTransaction(facc, sacc, money, cmon, smon))
    		{
    			String message = "Bill Payment Successful";
				System.out.println(message);
				HttpSession session = request.getSession();
				session.setAttribute("msg", message);
				response.sendRedirect("home.jsp");
    		}
    		else
    		{
    			String message ="Payment failed ERR-Upadate and transaction falied" ;
				System.out.println(message);
				HttpSession session = request.getSession();
				session.setAttribute("msg", message);
				response.sendRedirect("home.jsp");
    		}
    		
    	}
    	else
    	{
    		String message ="Payment failed ERR-Eligibility failure";
			System.out.println(message);
			HttpSession session = request.getSession();
			session.setAttribute("msg", message);
			response.sendRedirect("home.jsp");
    	}
    	
    	
		
	}

}
