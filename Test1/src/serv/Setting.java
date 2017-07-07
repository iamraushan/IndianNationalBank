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
 * Servlet implementation class Setting
 */
@WebServlet("/Setting")
public class Setting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Setting() {
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
		LoginCheck acc = new LoginCheck();
		String p1= request.getParameter("newpwd");
		String p2= request.getParameter("cnewpwd");
		HttpSession session1=request.getSession(false);
    	String n=(String)session1.getAttribute("uid");
		if( p1.equals(p2))
		{
			if(acc.updateClient("pw", p1, n))
			{
				String message = "Password Changed";
    			System.out.println(message);
    			session1.setAttribute("msg", message);
    			response.sendRedirect("home.jsp");
			}
			else
			{
				String message = "Password not Changed";
    			System.out.println(message);
    			session1.setAttribute("msg", message);
    			response.sendRedirect("home.jsp");
			}
		}
		else
		{
			String message = "Password not Matched";
			System.out.println(message);
			session1.setAttribute("msg", message);
			response.sendRedirect("home.jsp");
		}
	}

}
