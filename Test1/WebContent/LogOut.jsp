<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Logging Out</title>
</head>
 <script type="text/javascript">
    window.oncontextmenu = function () {
		   return false;
		}
    function closewindow()
    {
    	window.close();
    }
    </script>
<body>
<%
HttpSession session1=request.getSession(false);
String n=(String)session1.getAttribute("uid");
n=null;
session1.setAttribute("uid", n);
session1.setAttribute("ok",null);
session1.setAttribute("tmonth",null);
session1.setAttribute("tyear",null);
session1.setAttribute("month",null);
session1.setAttribute("year",null);
session1.setAttribute("ad_cid",null);
session1.setAttribute("Admincid",null);

String admin=(String)session1.getAttribute("aid");

if(admin!=null)
{
	admin=null;
	session1.setAttribute("aid", admin);

	
}


%>
<p align="center">You are logged out , Please close this window for security purposes</p>
<button type="button" onclick="closewindow()">Close Window</button>
</body>
</html>