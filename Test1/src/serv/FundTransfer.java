package serv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.LoginCheck;
//import javafx.scene.control.Tab;

/**
 * Servlet implementation class FundTransfer
 */
@WebServlet("/FundTransfer")
public class FundTransfer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FundTransfer() {
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
		try{
		String amount=request.getParameter("amnt");
		String toacc=request.getParameter("toacc");
		HttpSession session1=request.getSession(false);
    	String uid=(String)session1.getAttribute("uid");
		String facc;
		LoginCheck acc = new LoginCheck();
		facc=acc.getAccDetails(uid, 1, 0);
		System.out.println("from account"+facc);
		System.out.println("To account"+toacc);
		//if(Integer.valueOf(toacc)+1 !=Integer.valueOf(facc)+1)
		
		if(!toacc.equals(facc) && acc.isEliglible(facc,amount)  && acc.isExist(toacc))
		{
			float fbalnc =Float.valueOf(acc.accounts(facc, 2));
			float tbalnc=Float.valueOf(acc.accounts(toacc, 2));
			float money = Float.valueOf(amount);
			fbalnc=fbalnc-money;
			tbalnc=tbalnc+money;
			if(acc.updateAccounts(facc, fbalnc) && acc.updateAccounts(toacc, tbalnc) && acc.setTransaction(facc, toacc, money,fbalnc,tbalnc))
			{
				
				//response.sendRedirect("success.jsp");
				String message = "Amount "+amount+"INR successfully transfered";
				System.out.println(message);
				HttpSession session = request.getSession();
				session.setAttribute("msg", message);
				response.sendRedirect("home.jsp");
			}
			else
			{
				String message = "Fund Transfer failed";
				System.out.println(message+"point 76");
				HttpSession session = request.getSession();
				session.setAttribute("msg", message);
				response.sendRedirect("home.jsp");
			}
		}
		else
		{
			String message = "Fund Transfer failed ERR-Parameters do not matched";
			System.out.println(message+"point 85");
			HttpSession session = request.getSession();
			session.setAttribute("msg", message);
			response.sendRedirect("home.jsp");
		}
		
		}
		catch(Exception e)
		{
			System.out.println(e);
			String message = "Fund Transfer failed";
			System.out.println(message);
			HttpSession session = request.getSession();
			session.setAttribute("msg", message);
			response.sendRedirect("home.jsp");
		}
		
		
	}

}
